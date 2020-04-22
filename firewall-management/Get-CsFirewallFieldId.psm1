function Get-CsFirewallFieldId {
<#
    .SYNOPSIS
        Get firewall field specification ids

    .PARAMETER ID
        A specific platform id

    .PARAMETER LIMIT
        The maximum records to return

    .PARAMETER OFFSET
        The offset to start retrieving records from
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Id,

        [ValidateRange(1,100)]
        [int]
        $Limit,

        [int]
        $Offset
    )
    process{
        $Param = @{
            Uri = '/fwmgr/queries/firewall-fields/v1?'
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Id' { $Param.Uri += '&platform_id=' + $Platform }
            'Limit' { $Param.Uri += '&limit=' + [string] $Limit }
            'Offset' { $Param.Uri += '&offset=' + [string] $Offset }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}