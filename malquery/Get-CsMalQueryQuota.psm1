function Get-CsMalQueryQuota {
<#
    .SYNOPSIS
        Get your current MalQuery quota status
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param()
    process{
        $Param = @{
            Uri =  '/malquery/aggregates/quotas/v1'
            Method = 'get'
            Header = @{
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
