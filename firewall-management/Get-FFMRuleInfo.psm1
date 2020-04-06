function Get-FFMRuleInfo {
<#
    .SYNOPSIS
        Get firewall rule detail

    .PARAMETER ID
        Rule Id or Family Id
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri = '/fwmgr/entities/rules/v1?ids=' + ($Id -join '&ids=')
            Method = 'get'
            Header = @{
                accept = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}
