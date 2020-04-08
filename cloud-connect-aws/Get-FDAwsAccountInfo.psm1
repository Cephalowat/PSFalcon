function Get-FDAwsAccountInfo {
<#
    .SYNOPSIS
        Retrieve a set of AWS Accounts by specifying their IDs

    .PARAMETER FILTER
        The filter expression that should be used to limit the results

    .PARAMETER LIMIT
        The maximum records to return [Default: 500]

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0]

    .PARAMETER ID
        IDs of specific accounts to return
#>
    [CmdletBinding(DefaultParameterSetName = 'combined')]
    [OutputType([psobject])]
    param(
        [Parameter(ParameterSetName = 'combined')]
        [string]
        $Filter,

        [Parameter(ParameterSetName = 'combined')]
        [ValidateRange(1,500)]
        [int]
        $Limit = 500,

        [Parameter(ParameterSetName = 'combined')]
        [int]
        $Offset = 0,

        [Parameter(ParameterSetName = 'entities', Mandatory=$true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri = '/cloud-connect-aws/combined/accounts/v1?limit=' + [string] $Limit +
            '&offset=' + [string] $Offset
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Filter' { $Param.Uri += '&filter=' + $Filter }
            'Id' { $Param.Uri = '/cloud-connect-aws/entities/accounts/v1?ids=' + ($Id -join '&ids=') }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}