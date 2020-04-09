# Edit-CsDetect
Modify the state, assignee, and visibility of detections

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/86/detections-monitoring-apis#modify-detections)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/detects/UpdateDetectsByIdsV2)**

### Parameters

`-Properties`: A hashtable of detection properties

### Example
```powershell
PS> Edit-CsDetect -Properties @(@{ assigned_to_uuid = <string>; ids = @(<string>); status = <string> })
```

# Get-CsDetectId
Search for detection IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/86/detections-monitoring-apis#find-detections)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/detects/QueryDetects)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Query`: Search all detection metadata for the provided string

`-Limit`: The maximum records to return [Default: 5000]

`-Offset`: The offset to start retrieving records from [Default: 0]

### Example
```powershell
PS> Get-CsDetectId -Filter "status:'new'"
```

# Get-CsDetectInfo
View information about detections

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/86/detections-monitoring-apis#find-detections)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/detects/GetDetectSummaries)**

### Parameters

`-Id`: One or more detection IDs

### Example
```powershell
PS> Get-CsDetectInfo -Id @(<string>, <string>)
```