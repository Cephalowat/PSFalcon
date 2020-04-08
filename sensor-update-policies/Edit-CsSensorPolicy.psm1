function Edit-CsSensorPolicy {
<#
    .SYNOPSIS
       Update Sensor Update Policies by specifying the ID of the policy and details to update

    .PARAMETER RESOURCES
        An array of Sensor Update policy properties
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [array]
        $Resources
    )
    process{
        $Param = @{
            Uri = '/policy/entities/sensor-update/v2'
            Method = 'patch'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{ resources = $Resources } | ConvertTo-Json -Depth 16
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}