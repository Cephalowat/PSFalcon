function Remove-RtrFile {
<#
    .SYNOPSIS
        Delete a 'put' file based on the ID given. Can only delete one file at a time

    .PARAMETER ID
        File ID
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
            Uri = '/real-time-response/entities/put-files/v1?ids=' + $Id
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
        Invoke-CsAPI @Param
    }
}