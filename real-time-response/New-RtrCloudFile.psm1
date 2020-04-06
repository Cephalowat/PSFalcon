function New-RtrCloudFile {
<#
    .SYNOPSIS
        Upload a new put-file to use for the RTR 'put' command

    .PARAMETER PATH
        The full path to the file to upload

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
        [Parameter(Mandatory=$true)]
        [string]
        $Path,

        [Parameter(Mandatory=$true)]
        [string]
        $Description,

        [string]
        $Name,

        [string]
        $Comment
    )
    process{
        $Param = @{
            Uri = '/real-time-response/entities/put-files/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'multipart/form-data'
            }
            Form = @{
                file = (Get-Item -Path $Path)
                description = $Description
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Name' { $Param.Form['name'] = $Name }
            'Comment' { $Param.Form['comments_for_audit_log'] = $Comment }
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}