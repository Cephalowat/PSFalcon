function New-CsMalQuerySearch {
<#
    .SYNOPSIS
        Search MalQuery for a combination of hex patterns and strings

    .PARAMETER BODY
        A hashtable of MalQuery search parameters

    .PARAMETER FUZZY
        Toggle a fuzzy search, which can return more results but has the potential for higher false positives
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [hashtable]
        $Body,

        [switch]
        $Fuzzy
    )
    process{
        $Param = @{
            Uri = '/malquery/queries/exact-search/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = ConvertTo-Json $Body -Depth 8
        }
        switch ($PSBoundParameters.Keys) {
            'Fuzzy' { $Param.Uri = '/malquery/combined/fuzzy-search/v1' }
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}