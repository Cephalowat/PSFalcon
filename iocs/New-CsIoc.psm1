function New-CsIoc {
<#
    .SYNOPSIS
        Create a new IOC

    .PARAMETER BODY
        An array of IOC properties
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Body
    )
    process{
        $Param = @{
            Uri = '/indicators/entities/iocs/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = ConvertTo-Json $Body
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}