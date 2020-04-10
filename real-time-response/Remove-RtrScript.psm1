function Remove-RtrScript {
<#
    .SYNOPSIS
        Delete a custom-script based on the ID given. Can only delete one file at a time

    .PARAMETER ID
        Script ID
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [ValidateLength(65,65)]
        [string]
        $Id
    )
    process{
        $Param = @{
            Uri = '/real-time-response/entities/scripts/v1?ids=' + $Id
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