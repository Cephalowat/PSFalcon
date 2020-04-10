# Add-CsFirewallGroup
Add a Host Group to a Firewall policy

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-policies/performFirewallPoliciesAction)**

### Parameters

`-Id`: The Firewall Policy ID

`-Group`: The Host Group ID

### Example
```powershell
PS> Add-CsFirewallGroup -Id <string> -Group <string>
```

# Disable-CsFirewallPolicy
Disable Firewall policies

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-policies/performFirewallPoliciesAction)**

### Parameters

`-Id`: An array of one or more Firewall policy IDs

### Example
```powershell
PS> Disable-CsFirewallPolicy -Id @(<string>, <string>)
```

# Edit-CsFirewallPolicy
Update Firewall Policies by specifying the ID of the policy and details to update

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-policies/updateFirewallPolicies)**

### Parameters

`-Resources`: An array of Firewall policy properties

### Example
```powershell
PS> Edit-CsFirewallPolicy -Resources @(@{ id = <string>; name = <string>; description = <string> })
```

# Enable-CsFirewallPolicy
Enable Firewall policies

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-policies/performFirewallPoliciesAction)**

### Parameters

`-Id`: An array of one or more Firewall policy IDs

### Example
```powershell
PS> Enable-CsFirewallPolicy -Id @(<string>, <string>)
```

# Get-CsFirewallMemberId
Search for members of a Firewall policy in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-policies/queryFirewallPolicyMembers)**

### Parameters

`-Id`: The ID of the Firewall policy to search for members of

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 5000]

`-Offset`: The offset to start retrieving records from [default: 0]

### Example
```powershell
PS> Get-CsFirewallMemberId -Id <string>
```

# Get-CsFirewallMemberInfo
Search for details about members of a Firewall policy in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-policies/queryCombinedFirewallPolicyMembers)**

### Parameters

`-Id`: The ID of the Firewall policy to search for members of

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 5000]

`-Offset`: The offset to start retrieving records from [default: 0]

### Example
```powershell
PS> Get-CsFirewallMemberInfo -Id <string>
```

# Get-CsFirewallPolicyId
Search for Firewall policies in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-policies/queryFirewallPolicies)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

### Example
```powershell
PS> Get-CsFirewallPolicyId
```

# Get-CsFirewallPolicyInfo
Search for info about Firewall policies

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-policies/queryCombinedFirewallPolicies)**

### Parameters

`-Id`: The IDs of specific Firewall policies to return

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

### Example
```powershell
PS> Get-CsFirewallPolicyInfo
```

# New-CsFirewallPolicy
Create Firewall policies by specifying details about the policy to create

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-policies/createFirewallPolicies)**

### Parameters

`-Resources`: An array of Firewall policy properties

### Example
```powershell
PS> New-CsFirewallPolicy -Resources @(@{ name = <string>; platform_name = <string> })
```

# Remove-CsFirewallGroup
Remove a Host Group from a Firewall policy

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-policies/performFirewallPoliciesAction)**

### Parameters

`-Id`: The Firewall policy ID

`-Group`: The Host Group ID

### Example
```powershell
PS> Remove-CsFirewallGroup -Id <string> -Group <string>
```

# Remove-CsFirewallPolicy
Delete a set of Firewall policies by specifying their IDs

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-policies/deleteFirewallPolicies)**

### Parameters

`-Id`: The IDs of the Firewall policies to delete

### Example
```powershell
PS> Remove-CsFirewallPolicy -Id @(<string>, <string>)
```

# Set-CsFirewallPrecedence
Sets the precedence of Firewall policies based on the order of IDs specified in the request

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/firewall-policies/setFirewallPoliciesPrecedence)**

### Parameters

`-Id`: An array of one or more Firewall policy IDs

### Example
```powershell
PS> Set-CsFirewallPrecedence -Id @(<string>, <string>)
```