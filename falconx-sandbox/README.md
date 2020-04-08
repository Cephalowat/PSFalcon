# Add-FXSandboxFile - IN_DEVELOPMENT
Upload a file for sandbox analysis

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#submit-a-file-for-analysis)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/UploadSampleV2)**

## Parameters

`-Path`: The full path to the file to upload

`-Comment`: A descriptive comment to identify the file for other users

`-Confidential`: Defines visibility of this file in Falcon MalQuery [Default: True]

## Example
```powershell
PS> Add-FXSandboxFile -Path <string> 
```

# Get-FXReportId
Find sandbox reports

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#find-malware-samples-or-sandbox-reports)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/QueryReports)**

## Parameters

`-Filter`: Optional filter and sort criteria in the form of an FQL query

`-Limit`: The maximum records to return [Default: 5000]

`-Offset`: The offset to start retrieving records from [Default: 0]

## Example
```powershell
PS> Get-FXReportId
```

# Get-FXReportInfo
Get a short summary version of a sandbox report

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#find-malware-samples-or-sandbox-reports)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/GetSummaryReports)**

## Parameters

`-Id`: ID of one or more summaries

## Example
```powershell
PS> Get-FXReportInfo -Id @(<string>, <string>)
```

# Get-FXSubmissionId
Find submission IDs for uploaded files

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#submit-a-file-for-analysis)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/QuerySubmissions)**

## Parameters

`-Filter`: Optional filter and sort criteria in the form of an FQL query

`-Limit`: The maximum records to return [Default: 5000]

`-Offset`: The offset to start retrieving records from [Default: 0]

## Example
```powershell
PS> Get-FXSubmissionId
```

# Get-FXSubmissionInfo
Check the status of a sandbox analysis

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#submit-a-file-for-analysis)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/GetSubmissions)**

## Parameters

`-Id`: Id of a submitted malware sample

## Example
```powershell
PS> Get-FXSubmissionInfo -Id @(<string>, <string>)
```

# Get-FXQuota
Get your current Falcon X quota status

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#check-your-submission-quota)**

## Example
```powershell
PS> Get-FXQuota
```

# Receive-FXArtifact
Download IOC packs, PCAP files, and other analysis artifacts

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#download-reports,-ioc-packs,-and-pcap-files)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/GetArtifacts)**

## Parameters

`-Id`: ID of an artifact, such as an IOC pack, PCAP file or actor image

`-Output`: Destination path

`-Name`: The name given to your downloaded file

## Example
```powershell
PS> Receive-FXArtifact -Id <string> -Output <string>
```

# Submit-FXSandboxFile
Submit an uploaded file or a URL for sandbox analysis. Time required for analysis varies but is
usually less than 15 minutes

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#submit-a-file-for-analysis)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/Submit)**

## Parameters

`-Sandbox`: An array of Sandbox submission properties

## Example
```powershell
PS> Submit-FXSandboxFile -Sandbox @(@{})
```