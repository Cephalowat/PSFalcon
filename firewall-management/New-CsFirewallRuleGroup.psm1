function New-CsFirewallRuleGroup {
<#
    .SYNOPSIS
        Create a new Firewall Rule Group

    .PARAMETER CLONE
        A Rule Group ID to copy rules from

    .PARAMETER LIBRARY
        If toggled, rules will be cloned from the CrowdStrike Firewall Rule Groups Library

    .PARAMETER COMMENT
        Optional audit log comment

    .PARAMETER BODY
        A hashtable of Rule Group properties
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Clone,

        [switch]
        $Library,

        [string]
        $Comment,

        [Parameter(Mandatory = $true)]
        [hashtable]
        $Body
    )
    process{
        $Param = @{
            Uri = '/fwmgr/entities/rule-groups/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
                'X-CS-USERNAME' = 'api-client-id:' + [string] $Falcon.id
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