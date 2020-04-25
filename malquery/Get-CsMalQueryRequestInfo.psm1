function Get-CsMalQueryRequestInfo {
<#
    .SYNOPSIS
        Check the status and results of an asynchronous request, such as hunt or exact-search

    .PARAMETER ID
        MalQuery Request ID
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Id
    )
    process{
        $Param = @{
            Uri =  '/malquery/entities/requests/v1?ids='
            Method = 'get'
            Header = @{
                accept = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Split-CsArray -Activity $MyInvocation.MyCommand.Name -Param $Param -Id $Id
    }
}