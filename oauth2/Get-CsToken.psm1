function Get-CsToken {
<#
    .SYNOPSIS
        Request an OAuth2 access token

    .PARAMETER ID
        Client Id

    .PARAMETER SECRET
        Client Secret

    .PARAMETER CID
        Specific CID to target in MSSP configurations

    .PARAMETER CLOUD
        CrowdStrike destination cloud [default: 'US']

    .PARAMETER PROXY
        Web proxy address
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Id,

        [string]
        $Secret,

        [string]
        $CID,

        [ValidateSet('EU', 'US', 'US-2', 'USFed')]
        [string]
        $Cloud = 'US',

        [string]
        $Proxy
    )
    begin{
        # Create $Falcon for logging and caching credentials
        if (-not($Falcon)) {
            [System.Collections.Hashtable] $Global:Falcon = @{}
        }
        # Set $Falcon.host based on $Cloud
        switch ($Cloud) {
            'EU' { $Falcon['host'] = 'https://api.eu-1.crowdstrike.com' }
            'US' { $Falcon['host'] = 'https://api.crowdstrike.com' }
            'US-2' { $Falcon['host'] = 'https://api.us-2.crowdstrike.com' }
            'USFed' { $Falcon['host'] = 'https://api.laggar.gcw.crowdstrike.com' }
        }
        # Capture parameter input
        switch ($PSBoundParameters.Keys) {
            'Id' { $Falcon['id'] = $Id }
            'Secret' { $Falcon['secret'] = $Secret | ConvertTo-SecureString -AsPlainText -Force }
            'CID' { $Falcon['cid'] = [string] $CID }
            'Proxy' { $Falcon['proxy'] = $Proxy }
        }
        # If missing, prompt for Id/Secret
        if (-not($Falcon.id)) {
            $Falcon['id'] = Read-Host 'Client Id'
        }
        if (-not($Falcon.secret)) {
            $Falcon['secret'] = Read-Host 'Client Secret' -AsSecureString
        }
        # Clear existing member CID if $CID was not defined
        if ((-not($CID)) -and ($Falcon.cid)) {
            $Falcon.remove('cid')
        }
        # Clear existing proxy if $Proxy was not defined
        if ((-not($Proxy)) -and ($Falcon.proxy)) {
            $Falcon.remove('proxy')
        }
    }
    process{
        # Set base parameters
        $Param = @{
            Uri = '/oauth2/token'
            Method = 'post'
            Header = @{
                accept = 'application/json'
            }
            Body = 'client_id=' + [string] $Falcon.id + '&client_secret='
        }
        # Add secret to token request
        if ($PSVersionTable.PSVersion.Major -gt 5) {
            $Param.Body += ($Falcon.secret | ConvertFrom-SecureString -AsPlainText)
        } else {
            $Param.Body += ([System.Runtime.InteropServices.Marshal]::PtrToStringAuto(
            [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Falcon.secret)))
        }
        # Add member CID, if defined
        if ($Falcon.cid) {
            $Param.Body += '&member_cid=' + [string] $Falcon.cid
        }
        $Request = Invoke-CsAPI @Param

        # Save token and expiration time to $Falcon
        if ($Request.access_token) {
            $Falcon['expires'] = ((Get-Date).addSeconds($Request.expires_in))
            $Falcon['token'] = [string] $Request.token_type + ' ' + [string] $Request.access_token
        }
        else {
            # Erase $Falcon if token request fails
            Remove-Variable -Name Falcon -Scope Global

            # Output error
            if ($Request.errors) {
                $Request.errors
            }
            else {
                $Request
            }
        }
    }
}