function Get-CsFirewallEventId {
<#
    .SYNOPSIS
        Search for Firewall Event IDs in your environment

    .PARAMETER FILTER
        The filter expression that should be used to limit the results

    .PARAMETER QUERY
        Search all firewall event metadata for the provided string

    .PARAMETER LIMIT
        The maximum records to return

    .PARAMETER AFTER
        The pagination token to continue results after an initial request

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
        $Limit,

        [string]
        $After,

        [switch]
        $All
    )
    process{
        $Param = @{
            Uri = '/fwmgr/queries/events/v1?'
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter }
            'Query' { $Param.Uri += '&q=' + $Query }
            'Limit' { $Param.Uri += '&limit=' + [string] $Limit }
            'After' { $Param.Uri += '&after=' + $After }
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