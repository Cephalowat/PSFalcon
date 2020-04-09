function New-CsAwsAccount {
<#
    .SYNOPSIS
        Provision AWS accounts by specifying details about the accounts to provision

    .PARAMETER MODE
        Mode for provisioning. Allowed values are 'manual' or 'cloudformation' [Default: manual]

    .PARAMETER RESOURCES
        An array of AWS account properties
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [ValidateSet('cloudformation','manual')]
        [string]
        $Mode = 'manual',

        [Parameter(Mandatory = $true)]
        [array]
        $Resources
    )
    process{
        $Param = @{
            Uri = '/cloud-connect-aws/entities/accounts/v1?mode=' + $Mode
            Method = 'post'
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