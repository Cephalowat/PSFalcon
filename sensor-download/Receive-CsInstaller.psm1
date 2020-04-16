function Receive-CsInstaller {
<#
    .SYNOPSIS
        Download a specific Falcon Sensor Installer

    .PARAMETER ID
        Falcon Sensor Installer hash

    .PARAMETER PATH
        Destination path
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateLength(64,64)]
        [string]
        $Id,

        [Parameter(Mandatory = $true)]
        [string]
        $Path
    )
    process{
        $Param = @{
            Uri = '/sensors/entities/download-installer/v1?id=' + $Id
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            OutFile = $Path
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}