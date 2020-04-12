function Edit-CsIncident {
<#
    .SYNOPSIS
        Perform a set of actions on one or more incidents

    .PARAMETER ID
        Target Incident Ids

    .PARAMETER ACTIONS
        An array containing 'action' hashtables
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Id,

        [Parameter(Mandatory = $true)]
        [array]
        $Actions
    )
    process{
        $Param = @{
            Uri = '/incidents/entities/incident-actions/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{
                action_parameters = $Actions
                ids = $Id
            } | ConvertTo-Json -Depth 8
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}