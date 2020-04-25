function New-CsMalQueryArchive {
<#
    .SYNOPSIS
        Schedule MalQuery samples for download

    .PARAMETER SAMPLES
        An array of SHA256 values of sample files
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Samples
    )
    process{
        $Param = @{
            Uri = '/malquery/entities/samples-multidownload/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{ samples = @( $Samples ) } | ConvertTo-Json -Depth 8
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}