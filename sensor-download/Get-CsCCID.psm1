function Get-CsCCID {
<#
    .SYNOPSIS
        Request your Customer ID and Checksum
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param()
    process{
        $Param = @{
            Uri = '/sensors/queries/installers/ccid/v1'
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
        Invoke-FalconAPI @Param
    }
}