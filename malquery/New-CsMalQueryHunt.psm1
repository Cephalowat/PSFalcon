function New-CsMalQueryHunt {
<#
    .SYNOPSIS
        Schedule a YARA-based search for execution

    .PARAMETER BODY
        A hashtable of MalQuery Hunt parameters
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [hashtable]
        $Body
    )
    process{
        $Param = @{
            Uri = '/malquery/queries/hunt/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = ConvertTo-Json $Body -Depth 8
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}