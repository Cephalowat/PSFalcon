function Remove-CsUserRole {
<#
    .SYNOPSIS
        Revoke one or more roles from a user

    .PARAMETER ID
        ID of a user

    .PARAMETER ROLE
        An array of one or more roles to remove from the user
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Id,

        [Parameter(Mandatory = $true)]
        [array]
        $Role
    )
    process{
        $Param = @{
            Uri = '/user-roles/entities/user-roles/v1?user_uuid=' + $Id + '&ids=' + ($Role -join '&ids=')
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