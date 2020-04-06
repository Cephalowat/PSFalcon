function Get-FFMRuleId {
<#
    .SYNOPSIS
        Get firewall rule ids

    .PARAMETER FILTER
        FQL query parameters

    .PARAMETER QUERY
        String query parameters

    .PARAMETER LIMIT
        Maximum number of results [Default: 5000]

    .PARAMETER OFFSET
        Starting position in result set [Default: 0]
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Filter,

        [string]
        $Query,

        [ValidateRange(2,5000)]
        [int]
        $Limit = 5000,

        [int]
        $Offset = 0
    )
    process{
        $Param = @{ 
            Uri = '/fwmgr/queries/rules/v1?limit=' + [string] $Limit + '&offset=' + [string] $Offset
            Method = 'get'
            Header = @{
                accept = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter }
            'Query' { $Param.Uri += '&q=' + $Query }
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}