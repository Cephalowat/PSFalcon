function Remove-CsPreventPolicy {
<#
    .SYNOPSIS
        Delete a set of Prevention policies by specifying their IDs

    .PARAMETER ID
        The IDs of the Prevention policies to delete
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri = '/policy/entities/prevention/v1?ids=' + ($Id -join '&ids=')
            Method = 'delete'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}