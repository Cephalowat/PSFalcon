function Receive-RtrGetFile {
<#
    .SYNOPSIS
        Get RTR extracted file contents for specified session and sha256

    .PARAMETER ID
        RTR Session Id

    .PARAMETER HASH
        Extracted SHA256 hash

    .PARAMETER OUTPUT
        Destination path
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [string]
        $Id,

        [string]
        $Hash,

        [string]
        $Output
    )
    process{
        $Param = @{
            Uri = ('/real-time-response/entities/extracted-file-contents/v1?session_id=' +
            $Id + '&sha256=' + $Hash)
            Method = 'get'
            Header = @{
                accept = 'application/x-7z-compressed'
            }
            OutFile = $Output
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}