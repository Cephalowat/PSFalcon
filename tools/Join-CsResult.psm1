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
            [regex] $Pattern = 'after=\w{1,}[^&]'
        }
        # 'offset' style endpoints
        else {
            # integer-based
            if ($Loop.meta.pagination.offset -match '\d{1,}') {
                [regex] $Pattern = 'offset=\d{1,}'
            }
            # token-based
            else {
                [regex] $Pattern = 'offset=\w{1,}=='
            }
        }
        # Capture result and set token parameters
        $Total = $Loop.meta.pagination.total
        $Count = $Loop.resources.count

        # Loop until all results are retrieved
        while (($Total -gt $Count) -and (-not($Loop.errors))) {
            if ($Total -gt $Count) {
                $Progress = @{
                    Activity = $Activity
                    Status = [string] $Count + ' of ' + [string] $Loop.meta.pagination.total
                    PercentComplete = ($Count/$Loop.meta.pagination.total)*100
                }
                Write-Progress @Progress
            }
            # Update/add token or integer to request
            if ($Loop.meta.pagination.after) {
                $Value = 'after=' + $Loop.meta.pagination.after
            }
            else {
                if ($Loop.meta.pagination.offset -eq 0) {
                    $Value = 'offset=' + $Loop.resources.count
                }
                else {
                    $Value = 'offset=' + $Loop.meta.pagination.offset
                }
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
