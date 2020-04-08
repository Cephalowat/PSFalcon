function Get-CsDetectId {
<#
    .SYNOPSIS
        Search for detection IDs

    .PARAMETER FILTER
        The filter expression that should be used to limit the results

    .PARAMETER QUERY
        Search all detection metadata for the provided string

    .PARAMETER LIMIT
        The maximum records to return [Default: 5000]

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0]
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
        $Limit = 5000,

        [int]
        $Offset = 0
    )
    process{
        $Param = @{
            Uri = '/detects/queries/detects/v1?limit=' + [string] $Limit + '&offset=' + [string] $Offset
            Method = 'get'
            Header = @{
                accept = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter }
            'Query' { $Param.Uri += '&q=' + $Query }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}