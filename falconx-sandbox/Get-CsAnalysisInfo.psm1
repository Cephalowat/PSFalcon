function Get-CsAnalysisInfo {
<#
    .SYNOPSIS
        Get a short summary version of a sandbox report

    .PARAMETER ID
        ID of one or more summaries
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
            Uri =  '/falconx/entities/report-summaries/v1?ids='
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Split-CsArray -Activity $MyInvocation.MyCommand.Name -Param $Param -Id $Id
    }
}