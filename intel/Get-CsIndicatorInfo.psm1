function Get-CsIndicatorInfo {
<#
    .SYNOPSIS
        Retrieve info about specific indicators

    .PARAMETER DELETED
        If $true, include both published and deleted indicators in the response [default: $false]

    .PARAMETER FILTER
        Filter your query by specifying FQL filter parameters

    .PARAMETER QUERY
        Perform a generic substring search across all fields

    .PARAMETER LIMIT
        The maximum records to return [default: 50000]

    .PARAMETER OFFSET
        The offset to start retrieving records from [default: 0]

    .PARAMETER ID
        IDs of specific indicators to return
#>
    [CmdletBinding(DefaultParameterSetName = 'combined')]
    [OutputType([psobject])]
    param(
        [Parameter(ParameterSetName = 'combined')]
        [boolean]
        $Deleted = $false,

        [Parameter(ParameterSetName = 'combined')]
        [string]
        $Filter,

        [Parameter(ParameterSetName = 'combined')]
        [string]
        $Query,

        [Parameter(ParameterSetName = 'combined')]
        [ValidateRange(1,50000)]
        [int]
        $Limit = 50000,

        [Parameter(ParameterSetName = 'combined')]
        [int]
        $Offset = 0,

        [Parameter(ParameterSetName = 'entities', Mandatory = $true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri = '/intel/combined/indicators/v1?limit=' + [string] $Limit + '&offset=' + [string] $Offset +
            '&include_deleted=' + $Deleted
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter.ToLower().ToLower() }
            'Query' { $Param.Uri += '&q=' + $Query }
            'Id' { 
                $Param.Uri = '/intel/entities/indicators/GET/v1'
                $Param['Body'] = @{ 'ids' = $Id } | ConvertTo-Json
            }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}