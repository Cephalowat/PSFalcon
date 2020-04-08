function Get-CsGroupMemberId {
<#
    .SYNOPSIS
        Search for members of a Host Group in your environment

    .PARAMETER ID
        The ID of the Host Group to search for members of

    .PARAMETER FILTER
        The filter expression that should be used to limit the results

    .PARAMETER LIMIT
        The maximum records to return [Default: 5000]

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0]
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateLength(32,32)]
        [string]
        $Id,

        [string]
        $Filter,

        [ValidateRange(1,5000)]
        [int]
        $Limit = 5000,

        [int]
        $Offset = 0
    )
    process{
        $Param = @{
            Uri = '/devices/queries/host-group-members/v1?id=' + $Id + '&limit=' + [string] $Limit +
            '&offset=' + [string] $Offset
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter }
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}