function Convert-RtrResult {
<#
    .SYNOPSIS
        Outputs formatted Real-time Response result fields

    .PARAMETER REQUEST
        Real-time Response request object

    .PARAMETER COMMAND
        Label to use when adding results

    .PARAMETER OUTPUT
        Target object containing Host Ids
#>
    [CmdletBinding()]
    param(
        [psobject]
        $Request,

        [string]
        $Command,

        [psobject]
        $Output
    )
    begin{
        # Response fields to capture
        $Fields = @('aid', 'base_command', 'complete', 'errors', 'query_time', 'sequence_id', 'session_id',
        'stderr', 'stdout', 'task_id')
    }
    process{
        # Capture results and add under each Host Id
        foreach ($Resource in @($Request.combined.resources, $Request.resources)) {
            foreach ($HostId in ($Resource.psobject.properties.name)) {
                $Result = [PSCustomObject] @{}

                foreach ($Field in $Fields) {
                    # If field is 'error', capture error code and message as a string
                    if ($Resource.$HostId.$Field -is [array]) {
                        if ($Resource.$HostId.$Field) {
                            $Result | Add-Member -MemberType NoteProperty -Name $Field -Value ("[" +
                            [string] $Resource.$HostId.$Field.code + "] " +
                            [string] $Resource.$HostId.$Field.message)
                        }
                    }
                    else {
                        if ($Resource.$HostId.$Field) {
                            $Result | Add-Member -MemberType NoteProperty -Name (
                            $Field) -Value $Resource.$HostId.$Field
                        }
                    }
                }
                # Add collection of fields to Host Id object
                $Output | Where-Object aid -eq $Result.aid |
                Add-Member -MemberType NoteProperty -Name $Command -Value $Result
            }
        }
        Write-Verbose ("Captured " + $Command + " result")
    }
}

