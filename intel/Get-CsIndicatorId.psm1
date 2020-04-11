function Get-CsIndicatorId {
<#
    .SYNOPSIS
        Get indicators IDs

    .PARAMETER DELETED
        If $true, include both published and deleted indicators in the response [Default: $false]

    .PARAMETER FILTER
        Filter your query by specifying FQL filter parameters

    .PARAMETER QUERY
        Perform a generic substring search across all fields

    .PARAMETER LIMIT
        The maximum records to return [Default: 5000]

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0]
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [boolean]
        $Deleted = $false,

        [string]
        $Filter,

        [string]
        $Query,

        [ValidateRange(1,5000)]
        [int]
        $Limit = 5000,

        [int]
        $Offset = 0
    )
    process{
        $Param = @{
            Uri = '/intel/queries/indicators/v1?limit=' + [string] $Limit +
            '&offset=' + [string] $Offset + '&include_deleted=' + $Deleted
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter.ToLower() }
            'Query' { $Param.Uri += '&q=' + $Query }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}