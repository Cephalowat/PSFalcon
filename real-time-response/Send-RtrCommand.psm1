function Send-RtrCommand {
<#
    .SYNOPSIS
        Batch executes a RTR command across the hosts mapped to the given batch ID. This function
        selects the permission level to use based on the command selected

    .PARAMETER ID
        Batch ID to execute the command on

    .PARAMETER COMMAND
        Command to execute

    .PARAMETER STRING
        Command string (text that follows the 'base command')

    .PARAMETER TIMEOUT
        Time to wait for the command request in seconds [default: 30, maximum 600]

    .PARAMETER OPTIONAL
        List of a subset of hosts we want to run the command on. If this list is supplied, only
        these hosts will receive the command
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateLength(36,36)]
        [string]
        $Id,

        [Parameter(Mandatory = $true)]
        [ValidateSet('cat', 'cd', 'clear', 'cp', 'encrypt', 'env', 'eventlog', 'filehash', 'getsid', 'help',
        'history', 'ipconfig', 'kill', 'ls', 'map', 'memdump', 'mkdir', 'mount', 'mv', 'netstat', 'ps', 'put',
        'reg delete', 'reg load', 'reg unload', 'reg set', 'reg query', 'restart', 'rm', 'run', 'runscript',
        'shutdown', 'unmap', 'xmemdump', 'zip')]
        [string]
        $Command,

        [string]
        $String,

        [ValidateRange(30,600)]
        [int]
        $Timeout = 30,

        [array]
        $Optional
    )
    begin{
        # Real-time Response permission scopes
        $Admin = @('put', 'run', 'runscript')

        $ActiveResponder = @('cp', 'encrypt', 'kill', 'map', 'memdump', 'mkdir', 'mv', 'reg delete',
        'reg load', 'reg unload', 'reg set', 'restart', 'rm', 'shutdown', 'unmap', 'xmemdump', 'zip')
    }
    process{
        $Param = @{
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{
                base_command = $Command
                batch_id = $Id
                command_string = ($Command + ' ' + $String)
            }
        }
        if ($Command -cin $Admin) {
            $Param['Uri'] = '/real-time-response/combined/batch-admin-command/v1'
        }
        elseif ($Command -cin $ActiveResponder) {
            $Param['Uri'] = '/real-time-response/combined/batch-active-responder-command/v1'
        }
        else {
            $Param['Uri'] = '/real-time-response/combined/batch-command/v1'
        }
        switch ($PSBoundParameters.Keys) {
            'Timeout' { $Param.Uri += '?timeout=' + [string] $Timeout }
            'Optional' { $Param.Body['optional_hosts'] = $Optional }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        $Param.Body = $Param.Body | ConvertTo-Json

        Invoke-CsAPI @Param
    }
}