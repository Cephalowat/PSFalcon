function Get-CsHostId {
<#
    .SYNOPSIS
        Search for hosts in your environment

    .PARAMETER FILTER
        The filter expression that should be used to limit the results

    .PARAMETER LIMIT
        The maximum records to return [default: 5000]

    .PARAMETER OFFSET
        The offset to page from, for the next result set

    .PARAMETER HIDDEN
        Switch to toggle a search of 'Hidden' devices

    .PARAMETER ALL
        Repeat request until all results are returned
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Filter,

        [ValidateRange(1,5000)]
        [int]
        $Limit = 5000,

        [string]
        $Offset,

        [switch]
        $Hidden,

        [switch]
        $All
    )
    process{
        $Param = @{
            Uri = '/devices/queries/devices-scroll/v1?limit=' + [string] $Limit
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Hidden' { $Param.Uri = '/devices/queries/devices-hidden/v1?limit=' + [string] $Limit }
            'Filter' { $Param.Uri += '&filter=' + $Filter.ToLower() }
            'Offset' { $Param.Uri += '&offset=' + $Offset }
            'Debug' { $Param['Debug'] = $true }
            'Verbose' { $Param['Verbose'] = $true }
        }
        if ($All) {
            Join-CsResult -Activity $MyInvocation.MyCommand.Name -Param $Param
        }
        else {
            Invoke-CsAPI @Param
        }
    }
}