function Edit-CsIoc {
<#
    .SYNOPSIS
        Update an IOC by providing a type and value

    .PARAMETER TYPE
        The type of the indicator

    .PARAMETER VALUE
        The string representation of the indicator

    .PARAMETER BODY
        A hashtable of IOC properties to modify
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
        $Value,

        [Parameter(Mandatory = $true)]
        [hashtable]
        $Body
    )
    process{
        $Param = @{
            Uri = '/indicators/entities/iocs/v1?type=' + $Type + '&value=' + $Value
            Method = 'patch'
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