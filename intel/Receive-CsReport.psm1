function Receive-CsReport {
<#
    .SYNOPSIS
        Download a CrowdStrike Intel Report PDF

    .PARAMETER ID
        ID of the report

    .PARAMETER PATH
        Destination path
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Id,

        [Parameter(Mandatory = $true)]
        [string]
        $Path
    )
    process{
        $Param = @{
            Uri = '/intel/entities/report-files/v1?id=' + $Id
            Method = 'get'
            Header = @{
                accept = 'application/pdf'
            }
            OutFile = $Path
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}