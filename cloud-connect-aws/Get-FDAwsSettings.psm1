function Get-FDAwsSettings {
<#
    .SYNOPSIS
        Retrieve a set of Global Settings which are applicable to all provisioned AWS accounts
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param()
    process{
        $Param = @{
            Uri = '/cloud-connect-aws/combined/settings/v1'
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}