function Get-CsUninstallToken {
<#
    .SYNOPSIS
        Reveals an uninstall token for a specific host

    .PARAMETER ID
        The target Agent ID. To retrieve the bulk maintenance token use 'MAINTENANCE'

    .PARAMETER AUDIT
        An audit message explaining the reason for the token reveal
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateLength(32,32)]
        [string]
        $Id,

        [Parameter(Mandatory = $true)]
        [string]
        $Audit
    )
    process{
        if ($Id -like 'maintenance') {
            $Id = $Id.ToUpper()
        }
        $Param = @{
            Uri = '/policy/combined/reveal-uninstall-token/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{
                device_id = $Id
                audit_message = $Audit
            } | ConvertTo-Json
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}