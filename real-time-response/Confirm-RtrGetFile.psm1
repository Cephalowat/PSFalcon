function Confirm-RtrGetFile {
<#
    .SYNOPSIS
        Retrieves the status of the specified batch get command. Will return successful
        files when they are finished processing

    .PARAMETER ID
        Batch Get Command Request ID received from

    .PARAMETER TIMEOUT
        Time to wait for the command request in seconds [default: 30, maximum 600]
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $Id,

        [int]
        $Timeout = 30
    )
    process{
        $Param = @{
            Uri = '/real-time-response/combined/batch-get-command/v1?timeout=' + [string] $Timeout +
            's&batch_get_cmd_req_id=' + $Id
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}