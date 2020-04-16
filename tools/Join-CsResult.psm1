function Join-CsResult {
<#
    .SYNOPSIS
        Repeats Invoke-CsAPI until all results are retrieved

    .PARAMETER ACTIVITY
        The activity to display with Write-Progress

    .PARAMETER PARAM
        Hashtable of parameters for Invoke-CsAPI
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Activity,

        [Parameter(Mandatory = $true)]
        [hashtable]
        $Param
    )
    process{
        # Make repeated requests to retrieve all results
        Invoke-CsAPI @Param -OutVariable Loop

        # 'after' style endpoints
        if ($Loop.meta.pagination.after) {
            [regex] $Pattern = 'after=\w{92}'
        }
        # 'offset' style endpoints
        else {
            [regex] $Pattern = 'offset=\d{1,}'
        }
        # Capture result and set token parameters
        $Total = $Loop.meta.pagination.total
        $Count = $Loop.resources.count

        # Loop until all results are retrieved
        while ($Total -gt $Count) {
            $Progress = @{
                Activity = $Activity
                Status = [string] $Count + ' of ' + [string] $Loop.meta.pagination.total
                PercentComplete = ($Count/$Loop.meta.pagination.total)*100
            }
            Write-Progress @Progress

            # Update/add token to request
            if ($Loop.meta.pagination.after) {
                $Value = 'after=' + $Loop.meta.pagination.after
            }
            else {
                $Value = 'offset=' + [string] $Count
            }
            if ($Pattern.Matches($Param.Uri).value) {
                $Param.Uri = $Param.Uri -replace $Pattern.Matches($Param.Uri).value,$Value
            }
            else {
                $Param.Uri += '&' + $Value
            }
            # Make request
            Invoke-CsAPI @Param -OutVariable Loop

            # Update count
            $Count += $Loop.resources.count
        }
    }
}
