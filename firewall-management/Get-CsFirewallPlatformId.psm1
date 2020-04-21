function Get-CsFirewallPlatformId {
<#
    .SYNOPSIS
        Get firewall platform ids

    .PARAMETER LIMIT
        The maximum records to return [default: 100]

    .PARAMETER OFFSET
        The offset to start retrieving records from [default: 0]
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [ValidateRange(1,100)]
        [int]
        $Limit = 100,

        [int]
        $Offset = 0
    )
    process{
        $Param = @{
            Uri = '/fwmgr/queries/platforms/v1?limit=' + [string] $Limit + '&offset=' + [string] $Offset
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
        Invoke-CsAPI @Param
    }
}