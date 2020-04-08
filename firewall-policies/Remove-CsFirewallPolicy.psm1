function Remove-CsFirewallPolicy {
<#
    .SYNOPSIS
        Delete a set of Firewall policies by specifying their IDs

    .PARAMETER ID
        The IDs of the Firewall policies to delete
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
            Uri = '/policy/entities/firewall/v1?ids=' + ($Id -join '&ids=')
            Method = 'delete'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}