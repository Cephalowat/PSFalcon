function Enable-CsControlPolicy {
<#
    .SYNOPSIS
        Enable Device Control policies

    .PARAMETER ID
        An array of one or more Device Control policy IDs
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri = '/policy/entities/device-control-actions/v1?action_name=enable'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{ ids = $Id } | ConvertTo-Json
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}