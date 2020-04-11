function Remove-CsGroup {
<#
    .SYNOPSIS
        Delete a set of Host Groups by specifying their IDs

    .PARAMETER ID
        An array of IDs of the Host Groups to delete
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri = '/devices/entities/host-groups/v1?ids=' + ($Id -join '&ids=')
            Method = 'delete'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}