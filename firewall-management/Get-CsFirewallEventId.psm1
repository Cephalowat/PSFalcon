function Get-CsFirewallEventId {
<#
    .SYNOPSIS
        Search for Firewall Events in your environment

    .PARAMETER SORT
        Possible order by fields

    .PARAMETER FILTER
        The filter expression that should be used to limit the results
    
    .PARAMETER Q
        The query criteria, which includes all the filter string fields, plus TODO

    .PARAMETER OFFSET
        The offset to start retrieving records from [default: 0]
    
    .PARAMETER AFTER
        The pagination token to continue results after an initial request
    
    .PARAMETER LIMIT
        The maximum records to return [default: 100]

    .PARAMETER ALL
        Repeat request until all results are returned
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Sort,

        [string]
        $Filter,

        [string]
        $Q,

        [int]
        $Offset = 0,

        [string]
        $After,

        [ValidateRange(1,5000)]
        [int]
        $Limit = 100,

        [switch]
        $All
    )
    process{
        $Param = @{
            Uri = '/fwmgr/queries/events/v1?sort=' + $Sort +
                                            '&filter=' + $Filter +
                                            '&q=' + $Q +
                                            '&offset=' + [string] $Offset +
                                            '&limit=' + [string] $Limit
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
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