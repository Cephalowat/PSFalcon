function Edit-CsUser {
<#
    .SYNOPSIS
        Modify an existing user's first or last name

    .PARAMETER ID
        ID of a user

    .PARAMETER FIRST
        The user's first name

    .PARAMETER LAST
        The user's last name
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Id,

        [string]
        $First,

        [string]
        $Last
    )
    process{
        $Param = @{
            Uri = '/users/entities/users/v1?user_uuid=' + $Id
            Method = 'patch'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{}
        }
        switch ($PSBoundParameters.Keys) {
            'First' { $Param.Body['firstName'] = $First }
            'Last' {$Param.Body['lastName'] = $Last }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        $Param.Body = $Param.Body | ConvertTo-Json

        Invoke-CsAPI @Param
    }
}