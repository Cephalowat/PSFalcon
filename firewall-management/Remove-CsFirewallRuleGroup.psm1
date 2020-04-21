function Remove-CsFirewallRuleGroup {
<#
    .SYNOPSIS
        Delete a Firewall Rule Groups by ID

    .PARAMETER ID
        The IDs of the Firewall Rule Groups to delete

    .PARAMETER COMMENT
        Optional audit log comment
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Id,

        [string]
        $Comment
    )
    process{
        $Param = @{
            Uri = '/policy/entities/prevention/v1?ids=' + ($Id -join '&ids=')
            Method = 'delete'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Comment' { $Param.Uri += '&comment=' + $Comment}
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}