function Get-CsFirewallFieldInfo {
<#
    .SYNOPSIS
        Get firewall field specifications

    .PARAMETER ID
        Specific fields specification ids to retrieve
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri =  '/fwmgr/entities/firewall-fields/v1?ids='
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}