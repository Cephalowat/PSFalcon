function Remove-CsGroupMember {
<#
    .SYNOPSIS
        Remove hosts from a static group

    .PARAMETER ID
        The host group ID

    .PARAMETER HOSTS
        One or more agent IDs to remove from the group
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateLength(32,32)]
        [string]
        $Id,

        [Parameter(Mandatory=$true)]
        [array]
        $Hosts
    )
    process{
        [string] $HostString = $Hosts.foreach{ "`'" + $_ + "`'," }

        $Param = @{
            Uri = '/devices/entities/host-group-actions/v1?action_name=remove-hosts'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{
                action_parameters = @(
                    @{  name = 'filter'
                        value = '(device_id:[' + ($HostString).TrimEnd(',') + '])'
                    }
                )
                ids = @( $Id )
            } | Convertto-Json
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}