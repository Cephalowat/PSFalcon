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
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [array]
        $Id,

        [string]
        $Filter,

        [ValidateRange(2,500)]
        [int]
        $Limit = 500,

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
                $Param['Uri'] = '/sensors/entities/installers/v1?ids=' + ($Id -join '&ids=')
            }
            'Verbose' { $Param['Verbose'] = $true }
            default { 
                $Param['Uri'] = '/sensors/combined/installers/v1?limit=' + [string] $Limit +
                '&offset=' + [string] $Offset

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