function Get-FFMFieldId {
<#
    .SYNOPSIS
        Get the firewall field specification IDs for the provided platform

    .PARAMETER ID
        Get fields configuration for this platform

    .PARAMETER LIMIT
        The maximum records to return [Default: 5000]

    .PARAMETER OFFSET
        The offset to start retrieving records from [Default: 0]
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $Id,

        [ValidateRange(2,5000)]
        [int]
        $Limit = 5000,

        [int]
        $Offset = 0
    )
    process{
        $Param = @{ 
            Uri = '/fwmgr/queries/firewall-fields/v1?&platform_Id=' + $Id + '&limit=' + [string] $Limit +
            '&offset=' + [string] $Offset
            Method = 'get'
            Header = @{
                accept = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}