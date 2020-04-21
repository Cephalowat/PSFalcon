function Edit-CsFirewallPolicySettings {
<#
    .SYNOPSIS
        Edit existing Firewall Policy settings

    .PARAMETER COMMENT
        Optional audit log comment

    .PARAMETER BODY
        A hashtable of Firewall Policy properties
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Comment,

        [Parameter(Mandatory = $true)]
        [hashtable]
        $Body
    )
    process{
        $Param = @{
            Uri = '/fwmgr/entities/policies/v1'
            Method = 'put'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
                'X-CS-USERNAME' = 'api-client-id:' + [string] $Falcon.id
            }
            Body = ConvertTo-Json $Body -Depth 8
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}