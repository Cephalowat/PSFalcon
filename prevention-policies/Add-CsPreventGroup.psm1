function Add-CsPreventGroup {
<#
    .SYNOPSIS
        Add a Host Group to a Prevention policy

    .PARAMETER ID
        The Prevention Policy ID

    .PARAMETER GROUP
        The Host Group ID
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateLength(32,32)]
        [string]
        $Id,

        [Parameter(Mandatory = $true)]
        [ValidateLength(32,32)]
        [string]
        $Group
    )
    process{
        $Param = @{
            Uri = '/policy/entities/prevention-actions/v1?action_name=add-host-group'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{
                'action_parameters' = @(
                    @{
                        'name' = 'group_id'
                        'value' = $Group
                    }
                )
            'ids' = @($Id)
            } | ConvertTo-Json
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}