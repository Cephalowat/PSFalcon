function Send-RtrGetCommand {
<#
    .SYNOPSIS
        Batch executes 'get' command across hosts to retrieve files. After this call is made
        'Confirm-RtrGetFile' is used to query for the results

    .PARAMETER ID
        Batch ID to execute the command on

    .PARAMETER PATH
        Full path to the file that is to be retrieved from each host in the batch

    .PARAMETER TIMEOUT
        Time to wait for the command request in seconds [default: 30, maximum 600]

    .PARAMETER OPTIONAL
        List of a subset of hosts we want to run the command on. If this list is supplied, only
        these hosts will receive the command
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $Id,

        [string]
        $Path,

        [int]
        $Timeout = 30,

        [array]
        $Optional
    )
    process{
        $Param = @{
            Uri = '/real-time-response/combined/batch-get-command/v1?timeout=' + [string] $Timeout + 's'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{
                'batch_id' = $Id
                'file_path' = $Path
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Optional' { $Param.Body['optional_hosts'] = $Optional }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        $Param.Body = $Param.Body | ConvertTo-Json

        Invoke-FalconAPI @Param
    }
}