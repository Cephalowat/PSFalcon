function Get-CsUserRole {
<#
    .SYNOPSIS
        Show roles assigned to a user

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
            Uri = '/user-roles/queries/user-role-ids-by-user-uuid/v1?user_uuid=' + $Id
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