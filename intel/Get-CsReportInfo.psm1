function Get-CsReportInfo {
<#
    .SYNOPSIS
        Retrieve info about specific reports

    .PARAMETER ID
        The IDs of the reports you want to retrieve

    .PARAMETER FILTER
        Filter your query by specifying FQL filter parameters (when IDs are not provided)

    .PARAMETER QUERY
        Perform a generic substring search across all fields (when IDs are not provided)

    .PARAMETER LIMIT
        The maximum records to return [Default: 500] (when IDs are not provided)

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0] (when IDs are not provided)

    .PARAMETER FIELD
        The fields to return, or a predefined set of fields in the form of the collection
        name surrounded by two underscores [Default: __basic__]
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [array]
        $Id,

        [string]
        $Filter,

        [string]
        $Query,

        [ValidateRange(2,500)]
        [int]
        $Limit = 500,

        [int]
        $Offset = 0,

        [array]
        $Field = @('__basic__')
    )
    process{
        $Param = @{
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Id' { 
                $Param['Uri'] = '/intel/entities/reports/v1?ids=' + ($Id -join '&ids=') +
                '&fields=' + ($Field -join '&fields=')
            }
            'Verbose' { $Param['Verbose'] = $true }
            default { 
                $Param['Uri'] = '/intel/combined/reports/v1?limit=' + [string] $Limit +
                '&offset=' + [string] $Offset + '&fields=' + ($Field -join '&fields=')

                if ($Filter) {
                    $Param.Uri += '&filter=' + $Filter
                }
                if ($Query) {
                    $Param.Uri += '&q=' + $Query
                }
            }
        }
        Invoke-FalconAPI @Param
    }
}