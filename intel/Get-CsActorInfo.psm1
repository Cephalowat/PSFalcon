function Get-CsActorInfo {
<#
    .SYNOPSIS
        Retrieve specific actors

    .PARAMETER FILTER
        Filter your query by specifying FQL filter parameters

    .PARAMETER QUERY
        Perform a generic substring search across all fields

    .PARAMETER LIMIT
        The maximum records to return [Default: 500]

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0]

    .PARAMETER ID
        IDs of specific actors to return

    .PARAMETER FIELD
        The fields to return, or a predefined set of fields in the form of the collection
        name surrounded by two underscores [Default: __basic__]
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

        [Parameter(ParameterSetName = 'entities', Mandatory=$true)]
        [array]
        $Id,

        [Parameter(ParameterSetName = 'combined')]
        [Parameter(ParameterSetName = 'entities')]
        [array]
        $Field = @('__basic__')
    )
    process{
        $Param = @{
            Uri = '/intel/combined/actors/v1?limit=' + [string] $Limit + '&offset=' + [string] $Offset +
            '&fields=' + ($Field -join '&fields=')
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter }
            'Query' { $Param.Uri += '&q=' + $Query }
            'Id' { 
                $Param.Uri = '/intel/entities/actors/v1?ids=' + ($Id -join '&ids=') +
                '&fields=' + ($Field -join '&fields=')
            }
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}