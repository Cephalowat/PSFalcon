function Get-CsFirewallFieldId {
<#
    .SYNOPSIS
        Get firewall field specification ids

    .PARAMETER ID
        A specific platform id

    .PARAMETER LIMIT
        The maximum records to return [default: 100]

    .PARAMETER OFFSET
        The offset to start retrieving records from [default: 0]
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [ValidateLength(1)]
        [string]
        $Id,

        [ValidateRange(1,100)]
        [int]
        $Limit = 100,

        [string]
        $Offset = 0
    )
    process{
        $Param = @{
            Uri = '/fwmgr/queries/firewall-fields/v1?&limit=' + [string] $Limit + '&offset=' + [string] $Offset
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Id' { $Param.Uri += '&platform_id=' + $Platform }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}