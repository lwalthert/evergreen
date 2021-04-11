Function Get-JamTreeSizeFree {
    <#
        .SYNOPSIS
            Returns the the latest JAM Software TreeSize Free version number and download URI.

        .NOTES
            Site: https://stealthpuppy.com
            Author: Aaron Parker
            Twitter: @stealthpuppy
    #>
    [OutputType([System.Management.Automation.PSObject])]
    [CmdletBinding(SupportsShouldProcess = $False)]
    param (
        [Parameter(Mandatory = $False, Position = 0)]
        [ValidateNotNull()]
        [System.Management.Automation.PSObject]
        $res = (Get-FunctionResource -AppName ("$($MyInvocation.MyCommand)".Split("-"))[1]),

        [Parameter(Mandatory = $False, Position = 1)]
        [ValidateNotNull()]
        [System.String] $Filter
    )

    # Get latest TreeSize Free version
    $iwcParams = @{
        Uri       = $res.Get.Uri
        UserAgent = $res.Get.UserAgent
    }
    $Content = Invoke-WebRequestWrapper @iwcParams

    # Build object and output to the pipeline
    $PSObject = [PSCustomObject] @{
        Version  = $Content
        URI      = $res.Get.DownloadUri
    }
    Write-Output -InputObject $PSObject
}
