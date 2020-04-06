function Receive-CsRuleSet {
<#
    .SYNOPSIS
        Download a specific rule set

    .PARAMETER ID
        The ID of the specific rule set

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
            Uri = '/intel/entities/rules-files/v1?format=zip&id=' + $Id
            Method = 'get'
            Header = @{
                accept = 'application/zip'
            }
            OutFile = $Output
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}