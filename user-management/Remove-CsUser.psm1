function Remove-CsUser {
<#
    .SYNOPSIS
        Delete a user permanently

    .PARAMETER ID
        ID of a user
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Id
    )
    process{
        $Param = @{
            Uri = '/users/entities/users/v1?user_uuid=' + $Id
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