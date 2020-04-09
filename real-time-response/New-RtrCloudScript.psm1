function New-RtrCloudScript {
<#
    .SYNOPSIS
        Upload a new custom-script to use for the RTR 'runscript' command

    .PARAMETER PATH
        Full path to the script you wish to upload

    .PARAMETER PERMISSION
        Permission for the custom-script [Default: private]

    .PARAMETER DESCRIPTION
        File description

    .PARAMETER NAME
        File name (if different than actual file name)

    .PARAMETER COMMENT
        The audit log comment
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Path,

        [ValidateSet('private', 'group', 'public')]
        [string]
        $Permission = 'private',

        [Parameter(Mandatory = $true)]
        [string]
        $Description,

        [string]
        $Name,

        [string]
        $Comment
    )
    process{
        $Param = @{
            Uri = '/real-time-response/entities/scripts/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'multipart/form-data'
            }
            Form = @{
                file = (Get-Item -Path $Path)
                description = $Description
                permission_type = $Permission
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Name' { $Param.Form['name'] = $Name }
            'Comment' { $Param.Form['comments_for_audit_log'] = $Comment }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}