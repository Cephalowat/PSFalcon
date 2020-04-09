function Confirm-RtrBatch {
<#
    .SYNOPSIS
        Batch refresh a RTR session on multiple hosts. RTR sessions will expire
        after 10 minutes unless refreshed

    .PARAMETER ID
        Batch ID to execute the command on

    .PARAMETER TIMEOUT
        Timeout for how long to wait for the request in seconds [default: 30, maximum 600]

    .PARAMETER REMOVE
        An array of agent IDs to remove from the batch session. Heartbeats will no longer happen on these
        hosts and the sessions will expire
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Id,

        [ValidateRange(30,600)]
        [int]
        $Timeout = 30,

        [array]
        $Remove
    )
    process{
        $Param = @{
            Uri = '/real-time-response/combined/batch-refresh-session/v1?timeout=' + [string] $Timeout + 's'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{ 'batch_id' = $Id }
        }
        switch ($PSBoundParameters.Keys) {
            'Remove' { $Param.Body['hosts_to_remove'] }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        $Param.Body = $Param.Body | ConvertTo-Json

        Invoke-FalconAPI @Param
    }
}