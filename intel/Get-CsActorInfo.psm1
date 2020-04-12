function Get-CsActorInfo {
<#
    .SYNOPSIS
        Retrieve specific actors

    .PARAMETER FILTER
        Filter your query by specifying FQL filter parameters

    .PARAMETER QUERY
        Perform a generic substring search across all fields

    .PARAMETER LIMIT
        The maximum records to return [default: 500]

    .PARAMETER OFFSET
        The offset to start retrieving records from [default: 0]

    .PARAMETER ALL
        Repeat request until all results are returned

    .PARAMETER ID
        IDs of specific actors to return

    .PARAMETER FIELD
        The fields to return, or a predefined set of fields in the form of the collection
        name surrounded by two underscores [default: __basic__]
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

        [Parameter(ParameterSetName = 'combined')]
        [switch]
        $All,

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
                $Param.Uri = '/intel/entities/actors/v1?fields=' + ($Field -join '&fields=') + '&ids='
            }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        if ($Id) {
            Split-CsArray -Activity $MyInvocation.MyCommand.Name -Param $Param -Id $Id
        }
        elseif ($All) {
            Join-CsResult -Activity $MyInvocation.MyCommand.Name -Param $Param
        }
        else {
            Invoke-CsAPI @Param
        }
    }
}