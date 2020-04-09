function Get-FDAwsAccess {
<#
    .SYNOPSIS
        Performs an access verification check on the specified AWS account IDs

    .PARAMETER ID
        IDs of accounts to verify access on
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri =  '/cloud-connect-aws/entities/verify-account-access/v1?ids=' + ($Id -join '&ids=')
            Method = 'post'
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