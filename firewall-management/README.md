# Edit-CsFirewallPolicySettings
Edit existing Firewall Policy settings

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/update_policy_container)**

### Parameters

`-Comment`: Optional audit log comment

`-Body`: A hashtable of Firewall Policy properties

### Example
```powershell
PS> Edit-CsFirewallPolicySettings -Body @{ policy_id = <string>; platform_id = <int> }
```

# Edit-CsFirewallRuleGroup
Edit an existing Firewall Rule Group

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/update_rule_group)**

### Parameters

`-Comment`: Optional audit log comment

`-Body`: A hashtable of Rule Group properties

### Example
```powershell
PS> Edit-CsFirewallRuleGroup -Body @{ id = <string>; rule_ids = @(<string>, <string>) }
```

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

# Get-CsFirewallPolicySettings
Returns basic Firewall Policy settings

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/get_policy_containers)**

### Parameters

`-Id`: Target Firewall Policy IDs

### Example
```powershell
PS> Get-CsFirewallPolicySettings -Id @(<string>, <string>)
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

# Get-CsFirewallRuleId
Search for Firewall Rule IDs in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/query_rules)**

### Parameters

`-Id`: A specific Firewall policy ID to return rules for

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

# New-CsFirewallRuleGroup
Create a new Firewall Rule Group

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/create_rule_group)**

### Parameters

`-Clone`: A Rule Group ID to copy rules from

`-Library`: If toggled, rules will be cloned from the CrowdStrike Firewall Rule Groups Library

`-Comment`: Optional audit log comment

`-Body`: A hashtable of Rule Group properties

### Example
```powershell
PS> New-CsFirewallRuleGroup -Body @{ name = <string>; rules = @(<hashtable>) }
```

# Remove-CsFirewallRuleGroup
Delete a Firewall Rule Groups by ID

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-management/delete_rule_groups)**

### Parameters

`-Id`: The IDs of the Firewall Rule Groups to delete

`-Comment`: Optional audit log comment

### Example
```powershell
PS> Remove-CsFirewallRuleGroup -Id @(<string>, <string>)
```