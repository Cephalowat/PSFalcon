function Get-CrowdScore {
<#
    .SYNOPSIS
        Query CrowdScores

    .PARAMETER FILTER
        The filter expression that should be used to limit the results

    .PARAMETER LIMIT
        The maximum records to return [Default: 2500]

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0]
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Filter,

        [ValidateRange(1,2500)]
        [int]
        $Limit = 2500,

        [int]
        $Offset = 0
    )
    process{
        $Param = @{
            Uri = '/incidents/combined/crowdscores/v1?limit=' + [string] $Limit + '&offset=' + [string] $Offset
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}