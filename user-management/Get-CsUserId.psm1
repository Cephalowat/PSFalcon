function Get-CsUserId {
<#
    .SYNOPSIS
        Retrieve a user ID by providing a username (typically email address)

    .PARAMETER USERNAME
        This is usually the user’s email address, but may vary based on your configuration
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $Username
    )
    process{
        $Param = @{
            Uri = '/users/queries/user-uuids-by-email/v1?uid=' + $Username
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