# Get-CsActorId
Get actor IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/72/intel-apis#actors-query-api)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/intel/QueryIntelActorIds)**

### Parameters

`-Filter`: Filter your query by specifying FQL filter parameters

`-Query`: Perform a generic substring search across all fields

`-Limit`: The maximum records to return [default: 5000]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsActorId
```

# Get-CsActorInfo
Retrieve specific actors

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/72/intel-apis#actor-combined-api)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/intel/QueryIntelActorEntities)**

### Parameters

`-Filter`: Filter your query by specifying FQL filter parameters

`-Query`: Perform a generic substring search across all fields

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

`-Id`: IDs of specific actors to return

`-Field`: The fields to return, or a predefined set of fields in the form of the collection name surrounded
by two underscores [default: '\__basic__']

### Example
```powershell
PS> Get-CsActorInfo
```

# Get-CsIndicatorId
Get indicators IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/72/intel-apis#indicator-query-api)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/intel/QueryIntelIndicatorIds)**

### Parameters

`-Deleted`: If $true, include both published and deleted indicators in the response [default: $false]

`-Filter`: Filter your query by specifying FQL filter parameters

`-Query`: Perform a generic substring search across all fields

`-Limit`: The maximum records to return [default: 150000]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsIndicatorId
```

# Get-CsIndicatorInfo
Retrieve info about specific indicators

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/72/intel-apis#indicator-combined-api)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/intel/QueryIntelIndicatorEntities)**

### Parameters

`-Deleted`: If $true, include both published and deleted indicators in the response [default: $false]

`-Filter`: Filter your query by specifying FQL filter parameters

`-Query`: Perform a generic substring search across all fields

`-Limit`: The maximum records to return [default: 150000]

`-Offset`: The offset to start retrieving records from [default: 0]

`-Id`: IDs of specific indicators to return

### Example
```powershell
PS> Get-CsIndicatorInfo
```

# Get-CsReportId
Get report IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/72/intel-apis#reports-query-API)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/intel/QueryIntelReportIds)**

### Parameters

`-Filter`: Filter your query by specifying FQL filter parameters

`-Query`: Perform a generic substring search across all fields

`-Limit`: The maximum records to return [default: 5000]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsReportId
```

# Get-CsReportInfo
Retrieve info about specific reports

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/72/intel-apis#reports-combined-api)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/intel/QueryIntelReportEntities)**

### Parameters

`-Filter`: Filter your query by specifying FQL filter parameters

`-Query`: Perform a generic substring search across all fields

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

`-Id`: IDs of the reports you want to retrieve

`-Field`: The fields to return, or a predefined set of fields in the form of the collection name surrounded
by two underscores [default: '\__basic__']

### Example
```powershell
PS> Get-CsReportInfo
```

# Get-CsRuleId
Search for rule IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/72/intel-apis#how-the-rules-api-works)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/intel/QueryIntelRuleIds)**

### Parameters

`-Type`: The rule news report type

`-Name`: Search by rule title

`-Description`: Substring match on description field

`-Tag`: Search for rule tags

`-MinCreated`: Filter results to those created on or after a certain date

`-MaxCreated`: Filter results to those created on or before a certain date

`-Query`: Perform a generic substring search across all fields

`-Limit`: The maximum records to return [default: 100]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsRuleId -Type <string>
```

# Get-CsRuleInfo
Retrieve details for rule sets

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/72/intel-apis#how-the-rules-api-works)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/intel/GetIntelRuleEntities)**

### Parameters

`-Id`: IDs of rules to return

### Example
```powershell
PS> Get-CsRuleInfo -Id @(<string>, <string>)
```

# Receive-CsReport
Download a CrowdStrike Intel Report PDF

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/intel/GetIntelReportPDF)**

### Parameters

`-Id`: ID of the report

`-Path`: Destination path

### Example
```powershell
PS> Receive-CsReport -Id <string> -Path <string>
```

# Receive-CsRuleSet
Download the latest rule set by type, or specific rule set by id

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/72/intel-apis#download-the-latest-rule-set)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/intel/GetLatestIntelRuleFile)**

### Parameters

`-Type`: Type of rule set

`-Id`: ID of a specific rule set

`-Format`: Output archive type [default: 'zip']

`-Path`: Destination path

### Example
```powershell
PS> Receive-CsRuleSet -Type <string> -Path <string>
```