function Receive-CsLatestRuleSet {
<#
    .SYNOPSIS
        Download the latest rule set by type

    .PARAMETER TYPE
        The type of rule set

    .PARAMETER OUTPUT
        Destination path
#>
[CmdletBinding()]
[OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet('snort-suricata-master', 'snort-suricata-update', 'snort-suricata-changelog',
        'yara-master', 'yara-update', 'yara-changelog', 'common-event-format', 'netwitness')]
        [string]
        $Type,

        [Parameter(Mandatory=$true)]
        [string]
        $Output
    )
    process{
        $Param = @{
            Uri = '/intel/entities/rules-latest-files/v1?format=zip&type=' + $Type
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