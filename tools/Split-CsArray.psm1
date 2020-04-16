function Split-CsArray {
<#
    .SYNOPSIS
        Splits large arrays into groups and repeats Invoke-CsAPI

    .PARAMETER ACTIVITY
        The activity to display with Write-Progress

    .PARAMETER PARAM
        Hashtable of parameters for Invoke-CsAPI

    .PARAMETER ID
        An array of 'Id' values
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Activity,

        [Parameter(Mandatory = $true)]
        [hashtable]
        $Param,

        [Parameter(Mandatory = $true)]
        [array]
        $Id
    )
    process{
        # Maximum number of ids per group based on Invoke-RestMethod uri character limit
        $Max = [Math]::Floor([decimal](((65535 - ($Param.Uri).length)/($Id[0].length + 6))/1))
        $Uri = $Param['Uri']

        # Make request for each group
        for ($i = 0; $i -lt $Id.count; $i += $Max) {
            if ($i -gt 0) {
                $Progress = @{
                    Activity = $Activity
                    Status = [string] $i + ' of ' + [string] $Id.count
                    PercentComplete = (($i/$Id.count)*100)
                }
                Write-Progress @Progress
            }
            $Param.Uri = $Uri + (@($Id[$i..($i + ($Max - 1))]) -join '&ids=')
            Invoke-CsAPI @Param
        }
    }
}