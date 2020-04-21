function Edit-CsFirewallRuleGroup {
<#
    .SYNOPSIS
        Edit an existing Firewall Rule Group

    .PARAMETER COMMENT
        Optional audit log comment

    .PARAMETER BODY
        A hashtable of Rule Group properties
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Comment,

        [Parameter(Mandatory = $true)]
        [hashtable]
        $Body
    )
    process{
        $Param = @{
            Uri = '/fwmgr/entities/rule-groups/v1'
            Method = 'patch'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = ConvertTo-Json $Body -Depth 8
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}