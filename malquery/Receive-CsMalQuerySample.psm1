function Receive-CsMalQuerySample {
<#
    .SYNOPSIS
        Download a sample indexed by MalQuery

    .PARAMETER ID
        SHA256 hash value of the sample file

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
            Uri = '/malquery/entities/download-files/v1?ids=' + [string] $Id
            Method = 'get'
            Header = @{
                accept = 'application/octet-stream'
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