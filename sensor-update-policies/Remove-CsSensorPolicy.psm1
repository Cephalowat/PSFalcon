function Remove-CsSensorPolicy {
<#
    .SYNOPSIS
        Delete a set of Sensor Update policies by specifying their IDs

    .PARAMETER ID
        The IDs of the Sensor Update policies to delete
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri = '/policy/entities/sensor-update/v1?ids=' + ($Id -join '&ids=')
            Method = 'delete'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}