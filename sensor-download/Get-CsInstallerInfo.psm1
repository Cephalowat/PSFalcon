function Get-CsInstallerInfo {
<#
    .SYNOPSIS
        Search for info about Falcon Sensor Installers

    .PARAMETER FILTER
        The filter expression that should be used to limit the results

    .PARAMETER LIMIT
        The maximum records to return [Default: 500]

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0]

    .PARAMETER ID
        Hashes of specific Falcon Sensor installers to return
#>
    [CmdletBinding(DefaultParameterSetName = 'combined')]
    [OutputType([psobject])]
    param(
        [Parameter(ParameterSetName = 'combined')]
        [string]
        $Filter,

        [Parameter(ParameterSetName = 'combined')]
        [ValidateRange(1,500)]
        [int]
        $Limit = 500,

        [Parameter(ParameterSetName = 'combined')]
        [int]
        $Offset = 0,

        [Parameter(ParameterSetName = 'entities')]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri = '/sensors/combined/installers/v1?limit=' + [string] $Limit + '&offset=' + [string] $Offset
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
                $Param['Uri'] = '/sensors/entities/installers/v1?ids=' + ($Id -join '&ids=')
            }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}