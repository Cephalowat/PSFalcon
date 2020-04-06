function Remove-CsSensorGroup {
<#
    .SYNOPSIS
        Remove a Host Group from a Sensor Update policy

    .PARAMETER ID
        The Sensor Update policy ID

    .PARAMETER GROUP
        The Host Group ID
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateLength(32,32)]
        [string]
        $Id,

        [Parameter(Mandatory=$true)]
        [ValidateLength(32,32)]
        [string]
        $Group
    )
    process{
        $Param = @{
            Uri = '/policy/entities/sensor-update-actions/v1?action_name=remove-host-group'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{
                'action_parameters' = @(
                    @{
                        'name' = 'group_id'
                        'value' = $Group
                    }
                )
            'ids' = @($Id)
            } | ConvertTo-Json
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}