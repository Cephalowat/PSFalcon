function Set-CsPreventPrecedence {
<#
    .SYNOPSIS
        Sets the precedence of Prevention policies based on the order of IDs specified in the request. The
        first ID specified will have the highest precedence and the last ID specified will have the lowest.
        You must specify all non-Default Policies for a platform when updating precedence.

    .PARAMETER PLATFORM
        The operating system platform the Prevention policies are assigned to

    .PARAMETER ID
        An array of one or more Prevention policy IDs
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Android', 'iOS', 'Linux', 'Mac', 'Windows')]
        [string]
        $Platform,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri = '/policy/entities/prevention-precedence/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{
                'ids' = $Id
                'platform_name' = $Platform
            } | ConvertTo-Json
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}