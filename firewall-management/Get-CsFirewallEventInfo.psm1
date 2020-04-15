function Get-CsFirewallEventInfo {
<#
    .SYNOPSIS
        Search for members of a Firewall policy in your environment

    .PARAMETER ID
        The FW Event IDs to search for 

#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateLength(1,500)]
        [array]
        $Id

    )
    process{
        $Param = @{
            Uri = '/fwmgr/entities/events/v1?ids=' + $($Id -join "&ids=")
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        
        Invoke-CsAPI @Param
    }
}