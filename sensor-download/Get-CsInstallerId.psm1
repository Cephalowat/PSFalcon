function Get-CsInstallerId {
<#
    .SYNOPSIS
        Search for Falcon Sensor Installer hashes

    .PARAMETER FILTER
        The filter expression that should be used to limit the results

    .PARAMETER LIMIT
        The maximum records to return [Default: 500]

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0]
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Filter,

        [ValidateRange(1,500)]
        [int]
        $Limit = 500,

        [int]
        $Offset = 0
    )
    process{
        $Param = @{
            Uri = '/sensors/queries/installers/v1?limit=' + [string] $Limit + '&offset=' + [string] $Offset
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