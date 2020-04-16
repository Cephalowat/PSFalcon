function Start-CsContain {
<#
    .SYNOPSIS
        Contain hosts. Stops any network communication to locations other than the CrowdStrike
        cloud and IPs specified in your containment policy

    .PARAMETER ID
        An array of one or more agent IDs to contain
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri = '/devices/entities/devices-actions/v2?action_name=contain'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{ ids = $Id } | ConvertTo-Json
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}