function Add-CsUserRole {
<#
    .SYNOPSIS
        Assign one or more roles to an existing user

    .PARAMETER ID
        ID of a user

    .PARAMETER ROLE
        An array of one or more roles to assign to the user
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $Id,

        [Parameter(Mandatory=$true)]
        [array]
        $Role
    )
    process{
        $Param = @{
            Uri = '/user-roles/entities/user-roles/v1?user_uuid=' + $Id
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{
                roleIds = $Role
            } | ConvertTo-Json
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}