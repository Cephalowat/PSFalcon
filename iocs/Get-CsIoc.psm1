function Get-CsIoc {
<#
    .SYNOPSIS
        Search the custom IOCs in your account

    .PARAMETER TYPE
        Type of the indicator

    .PARAMETER VALUE
        String representation of the indicator

    .PARAMETER AFTER
        Find custom IOCs created after this time (RFC-3339 timestamp)

    .PARAMETER BEFORE
        Find custom IOCs created before this time (RFC-3339 timestamp)

    .PARAMETER POLICY
        Find custom IOCs within a policy [default: 'detect']

    .PARAMETER SOURCE
        Source where this indicator originated

    .PARAMETER SHARE
        Share level of indicator [default: 'red']

    .PARAMETER CREATEDBY
        User who created the custom IOC

    .PARAMETER DELETEDBY
        User who deleted the custom IOC

    .PARAMETER DELETED
        Include deleted IOCs [default: False]

    .PARAMETER LIMIT
        The maximum records to return [default: 500]

    .PARAMETER OFFSET
        The offset to start retrieving records from [default: 0]

    .PARAMETER ALL
        Repeat requests until all results are retrieved
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [ValidateSet('domain', 'ipv4', 'ipv6', 'md5', 'sha256')]
        [string]
        $Type,

        [ValidateLength(1,200)]
        [string]
        $Value,

        [string]
        $After,

        [string]
        $Before,

        [ValidateSet('detect', 'none')]
        [string]
        $Policy = 'detect',

        [ValidateLength(1,200)]
        [string]
        $Source,

        [ValidateSet('red')]
        [string]
        $Share = 'red',

        [string]
        $CreatedBy,

        [string]
        $DeletedBy,

        [boolean]
        $Deleted = $false,

        [ValidateRange(1,500)]
        [int]
        $Limit = 500,

        [int]
        $Offset = 0,

        [switch]
        $All
    )
    process{
        $Param = @{
            Uri = '/indicators/queries/iocs/v1?limit=' + [string] $Limit + '&offset=' + [string] $Offset +
            '&policies=' + $Policy + '&share_levels=' + $Share + '&include_deleted=' + $Deleted
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Type' { $Param.Uri += '&types=' + $Type }
            'Value' { $Param.Uri += '&values=' + $Value }
            'After' { $Param.Uri += '&from.expiration_timestamp=' + $Type }
            'Before' { $Param.Uri += '&to.expiration_timestamp=' + $Type }
            'Source' { $Param.Uri += '&sources=' + $Type }
            'CreatedBy' { $Param.Uri += '&created_by=' + $Type }
            'DeletedBy' { $Param.Uri += '&deleted_by=' + $Type }
            'Debug' { $Param['Debug'] = $true }
            'Verbose' { $Param['Verbose'] = $true }
        }
        if ($All) {
            Join-CsResult -Activity $MyInvocation.MyCommand.Name -Param $Param
        }
        else {
            Invoke-CsAPI @Param
        }
    }
}