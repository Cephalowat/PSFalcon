function Start-RtrBatch {
<#
    .SYNOPSIS
        Batch initialize a RTR session on multiple hosts. Before any RTR commands
        can be used, an active session is needed on the host

    .PARAMETER ID
        List of host agent IDs to initialize a RTR session on

    .PARAMETER QUEUE
        Utilize queueing for devices that are currently offline [default: True]

    .PARAMETER EXISTING
        Optional batch ID. Use an existing batch ID if you want to initialize new hosts and
        add them to an existing batch

    .PARAMETER TIMEOUT
        Time to wait for the command request to complete, in seconds [default: 30]
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Id,

        [boolean]
        $Queue = $true,

        [ValidateLength(36,36)]
        [string]
        $Existing,

        [ValidateRange(30,600)]
        [int]
        $Timeout = 30
    )
    process{
        $Param = @{
            Uri = '/real-time-response/combined/batch-init-session/v1?timeout=' + [string] $Timeout
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{ 
                host_ids = $Id
                queue_offline_all = $Queue
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Existing' { $Param.Body['existing_batch_id'] = $Existing }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        $Param.Body = $Param.Body | ConvertTo-Json

        Invoke-FalconAPI @Param
    }
}