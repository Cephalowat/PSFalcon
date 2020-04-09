function Get-CsUserId {
<#
    .SYNOPSIS
        Retrieve all User Ids in your account, or an Id for a specific Username

    .PARAMETER USERNAME
        This is usually the user’s email address, but may vary based on your configuration
#>
    [CmdletBinding(DefaultParameterSetName = 'cid')]
    [OutputType([psobject])]
    param(
        [Parameter(ParameterSetName = 'email', Mandatory = $true)]
        [string]
        $Username
    )
    process{
        $Param = @{
            Uri = '/users/queries/user-uuids-by-cid/v1'
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Id' { $Param.Uri = '/users/queries/user-uuids-by-email/v1?uid=' + $Username }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}