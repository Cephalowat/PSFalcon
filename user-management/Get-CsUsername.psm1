function Get-CsUsername {
<#
    .SYNOPSIS
        List all usernames (typically email addresses) in your account
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param()
    process{
        $Param = @{
            Uri = '/users/queries/emails-by-cid/v1'
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
        Invoke-FalconAPI @Param
    }
}