function Edit-FDAwsAccount {
<#
    .SYNOPSIS
        Update AWS accounts by specifying the ID of the group and details to update

    .PARAMETER RESOURCES
        An array of AWS account properties
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [array]
        $Resources
    )
    process{
        $Param = @{
            Uri = '/cloud-connect-aws/entities/accounts/v1'
            Method = 'patch'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{ resources = $Resources } | ConvertTo-Json -Depth 16
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}