function Get-CsPreventPolicyInfo {
<#
    .SYNOPSIS
        Search for info about Prevention policies

    .PARAMETER ID
        The IDs of specific Prevention policies to return

    .PARAMETER FILTER
        The filter expression that should be used to limit the results (when IDs are not provided)

    .PARAMETER LIMIT
        The maximum records to return [Default: 500] (when IDs are not provided)

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0] (when IDs are not provided)
#>
    [CmdLetBinding(DefaultParameterSetName = 'Default')]
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(ParameterSetName = 'Id')]
        [array]
        $Id,

        [Parameter(ParameterSetName = 'noId')]
        [string]
        $Filter,

        [Parameter(ParameterSetName = 'noId')]
        [ValidateRange(2,500)]
        [int]
        $Limit = 500,

        [Parameter(ParameterSetName = 'noId')]
        [int]
        $Offset = 0
    )
    process{
        $Param = @{
            Uri = '/policy/combined/prevention/v1?limit=' + [string] $Limit + '&offset=' + [string] $Offset
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter }
            'Id' { $Param['Uri'] = '/policy/entities/prevention/v1?ids=' + ($Id -join '&ids=') }
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}