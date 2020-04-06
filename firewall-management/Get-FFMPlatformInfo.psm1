function Get-FFMPlatformInfo {
<#
    .SYNOPSIS
        Get platforms by ID

    .PARAMETER ID
        The IDs of the platforms to retrieve
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
            Uri = '/fwmgr/entities/platforms/v1?ids=' + ($Id -join '&ids=')
            Method = 'get'
            Header = @{
                accept = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}
