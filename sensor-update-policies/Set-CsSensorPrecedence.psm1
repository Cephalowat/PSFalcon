function Set-CsSensorPrecedence {
<#
    .SYNOPSIS
        Sets the precedence of Sensor Update policies based on the order of IDs specified in the request. The
        first ID specified will have the highest precedence and the last ID specified will have the lowest.
        You must specify all non-Default Policies for a platform when updating precedence.

    .PARAMETER PLATFORM
        The operating system platform the Sensor Update policies are assigned to

    .PARAMETER ID
        An array of one or more Sensor Update policy IDs
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet('Android', 'iOS', 'Linux', 'Mac', 'Windows')]
        [string]
        $Platform,

        [Parameter(Mandatory=$true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri = '/policy/entities/sensor-update-precedence/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{
                'ids' = $Id
                'platform_name' = $Platform
            } | ConvertTo-Json
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}