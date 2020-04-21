function Get-CsFirewallPolicySettings {
<#
    .SYNOPSIS
        Returns basic Firewall Policy settings

    .PARAMETER ID
        Target Firewall Policy IDs
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri =  '/fwmgr/entities/policies/v1?ids='
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
        Split-CsArray -Activity $MyInvocation.MyCommand.Name -Param $Param -Id $Id
    }
}