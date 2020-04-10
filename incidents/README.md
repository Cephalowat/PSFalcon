# Edit-CsIncident
Perform a set of actions on one or more incidents

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/86/detections-monitoring-apis#modify-incidents)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/incidents/PerformIncidentAction)**

### Parameters

`-Id`: Target Incident Ids

`-Actions`: An array containing 'action' hashtables

### Example
```powershell
PS> Edit-CsIncident -Id @(<string>, <string>) -Actions @(@{ name = <string>; value = <string> })
```

# Get-CsBehaviorId
Search for behavior IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/86/detections-monitoring-apis#find-behaviors)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/incidents/QueryBehaviors)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

### Example
```powershell
PS> Get-CsBehaviorId
```

# Get-CsBehaviorInfo
Get details on behaviors by providing behavior IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/86/detections-monitoring-apis#find-behaviors)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/incidents/GetBehaviors)**

### Parameters

`-Id`: One or more behavior IDs

### Example
```powershell
PS> Get-CsBehaviorInfo -Id @(<string>, <string>)
```

# Get-CsIncidentId
Search for incident IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/86/detections-monitoring-apis#find-incidents)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/incidents/QueryIncidents)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

### Example
```powershell
PS> Get-CsIncidentId
```

# Get-CsIncidentInfo
Get details on incidents by providing incident IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/86/detections-monitoring-apis#find-incidents)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/incidents/GetIncidents)**

### Parameters

`-Id`: One or more incident IDs

### Example
```powershell
PS> Get-CsIncidentInfo -Id @(<string>, <string>)
```

# Get-CsScore
Query CrowdScores

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/86/detections-monitoring-apis#show-crowd-scores)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/incidents/CrowdScore)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 2500]

`-Offset`: The offset to start retrieving records from [default: 0]

### Example
```powershell
PS> Get-CsScore
```