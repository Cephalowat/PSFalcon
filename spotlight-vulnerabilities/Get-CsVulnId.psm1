function Get-CsVulnId {
<#
    .SYNOPSIS
        Search for Vulnerabilities in your environment

    .PARAMETER FILTER
        Filter items using a query in Falcon Query Language (FQL) [default: Created in last 24 hours]

    .PARAMETER LIMIT
        The maximum records to return [default: 500]

    .PARAMETER AFTER
        The pagination token to continue results after an initial request

    .PARAMETER ALL
        Repeat request until all results are returned
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Filter = ("created_timestamp:>'" + (((Get-Date).AddHours(-24)).ToUniversalTime()).ToString(
        'yyyy-MM-ddTHH:mm:ssZ') + "'"),

        [ValidateRange(1,500)]
        [int]
        $Limit = 500,

        [string]
        $After,

        [switch]
        $All
    )
    process{
        $Param = @{
            Uri = '/spotlight/queries/vulnerabilities/v1?limit=' + [string] $Limit + '&filter=' + $Filter
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'After' { $Param.Uri += '&after=' + $After }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        if ($All) {
            Join-CsResult -Activity $MyInvocation.MyCommand.Name -Param $Param
        }
        else {
            Invoke-CsAPI @Param
        }
    }
}