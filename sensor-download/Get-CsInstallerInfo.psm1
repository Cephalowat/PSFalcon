function Get-CsInstallerInfo {
<#
    .SYNOPSIS
        Search for info about Falcon Sensor Installers

    .PARAMETER ID
        The hashes of specific Falcon Sensor Installers to return

    .PARAMETER FILTER
        The filter expression that should be used to limit the results (when hashes are not provided)

    .PARAMETER LIMIT
        The maximum records to return [Default: 500] (when hashes are not provided)

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0] (when hashes are not provided)
#>
    [CmdletBinding(DefaultParameterSetName = 'combined')]
    [OutputType([psobject])]
    param(
        [Parameter(ParameterSetName = 'entities')]
        [array]
        $Id,
        
        [Parameter(ParameterSetName = 'combined')]
        [string]
        $Filter,

        [Parameter(ParameterSetName = 'combined')]
        [ValidateRange(1,500)]
        [int]
        $Limit = 500,

        [Parameter(ParameterSetName = 'combined')]
        [int]
        $Offset = 0
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
            'Id' { 
                $Param['Uri'] = '/sensors/entities/installers/v1?ids=' + ($Id -join '&ids=')
            }
            'Verbose' { $Param['Verbose'] = $true }
            'Filter' { $Param.Uri += '&filter=' + $Filter }
            'Query' { $Param.Uri += '&q=' + $Query }
        }
        Invoke-FalconAPI @Param
    }
}