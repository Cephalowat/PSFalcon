function Get-CsDetectAggregates {
<#
    .SYNOPSIS
        Get detect aggregates as specified in the request body

    .PARAMETER BODY
        An array of query criteria and settings
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [array]
        $Body
    )
    process{
        $Param = @{
            Uri = '/detects/aggregates/detects/GET/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @( $Body ) | ConvertTo-Json -Depth 16
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}