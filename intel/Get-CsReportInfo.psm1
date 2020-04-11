function Get-CsReportInfo {
<#
    .SYNOPSIS
        Retrieve info about specific reports

    .PARAMETER FILTER
        Filter your query by specifying FQL filter parameters

    .PARAMETER QUERY
        Perform a generic substring search across all fields

    .PARAMETER LIMIT
        The maximum records to return [Default: 500]

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0]

    .PARAMETER ID
        IDs of the reports you want to retrieve

    .PARAMETER FIELD
        The fields to return, or a predefined set of fields in the form of the collection
        name surrounded by two underscores [Default: '__basic__']
#>
    [CmdletBinding(DefaultParameterSetName = 'combined')]
    [OutputType([psobject])]
    param(
        [Parameter(ParameterSetName = 'combined')]
        [string]
        $Filter,

        [Parameter(ParameterSetName = 'combined')]
        [string]
        $Query,

        [Parameter(ParameterSetName = 'combined')]
        [ValidateRange(1,500)]
        [int]
        $Limit = 500,

        [Parameter(ParameterSetName = 'combined')]
        [int]
        $Offset = 0,

        [Parameter(ParameterSetName = 'entities', Mandatory = $true)]
        [array]
        $Id,

        [Parameter(ParameterSetName = 'combined')]
        [Parameter(ParameterSetName = 'entities')]
        [array]
        $Field = @('__basic__')
    )
    process{
        $Param = @{
            Uri = '/intel/combined/reports/v1?limit=' + [string] $Limit + '&offset=' + [string] $Offset +
            '&fields=' + ($Field -join '&fields=')
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter.ToLower() }
            'Query' { $Param.Uri += '&q=' + $Query }
            'Id' { 
                $Param.Uri = '/intel/entities/reports/v1?ids=' + ($Id -join '&ids=') +
                '&fields=' + ($Field -join '&fields=')
            }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}