function New-CsGroup {
<#
    .SYNOPSIS
        Create Host Groups by specifying details about the group to create

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
            Method = 'post'
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
        Invoke-FalconAPI @Param
    }
}