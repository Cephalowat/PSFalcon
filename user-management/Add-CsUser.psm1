function Add-CsUser {
<#
    .SYNOPSIS
        Create a new user

    .PARAMETER USERNAME
        The user's email address (or username)

    .PARAMETER FIRST
        The user's first name

    .PARAMETER LAST
        The user's last name
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $Username,

        [Parameter(Mandatory=$true)]
        [string]
        $First,

        [Parameter(Mandatory=$true)]
        [string]
        $Last
    )
    process{
        $Param = @{
            Uri = '/users/entities/users/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{
                firstName = $First
                lastName = $Last
                uid = $Username
            } | ConvertTo-Json
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}