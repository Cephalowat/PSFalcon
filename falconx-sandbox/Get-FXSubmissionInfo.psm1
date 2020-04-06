function Get-FXSubmissionInfo {
<#
    .SYNOPSIS
        Check the status of a sandbox analysis. Time required for analysis varies but
        is usually less than 15 minutes

    .PARAMETER ID
        Id of a submitted malware sample. Find a submission ID with 'Get-FXSubmissionId'
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri =  '/falconx/entities/submissions/v1?ids=' + ($Id -join '&ids=')
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
