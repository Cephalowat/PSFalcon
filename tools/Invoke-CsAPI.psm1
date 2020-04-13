function Invoke-CsAPI {
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
    param(
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
        }
        # Add Invoke-CsAPI arguments
        switch ($PSBoundParameters.Keys) {
            'Body' { $Param['Body'] = $Body }
            'Form' { $Param['Form'] = $Form }
            'Outfile' { $Param['Outfile'] = $Outfile }
        }
        # Add header values from PSFalcon command
        foreach ($Key in $Header.keys) {
            $Param.Header[$Key] = $Header.$Key
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
        $Request = try {
            Invoke-WebRequest @Param
        }
        # Capture error
        catch {
            if ($_.ErrorDetails.Message) {
                $_.ErrorDetails.Message
            }
            else {
                $_.Exception
            }
        }
        # Debug output
        if (($PSBoundParameters.Debug -eq $true) -and ($Request)) {
            $Output = [PSCustomObject] @{
                code = $Request.StatusCode
                description = $Request.StatusDescription
                headers = $Request.headers
            }
            # Add Content
            foreach ($Item in ($Request.Content | ConvertFrom-Json).psobject.properties) {
                $Output | Add-Member -MemberType NoteProperty -Name $Item.name -Value $Item.value
            }
            # Add Inputs
            $Output | Add-Member -MemberType NoteProperty -Name input -Value ([PSCustomObject] @{
                uri = $Param.Uri
                method = $Param.Method
                accept = $Param.Header.accept
                'content-type' = $Param.Header.'content-type'
                body = $Param.Body
                form = $Param.Form
            })
            # Save to Json
            $Output | ConvertTo-Json -Depth 64 |
            Out-File -FilePath ('.\' + (Get-Date -Format FileDateTime) + '-' + $Output.meta.trace_id + '.json')
        }
        # Check for rate limiting
        if ($Request.Headers.'X-Ratelimit-RetryAfter') {
            $Wait = (([int] $Request.Headers.'X-Ratelimit-RetryAfter') - ([int] (Get-Date -UFormat %s)) + 1)

            Write-Verbose ("Rate limited: " + [string] $Wait + " seconds")

            Start-Sleep -Seconds $Wait
        }
    }
    end {
        if ($Request.Content) {
            $Request | ConvertFrom-Json
        }
        else {
            $Request
        }
    }
}