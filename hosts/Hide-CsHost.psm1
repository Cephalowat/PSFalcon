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
        [Parameter(Mandatory=$true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri = '/devices/entities/devices-actions/v2?action_name=hide_host'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{ 'ids' = $Id } | ConvertTo-Json
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}