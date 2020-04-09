function Invoke-FalconAPI {
<#
    .SYNOPSIS
        Invoke-RestMethod wrapper used by PSFalcon

    .PARAMETER URI
        Partial URI for Invoke-RestMethod request (matched with $Falcon.host)

    .PARAMETER METHOD
        Method for Invoke-RestMethod request

    .PARAMETER HEADER
        A hashtable of Invoke-RestMethod header parameters

    .PARAMETER BODY
        Body for Invoke-RestMethod request

    .PARAMETER FORM
        Form for Invoke-RestMethod request

    .PARAMETER OUTFILE
        Outfile destination path for Invoke-RestMethod request
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $Uri,

        [Parameter(Mandatory = $true)]
        [string]
        $Method,

        [Parameter(Mandatory = $true)]
        [hashtable]
        $Header,

        [string]
        $Body,

        [System.Collections.IDictionary]
        $Form,

        [string]
        $Outfile
    )
    begin{
        # If missing or expired, request token
        if ($Uri -notmatch '/oauth2/token') {
            if ((-not($Falcon.token)) -or (($Falcon.expires) -le (Get-Date).AddSeconds(-5))) {
                Get-CsToken
            }
        }
    }
    process{
        # Base parameters
        $Param = @{
            Uri = $Falcon.host + $Uri
            Method = $Method
            Header = @{}
            ResponseHeadersVariable = 'Response'
        }
        # Add Invoke-FalconAPI arguments
        switch ($PSBoundParameters.Keys) {
            'Body' { $Param['Body'] = $Body }
            'Form' { $Param['Form'] = $Form }
            'Outfile' { $Param['Outfile'] = $Outfile }
        }
        # Add header values from PSFalcon command
        ($Header.keys).foreach{
            $Param.Header[$_] = $Header.$_
        }
        # Add OAuth2 bearer token
        if ($Falcon.token) {
            $Param.Header['authorization'] = ($Falcon.token)
        }
        # Add proxy (set by Get-CsToken)
        if ($Falcon.proxy) {
            $Param['Proxy'] = $Falcon.proxy
            $Param['ProxyUseDefaultCredentials'] = $true
        }
        # Make request
        $Output = try {
            Invoke-RestMethod @Param
        }
        # Output error
        catch {
            if ($_.ErrorDetails.Message) {
                if ($_.ErrorDetails.Message -match 'meta') {
                    $_.ErrorDetails.Message | ConvertFrom-Json
                }
                else {
                    $_.ErrorDetails.Message
                }
            }
            elseif ($_.Exception) {
                $_.Exception
            }
        }
        # Output trace_id
        if ($Output.meta.trace_id) {
            Write-Verbose ("trace_id: " + [string] $Output.meta.trace_id)
        }
        # Check for rate limiting
        if ($Response.'X-Ratelimit-RetryAfter') {
            $Wait = (([int] $Response.'X-Ratelimit-RetryAfter') - ([int] (Get-Date -UFormat %s)) + 1)

            Write-Verbose ("Rate limited: " + [string] $Wait + " seconds")

            Start-Sleep -Seconds $Wait
        }
        # Add response headers for verbose and debug
        if (($PSBoundParameters.Verbose -eq $true) -or ($PSBoundParameters.Debug -eq $true)) {
            $Output | Add-Member -MemberType NoteProperty -Name header -Value $Response
        }
        # Output json of result and include inputs for debug
        if (($PSBoundParameters.Debug -eq $true) -and ($Output)) {
            $Output | Add-Member -MemberType NoteProperty -Name PSFalcon -Value ([PSCustomObject] @{
                uri = $Param.Uri
                method = $Param.Method
                accept = $Param.Header.accept
                'content-type' = $Param.Header.'content-type'
                body = $Param.Body
                form = $Param.Form
            })
            $Output | ConvertTo-Json -Depth 32 | Out-File -FilePath ('.\' + $Output.meta.trace_id + '.json')
        }
    }
    end {
        if ($Output) {
            $Output
        }
    }
}