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
        # Add UseBasicParsing for older PowerShell versions
        if ($PSVersionTable.PSVersion.Major -lt 6) {
            $Param['UseBasicParsing'] = $true
        }
        # Remove progress bar to speed up file downloads (Invoke-WebRequest bug)
        $ProgressPreference = 'SilentlyContinue'

        # Make request
        $Request = try {
            Invoke-WebRequest @Param
        }
        # Capture error
        catch {
            if ($_.ErrorDetails) {
                $_.ErrorDetails | ConvertFrom-Json
            }
            else {
                $_.Exception
            }
        }
        # Check for rate limiting
        if ($Request.Headers.'X-Ratelimit-RetryAfter') {
            $Wait = (([int] $Request.Headers.'X-Ratelimit-RetryAfter') - ([int] (Get-Date -UFormat %s)) + 1)

            Write-Verbose ('Rate limit exceeded, sleeping ' + [string] $Wait + ' second(s)')

            Start-Sleep -Seconds $Wait
        }
    }
    end {
        # Output debug as Json
        if ($PSBoundParameters.Debug -eq $true) {
            if ($Request.Content) {
                [PSCustomObject] @{
                    headers = $Request.Headers
                    content = $Request.Content | ConvertFrom-Json
                } | ConvertTo-Json -Depth 32
            }
            else {
                $Request | ConvertTo-Json -Depth 32
            }
        }
        # Output successful request object
        elseif ($Request.Content) {
            $Request | ConvertFrom-Json
        }
        # Catch-all output
        else {
            $Request
        }
    }
}