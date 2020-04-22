function Get-CsFirewallPlatformId {
<#
    .SYNOPSIS
        Get firewall platform ids

    .PARAMETER LIMIT
        The maximum records to return

    .PARAMETER OFFSET
        The offset to start retrieving records from
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [ValidateRange(1,100)]
        [int]
        $Limit,

        [int]
        $Offset
    )
    process{
        $Param = @{
            Uri = '/fwmgr/queries/platforms/v1?'
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Limit' { $Param.Uri += '&limit=' + [string] $Limit }
            'Offset' { $Param.Uri += '&offset=' + [string] $Offset }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}