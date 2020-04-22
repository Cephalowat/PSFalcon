function Get-CsFirewallPlatformInfo {
<#
    .SYNOPSIS
        Get firewall platform names

    .PARAMETER ID
        Specific platform ids to return
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri =  '/fwmgr/entities/platforms/v1?ids='
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Id' { $Param.Uri += ($Id -join '&ids=') }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}