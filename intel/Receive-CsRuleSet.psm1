function Receive-CsRuleSet {
<#
    .SYNOPSIS
        Download the latest rule set by type, or specific rule set by id

    .PARAMETER TYPE
        Type of rule set

    .PARAMETER ID
        ID of a specific rule set

    .PARAMETER FORMAT
        The output archive type [default: 'zip']

    .PARAMETER PATH
        Destination path
#>
[CmdletBinding(DefaultParameterSetName = 'latest')]
[OutputType([psobject])]
    param(
        [Parameter(ParameterSetName = 'latest', Mandatory = $True)]
        [ValidateSet('snort-suricata-master', 'snort-suricata-update', 'snort-suricata-changelog',
        'yara-master', 'yara-update', 'yara-changelog', 'common-event-format', 'netwitness')]
        [string]
        $Type,

        [Parameter(ParameterSetName = 'specific', Mandatory = $True)]
        [string]
        $Id,

        [Parameter(ParameterSetName = 'latest')]
        [Parameter(ParameterSetName = 'specific')]
        [ValidateSet('zip', 'gzip')]
        [string]
        $Format = 'zip',

        [Parameter(ParameterSetName = 'latest', Mandatory = $True)]
        [Parameter(ParameterSetName = 'specific', Mandatory = $True)]
        [string]
        $Path
    )
    process{
        $Param = @{
            Uri = '/intel/entities/rules-latest-files/v1?type=' + $Type + '&format=' + $Format
            Method = 'get'
            Header = @{
                accept = 'application/' + $Format
            }
            OutFile = $Path
        }
        switch ($PSBoundParameters.Keys) {
            'Id' { 
                $Param.Uri = '/intel/entities/rules-files/v1?id=' + $Id + '&format=' + $Format
            }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}