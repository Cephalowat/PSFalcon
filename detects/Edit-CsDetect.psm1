function Edit-CsDetect {
<#
    .SYNOPSIS
        Modify the state, assignee, and visibility of detections

    .PARAMETER PROPERTIES
        A hashtable of detection properties
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [hashtable]
        $Properties
    )
    process{
        $Param = @{
            Uri = '/detects/entities/detects/v2'
            Method = 'patch'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = $Properties | ConvertTo-Json -Depth 8
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}