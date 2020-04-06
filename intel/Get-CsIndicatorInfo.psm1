function Get-CsIndicatorInfo {
<#
    .SYNOPSIS
        Retrieve info about specific indicators

    .PARAMETER ID
        The IDs of the indicators you want to retrieve

    .PARAMETER DELETED
        If $true, include both published and deleted indicators in the response [Default: $false]

    .PARAMETER FILTER
        Filter your query by specifying FQL filter parameters (when IDs are not provided)

    .PARAMETER QUERY
        Perform a generic substring search across all fields (when IDs are not provided)

    .PARAMETER LIMIT
        The maximum records to return [Default: 150000] (when IDs are not provided)

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0] (when IDs are not provided)
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [array]
        $Id,

        [boolean]
        $Deleted = $false,

        [string]
        $Filter,

        [string]
        $Query,

        [ValidateRange(2,150000)]
        [int]
        $Limit = 150000,

        [int]
        $Offset = 0
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
                $Param['Uri'] = '/intel/entities/indicators/GET/v1'
                $Param['Body'] = @{ 'ids' = $Id } | ConvertTo-Json
            }
            'Verbose' { $Param['Verbose'] = $true }
            default { 
                $Param['Uri'] = '/intel/combined/indicators/v1?limit=' + [string] $Limit +
                '&offset=' + [string] $Offset + '&include_deleted=' + $Deleted

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