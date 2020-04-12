function Edit-CsGroup {
<#
    .SYNOPSIS
        Update Host Groups by specifying the ID of the group and details to update

    .PARAMETER RESOURCES
        An array of Host Group properties
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Resources
    )
    process{
        $Param = @{
            Uri = '/devices/entities/host-groups/v1'
            Method = 'patch'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{ resources = $Resources } | ConvertTo-Json
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}
