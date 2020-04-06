function Receive-CsReport {
<#
    .SYNOPSIS
        Download a CrowdStrike Intel Report PDF

    .PARAMETER ID
        The ID of the report

    .PARAMETER OUTPUT
        Destination path
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $Id,

        [Parameter(Mandatory=$true)]
        [string]
        $Output
    )
    process{
        $Param = @{
            Uri = '/intel/entities/report-files/v1?id=' + $Id
            Method = 'get'
            Header = @{
                accept = 'application/pdf'
            }
            OutFile = $Output
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}