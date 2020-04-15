# Get-CsFirewallEventId
Search for Firewall Event IDs in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/query_events)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Query`: Search all firewall event metadata for the provided string

`-Limit`: The maximum records to return [default: 5000]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsFirewallEventId
```

# Get-CsFirewallEventInfo
Get detail about Firewall Events by ID

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/get_events)**

### Parameters

`-Id`: Target Firewall Event IDs

### Example
```powershell
PS> Get-CsFirewallEventInfo -Id @(<string>, <string>)
```