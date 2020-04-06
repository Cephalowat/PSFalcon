function Get-RtrCloudScriptInfo {
<#
    .SYNOPSIS
        Get custom-scripts based on the ID's given

    .PARAMETER ID
        File IDs
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
            Uri =  '/real-time-response/entities/scripts/v1?ids=' + ($Id -join '&ids=')
            Method = 'get'
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