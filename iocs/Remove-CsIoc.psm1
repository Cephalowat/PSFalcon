function Remove-CsIoc {
<#
    .SYNOPSIS
        Delete an IOC by providing a type and value

    .PARAMETER TYPE
        The type of the indicator

    .PARAMETER VALUE
        The string representation of the indicator
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('sha256','md5','domain','ipv4','ipv6')]
        [string]
        $Type,

        [Parameter(Mandatory = $true)]
        [ValidateLength(1,200)]
        [string]
        $Value
    )
    process{
        $Param = @{
            Uri = '/indicators/entities/iocs/v1?type=' + $Type + '&value=' + [string] $Value
            Method = 'delete'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}