function Stop-CsContain {
<#
    .SYNOPSIS
        Lift containment on hosts. Returns network communications to normal

    .PARAMETER ID
        An array of one or more agent IDs to release from containment
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
            Uri = '/devices/entities/devices-actions/v2?action_name=lift_containment'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{ 'ids' = $Id } | ConvertTo-Json
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}