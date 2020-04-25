function Receive-CsMalQueryArchive {
<#
    .SYNOPSIS
        Download a password protected archive of samples from MalQuery

    .PARAMETER ID
        Multidownload job id

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
            Uri = '/malquery/entities/samples-fetch/v1?ids=' + [string] $Id
            Method = 'get'
            Header = @{
                accept = 'application/zip'
            }
            OutFile = $Path
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}