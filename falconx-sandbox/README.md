# Get-CsAnalysisId
Find sandbox reports

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#find-malware-samples-or-sandbox-reports)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/QueryReports)**

### Parameters

`-Filter`: Optional filter and sort criteria in the form of an FQL query

`-Limit`: The maximum records to return [Default: 5000]

`-Offset`: The offset to start retrieving records from [Default: 0]

### Example
```powershell
PS> Get-CsAnalysisId
```

# Get-CsAnalysisInfo
Get a short summary version of a sandbox report

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#find-malware-samples-or-sandbox-reports)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/GetSummaryReports)**

### Parameters

`-Id`: ID of one or more summaries

### Example
```powershell
PS> Get-CsAnalysisInfo -Id @(<string>, <string>)
```

# Get-CsSubmissionId
Find submission IDs for uploaded files

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#submit-a-file-for-analysis)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/QuerySubmissions)**

### Parameters

`-Filter`: Optional filter and sort criteria in the form of an FQL query

`-Limit`: The maximum records to return [Default: 5000]

`-Offset`: The offset to start retrieving records from [Default: 0]

### Example
```powershell
PS> Get-CsSubmissionId
```

# Get-CsSubmissionInfo
Check the status of a sandbox analysis

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#submit-a-file-for-analysis)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/GetSubmissions)**

### Parameters

`-Id`: Id of a submitted malware sample

### Example
```powershell
PS> Get-CsSubmissionInfo -Id @(<string>, <string>)
```

# Get-CsSubmissionQuota
Get your current Falcon X quota status

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#check-your-submission-quota)**

### Example
```powershell
PS> Get-CsSubmissionQuota
```

# New-CsSample
Upload a file for sandbox analysis

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#submit-a-file-for-analysis)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/UploadSampleV2)**

### Parameters

`-Path`: The full path to the file to upload

`-Comment`: A descriptive comment to identify the file for other users

`-Confidential`: Defines visibility of this file in Falcon MalQuery [Default: True]

### Example
```powershell
PS> New-CsSample -Path <string>
```

# Receive-CsArtifact
Download IOC packs, PCAP files, and other analysis artifacts

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#download-reports,-ioc-packs,-and-pcap-files)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/GetArtifacts)**

### Parameters

`-Id`: ID of an artifact, such as an IOC pack, PCAP file or actor image

`-Path`: Destination path

`-Name`: The name given to your downloaded file

### Example
```powershell
PS> Receive-CsArtifact -Id <string> -Path <string>
```

# Submit-CsSample
Submit an uploaded file or a URL for sandbox analysis. Time required for analysis varies but is
usually less than 15 minutes

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/92/falcon-x-apis#submit-a-file-for-analysis)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/falconx-sandbox/Submit)**

### Parameters

`-Sandbox`: An array of Sandbox submission properties

### Example
```powershell
PS> Submit-CsSample -Sandbox @(@{})
```