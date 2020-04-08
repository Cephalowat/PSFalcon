function Get-CsRole {
<#
    .SYNOPSIS
        List all roles available in your account
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param()
    process{
        $Param = @{
            Uri = '/user-roles/queries/user-role-ids-by-cid/v1'
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