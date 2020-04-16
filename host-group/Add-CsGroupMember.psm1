function Add-CsGroupMember {
<#
    .SYNOPSIS
        Add Hosts to a static Host Group

    .PARAMETER ID
        The Host Group ID

    .PARAMETER HOSTS
        One or more Agent IDs to add to the Host Group
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateLength(32,32)]
        [string]
        $Id,

        [Parameter(Mandatory = $true)]
        [array]
        $Hosts
    )
    process{
        [string] $HostString = foreach ($Item in $Hosts) { "`'" + $Item + "`'," }

        $Param = @{
            Uri = '/devices/entities/host-group-actions/v1?action_name=add-hosts'
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
        Invoke-CsAPI @Param
    }
}