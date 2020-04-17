# Get-CsFirewallEventId
Find Firewall Event IDs in your environment

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

# Get-CsFirewallFieldId
Get firewall field specification ids

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/query_firewall_fields)**

### Parameters

`-Id`: A specific platform id

`-Limit`: The maximum records to return [default: 100]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsFirewallFieldId
```

# Get-CsFirewallFieldInfo
Get firewall field specifications

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/get_firewall_fields)**

### Parameters

`-Id`: Specific fields specification ids to retrieve

### Example
```powershell
PS> Get-CsFirewallFieldInfo
```

# Get-CsFirewallRuleGroupId
Search for Firewall Rule Group IDs in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/query_rule_groups)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Query`: Search all firewall event metadata for the provided string

`-Limit`: The maximum records to return [default: 5000]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsFirewallRuleGroupId
```

# Get-CsFirewallRuleGroupInfo
Get detail about Firewall Rule Groups by ID

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/get_rule_groups)**

### Parameters

`-Id`: Target Firewall Rule Group IDs

### Example
```powershell
PS> Get-CsFirewallRuleGroupInfo -Id @(<string>, <string>)
```

# Get-CsFirewallPlatformId
Get firewall platform ids

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/query_platforms)**

### Parameters

`-Limit`: The maximum records to return [default: 100]

`-Offset`: The offset to start retrieving records from [default: 0]

### Example
```powershell
PS> Get-CsFirewallPlatformId
```

# Get-CsFirewallPlatformInfo
Get firewall platform names

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/get_platforms)**

### Parameters

`-Id`: Specific platform ids to return

### Example
```powershell
PS> Get-CsFirewallPlatformInfo -Id @(<string>, <string>)
```

# Get-CsFirewallRuleId
Search for Firewall Rule IDs in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/query_rules)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Query`: Search all firewall event metadata for the provided string

`-Limit`: The maximum records to return [default: 5000]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsFirewallRuleId
```

# Get-CsFirewallRuleInfo
Get detail about Firewall Rules by ID

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/get_rules)**

### Parameters

`-Id`: Target Firewall Rule IDs

### Example
```powershell
PS> Get-CsFirewallRuleInfo -Id @(<string>, <string>)
```