function Show-CsHost {
<#
    .SYNOPSIS
        Restore hosts. Detection reporting will resume after the host is restored

    .PARAMETER ID
        An array of one or more agent IDs to restore
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
            Uri = '/devices/entities/devices-actions/v2?action_name=unhide_host'
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