function Hide-CsHost {
<#
    .SYNOPSIS
        Delete hosts. After a host is deleted, no new detections for that host
        will be reported in the UI or APIs

    .PARAMETER ID
        An array of one or more agent IDs to hide
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Id
    )
    begin{
        # Maximum number of hosts per request
        $Max = 100
    }
    process{
        # Base parameters
        $Param = @{
            Uri = '/devices/entities/devices-actions/v2?action_name=hide_host'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        # Make request for each group of $Max
        for ($i = 0; $i -lt $Id.count; $i += $Max) {
            if ($i -gt 0) {
                $Progress = @{
                    Activity = $Activity
                    Status = [string] $i + ' of ' + [string] $Id.count
                    PercentComplete = (($i/$Id.count)*100)
                }
                Write-Progress @Progress
            }
            $Param['Body'] = @{ 'ids' = @($Id[$i..($i + ($Max - 1))]) } | ConvertTo-Json

            Invoke-CsAPI @Param
        }
    }
}