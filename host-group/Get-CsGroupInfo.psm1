function Get-CsGroupInfo {
    <#
    .SYNOPSIS
        Search for info about Host Groups

    .PARAMETER ID
        The IDs of specific host groups to return

    .PARAMETER FILTER
        The filter expression that should be used to limit the results (when IDs are not provided)

    .PARAMETER LIMIT
        The maximum records to return [Default: 500] (when IDs are not provided)

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0] (when IDs are not provided)
#>
    [CmdLetBinding(DefaultParameterSetName = 'Default')]
    [OutputType([psobject])]
    param(
        [Parameter(ParameterSetName = 'Id')]
        [array]
        $Id,

        [Parameter(ParameterSetName = 'noId')]
        [string]
        $Filter,

        [Parameter(ParameterSetName = 'noId')]
        [ValidateRange(2, 500)]
        [int]
        $Limit = 500,

        [Parameter(ParameterSetName = 'noId')]
        [int]
        $Offset = 0
    )
    process {
        $Param = @{
            Method = 'get'
            Header = @{
                accept         = 'application/json'
                'content-type' = 'application/json'
            }
            Uri    = '/devices/combined/host-groups/v1?limit=' + [string] $Limit + '&offset=' + [string] $Offset
        }
        Switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter }
            'Id' { $Param['Uri'] = '/devices/entities/host-groups/v1?ids=' + ($Id -join '&ids=') }
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}
