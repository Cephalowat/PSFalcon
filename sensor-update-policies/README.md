# Add-CsSensorGroup
Add a Host Group to a Sensor Update policy

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/85/detection-and-prevention-policies-apis#assign-policies-to-groups)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/performSensorUpdatePoliciesAction)**

### Parameters

`-Id`: The Sensor Update Policy ID

`-Group`: The Host Group ID

### Example
```powershell
PS> Add-CsSensorGroup -Id <string> -Group <string>
```

# Disable-CsSensorPolicy
Disable Sensor Update policies

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/performSensorUpdatePoliciesAction)**

### Parameters

`-Id`: An array of one or more Sensor Update policy IDs

### Example
```powershell
PS> Disable-CsSensorPolicy -Id @(<string>, <string>)
```

# Edit-CsSensorPolicy
Update Sensor Update Policies by specifying the ID of the policy and details to update

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/85/detection-and-prevention-policies-apis#configure-policy-settings)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/updateSensorUpdatePolicies)**

### Parameters

`-Resources`: An array of Sensor Update policy properties

### Example
```powershell
PS> Edit-CsSensorPolicy -Resources @(@{ id = <string>; name = <string>; description = <string> })
```

# Enable-CsSensorPolicy
Enable Sensor Update policies

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/performSensorUpdatePoliciesAction)**

### Parameters

`-Id`: An array of one or more Sensor Update policy IDs

### Example
```powershell
PS> Enable-CsSensorPolicy -Id @(<string>, <string>)
```

# Get-CsSensorBuild
Retrieve available builds for use with Sensor Update policies

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/queryCombinedSensorUpdateBuilds)**

### Parameters

`-Platform`: The operating system to return builds for

### Example
```powershell
PS> Get-CsSensorBuild -Platform <string>
```

# Get-CsSensorMemberId
Search for members of a Sensor Update policy in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/querySensorUpdatePolicyMembers)**

### Parameters

`-Id`: The ID of the Sensor Update policy to search for members of

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 5000]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsSensorMemberId -Id <string>
```

# Get-CsSensorMemberInfo
Search for details about members of a Sensor Update policy in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/queryCombinedSensorUpdatePolicyMembers)**

### Parameters

`-Id`: The ID of the Sensor Update policy to search for members of

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 5000]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsSensorMemberInfo -Id <string>
```

# Get-CsSensorPolicyId
Search for Sensor Update policies in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/querySensorUpdatePolicies)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsSensorPolicyId
```

# Get-CsSensorPolicyInfo
Search for info about Sensor Update policies

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/85/detection-and-prevention-policies-apis#find-existing-policies)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/queryCombinedSensorUpdatePoliciesV2)**

### Parameters

`-Id`: The IDs of specific Sensor Update policies to return

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsSensorPolicyInfo
```

# Get-CsUninstallToken
Reveals an uninstall token for a specific host

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/revealUninstallToken)**

### Parameters

`-Id`: The target Agent ID. To retrieve the bulk maintenance token use 'MAINTENANCE'

`-Audit`: An audit message explaining the reason for the token reveal

### Example
```powershell
PS> Get-CsUninstallToken -Id <string> -Audit <string>
```

# New-CsSensorPolicy
Create Sensor Update policies by specifying details about the policy to create

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/85/detection-and-prevention-policies-apis#create-policies)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/createSensorUpdatePolicies)**

### Parameters

`-Resources`: An array of Sensor Update policy properties

### Example
```powershell
PS> New-CsSensorPolicy -Resources @(@{ name = <string>; platform_name = <string> })
```

# Remove-CsSensorGroup
Remove a Host Group from a Sensor Update policy

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/performSensorUpdatePoliciesAction)**

### Parameters

`-Id`: The Sensor Update policy ID

`-Group`: The Host Group ID

### Example
```powershell
PS> Remove-CsSensorGroup -Id <string> -Group <string>
```

# Remove-CsSensorPolicy
Delete a set of Sensor Update policies by specifying their IDs

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/deleteSensorUpdatePolicies)**

### Parameters

`-Id`: The IDs of the Sensor Update policies to delete

### Example
```powershell
PS> Remove-CsSensorPolicy -Id @(<string>, <string>)
```

# Set-CsSensorPrecedence
Sets the precedence of Sensor Update policies based on the order of IDs specified in the request

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/85/detection-and-prevention-policies-apis#manage-policy-precedence)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-update-policies/setSensorUpdatePoliciesPrecedence)**

### Parameters

`-Platform`: The operating system platform the Sensor Update policies are assigned to

`-Id`: An array of one or more Sensor Update policy IDs

### Example
```powershell
PS> Set-CsSensorPrecedence -Platform <string> -Id @(<string>, <string>)
```