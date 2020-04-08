function New-FXSample {
<#
    .SYNOPSIS
        Upload a file for sandbox analysis

    .PARAMETER PATH
        The full path to the file to upload

    .PARAMETER COMMENT
        A descriptive comment to identify the file for other users

    .PARAMETER CONFIDENTIAL
        Defines visibility of this file in Falcon MalQuery [Default: True]
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $Path,

        [string]
        $Comment,

        [boolean]
        $Confidential = $true
    )
    process{
        $Param = @{
            Uri = '/samples/entities/samples/v2?file_name=' + (Split-Path $Path -Leaf) +
            '&is_confidential=' + $Confidential
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/octet-stream'
            }
            Body = "[ " + (Get-Content $Path) + " ]"
        }
        switch ($PSBoundParameters.Keys) {
            'Comment' { $Param.Uri += '&comment=' + $Comment }
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}