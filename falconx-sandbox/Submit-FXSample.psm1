function Submit-FXSample {
    <#
    .SYNOPSIS
        Submit an uploaded file or a URL for sandbox analysis. Time required for analysis
        varies but is usually less than 15 minutes

    .PARAMETER SANDBOX
        An array of Sandbox submission properties
    #>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory=$true)]
        [array]
        $Sandbox
    )
    process{
        $Param = @{
            Uri = '/falconx/entities/submissions/v1'
            Method = 'post'
            Header = @{ accept = 'application/json' }
            Body = @{ sandbox = $Sandbox } | ConvertTo-Json -Depth 8
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}