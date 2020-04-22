function Get-CsFirewallRuleId {
<#
    .SYNOPSIS
        Search for Firewall Rule IDs in your environment

    .PARAMETER ID
        A specific Firewall policy ID to return rules for

    .PARAMETER FILTER
        The filter expression that should be used to limit the results

    .PARAMETER QUERY
        Search all firewall rules for the provided string

    .PARAMETER LIMIT
        The maximum records to return

    .PARAMETER AFTER
        The pagination token to continue results after an initial request

    .PARAMETER OFFSET
        The offset to start retrieving records from

    .PARAMETER ALL
        Repeat request until all results are returned
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    [OutputType([psobject])]
    param(
        [Parameter(ParameterSetName = 'policy')]
        [string]
        $Id,

        [Parameter(ParameterSetName = 'default')]
        [Parameter(ParameterSetName = 'policy')]
        [string]
        $Filter,

        [Parameter(ParameterSetName = 'default')]
        [Parameter(ParameterSetName = 'policy')]
        [string]
        $Query,

        [Parameter(ParameterSetName = 'default')]
        [Parameter(ParameterSetName = 'policy')]
        [ValidateRange(1,5000)]
        [int]
        $Limit,

        [Parameter(ParameterSetName = 'default')]
        [string]
        $After,

        [Parameter(ParameterSetName = 'policy')]
        [int]
        $Offset,

        [Parameter(ParameterSetName = 'default')]
        [Parameter(ParameterSetName = 'policy')]
        [switch]
        $All
    )
    process{
        $Param = @{
            Uri = '/fwmgr/queries/rules/v1?'
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Id' { $Param.Uri = '/fwmgr/queries/policy-rules/v1?id=' + [string] $Id }
            'Filter' { $Param.Uri += '&filter=' + $Filter }
            'Query' { $Param.Uri += '&q=' + $Query }
            'Limit' { $Param.Uri += '&limit=' + [string] $Limit }
            'After' { $Param.Uri += '&after=' + $After }
            'Offset' { $Param.Uri += '&offset=' + [string] $Offset }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        if ($All) {
            Join-CsResult -Activity $MyInvocation.MyCommand.Name -Param $Param
        }
        else {
            Invoke-CsAPI @Param
        }
    }
}