function Get-FFMPolicyId {
<#
    .SYNOPSIS
        Find all firewall policy IDs matching the query with filter

    .PARAMETER ID

    .PARAMETER FILTER
        FQL query specifying the filter parameters

    .PARAMETER QUERY
        Match query criteria, which includes all the filter string fields

    .PARAMETER LIMIT
        The maximum records to return [Default: 5000]

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0]
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Id,

        [string]
        $Filter,

        [string]
        $Query,

        [ValidateRange(2,5000)]
        [int]
        $Limit = 5000,

        [int]
        $Offset = 0
    )
    process{
        $Param = @{ 
            Uri = '/fwmgr/queries/policy-rules/v1?id=' + $Id + '&limit=' + [string] $Limit +
            '&offset=' + [string] $Offset
            Method = 'get'
            Header = @{
                accept = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter }
            'Query' { $Param.Uri += '&q=' + $Query }
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}
