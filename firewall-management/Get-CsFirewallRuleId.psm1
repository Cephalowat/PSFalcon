function Get-CsFirewallRuleId {
<#
    .SYNOPSIS
        Search for Firewall Rule IDs in your environment

    .PARAMETER FILTER
        The filter expression that should be used to limit the results

    .PARAMETER QUERY
        Search all firewall rules for the provided string

    .PARAMETER LIMIT
        The maximum records to return [default: 5000]

    .PARAMETER OFFSET
        The offset to start retrieving records from [default: 0]

    .PARAMETER ALL
        Repeat request until all results are returned
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Filter,

        [string]
        $Query,

        [ValidateRange(1,5000)]
        [int]
        $Limit = 5000,

        [string]
        $Offset = 0,

        [switch]
        $All
    )
    process{
        $Param = @{
            Uri = '/fwmgr/queries/rules/v1?&limit=' + [string] $Limit + '&offset=' + [string] $Offset
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter }
            'Query' { $Param.Uri += '&q=' + $Query }
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