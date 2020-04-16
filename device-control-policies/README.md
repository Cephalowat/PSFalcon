# Add-CsControlGroup
Add a host group to a Device Control policy

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/performDeviceControlPoliciesAction)**

### Parameters

`-Id`: The Device Control Policy ID

`-Group`: The Host Group ID

### Example
```powershell
PS> Add-CsControlGroup -Id <string> -Group <string>
```

# Disable-CsControlPolicy
Disable Device Control policies

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/performDeviceControlPoliciesAction)**

### Parameters

`-Id`: An array of one or more Device Control policy IDs

### Example
```powershell
PS> Disable-CsControlPolicy -Id @(<string>, <string>)
```

# Edit-CsControlPolicy
Update Device Control Policies by specifying the ID of the policy and details to update

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/updateDeviceControlPolicies)**

### Parameters

`-Resources`: An array of Device Control policy properties

### Example
```powershell
PS> Edit-CsControlPolicy -Resources @(@{ id = <string>; name = <string>; description = <string> })
```

# Enable-CsControlPolicy
Enable Device Control policies

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/performDeviceControlPoliciesAction)**

### Parameters

`-Id`: An array of one or more Device Control policy IDs

### Example
```powershell
PS> Enable-CsControlPolicy -Id @(<string>, <string>)
```

# Get-CsControlMemberId
Search for members of a Device Control Policy in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/queryDeviceControlPolicyMembers)**

### Parameters

`-Id`: The ID of the Device Control policy to search for members of

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 5000]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsControlMemberId -Id <string>
```

# Get-CsControlMemberInfo
Search for details about members of a Device Control policy in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/queryCombinedDeviceControlPolicyMembers)**

### Parameters

`-Id`: The ID of the Device Control policy to search for members of

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 5000]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsControlMemberInfo -Id <string>
```

# Get-CsControlPolicyId
Search for Device Control policies in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/queryDeviceControlPolicies)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsControlPolicyId
```

# Get-CsControlPolicyInfo
Search for info about Device Control policies

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/queryCombinedDeviceControlPolicies)**

### Parameters

`-Id`: The IDs of specific Device Control policies to return

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsControlPolicyInfo
```

# New-CsControlPolicy
Create Device Control policies by specifying details about the policy to create

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/createDeviceControlPolicies)**

### Parameters

`-Resources`: An array of Device Control policy properties

### Example
```powershell
PS> New-CsControlPolicy -Resources @(@{ name = <string>; platform_name = <string> })
```

# Remove-CsControlGroup
Remove a Host Group from a Device Control policy

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/performDeviceControlPoliciesAction)**

### Parameters

`-Id`: The Device Control policy ID

`-Group`: The Host Group ID

### Example
```powershell
PS> Remove-CsControlGroup -Id <string> -Group <string>
```

# Remove-CsControlPolicy
Delete a set of Device Control policies by specifying their IDs

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/deleteDeviceControlPolicies)**

### Parameters

`-Id`: The IDs of the Device Control policies to delete

### Example
```powershell
PS> Remove-CsControlPolicy -Id @(<string>, <string>)
```

# Set-CsControlPrecedence
Sets the precedence of Device Control policies based on the order of IDs specified in the request

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/setDeviceControlPoliciesPrecedence)**

### Parameters

`-Platform`: The operating system platform the Device Control policies are assigned to

`-Id`: An array of one or more Device Control policy IDs

### Example
```powershell
PS> Set-CsControlPrecedence -Platform <string> -Id @(<string>, <string>)
```