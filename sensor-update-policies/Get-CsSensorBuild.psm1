function Get-CsSensorBuild {
<#
    .SYNOPSIS
        Retrieve available builds for use with Sensor Update policies

    .PARAMETER PLATFORM
        The operating system to return builds for
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Linux', 'Mac', 'Windows')]
        [string]
        $Platform
    )
    process{
        $Param = @{
            Uri = '/policy/combined/sensor-update-builds/v1?platform=' + $Platform
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}