# Add-FDCGroup
Add a host group to a Device Control policy

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/performDeviceControlPoliciesAction)**

## Parameters

`-Id`: The Device Control Policy ID

`-Group`: The Host Group ID

## Example
```powershell
PS> Add-FDCGroup -Id <string> -Group <string>
```

# Disable-FDCPolicy
Disable Device Control policies

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/performDeviceControlPoliciesAction)**

## Parameters

`-Id`: An array of one or more Device Control policy IDs

## Example
```powershell
PS> Disable-FDCPolicy -Id @(<string>, <string>)
```

# Edit-FDCPolicy
Update Device Control Policies by specifying the ID of the policy and details to update

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/updateDeviceControlPolicies)**

## Parameters

`-Resources`: An array of Device Control policy properties

## Example
```powershell
PS> Edit-FDCPolicy -Resources @(@{ id = <string>; name = <string>; description = <string> })
```

# Enable-FDCPolicy
Enable Device Control policies

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/performDeviceControlPoliciesAction)**

## Parameters

`-Id`: An array of one or more Device Control policy IDs

## Example
```powershell
PS> Enable-FDCPolicy -Id @(<string>, <string>)
```

# Get-FDCMemberId
Search for members of a Device Control Policy in your environment

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/queryDeviceControlPolicyMembers)**

## Parameters

`-Id`: The ID of the Device Control policy to search for members of

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [Default: 5000]

`-Offset`: The offset to start retrieving records from [Default: 0]

## Example
```powershell
PS> Get-FDCMemberId -Id <string>
```

# Get-FDCMemberInfo
Search for details about members of a Device Control policy in your environment

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/queryCombinedDeviceControlPolicyMembers)**

## Parameters

`-Id`: The ID of the Device Control policy to search for members of

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [Default: 5000]

`-Offset`: The offset to start retrieving records from [Default: 0]

## Example
```powershell
PS> Get-FDCMemberInfo -Id <string>
```

# Get-FDCPolicyId
Search for Device Control policies in your environment

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/queryDeviceControlPolicies)**

## Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [Default: 500]

`-Offset`: The offset to start retrieving records from [Default: 0]

## Example
```powershell
PS> Get-FDCPolicyId
```

# Get-FDCPolicyInfo
Search for info about Device Control policies

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/queryCombinedDeviceControlPolicies)**

## Parameters

`-Id`: The IDs of specific Device Control policies to return

`-Filter`: The filter expression that should be used to limit the results (when IDs are not provided)

`-Limit`: The maximum records to return [Default: 500] (when IDs are not provided)

`-Offset`: The offset to start retrieving records from [Default: 0] (when IDs are not provided)


## Example
```powershell
PS> Get-FDCPolicyInfo
```

# New-FDCPolicy
Create Device Control policies by specifying details about the policy to create

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/createDeviceControlPolicies)**

## Parameters

`-Resources`: An array of Device Control policy properties

## Example
```powershell
PS> New-FDCPolicy -Resources @(@{ name = <string>; platform_name = <string> })
```

# Remove-FDCGroup
Remove a Host Group from a Device Control policy

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/performDeviceControlPoliciesAction)**

## Parameters

`-Id`: The Device Control policy ID

`-Group`: The Host Group ID

## Example
```powershell
PS> Remove-FDCGroup -Id <string> -Group <string>
```

# Remove-FDCPolicy
Delete a set of Device Control policies by specifying their IDs

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/deleteDeviceControlPolicies)**

## Parameters

`-Id`: The IDs of the Device Control policies to delete

## Example
```powershell
PS> Remove-FDCPolicy -Id @(<string>, <string>)
```

# Set-FDCPrecedence
Sets the precedence of Device Control policies based on the order of IDs specified in the request

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/device-control-policies/setDeviceControlPoliciesPrecedence)**

## Parameters

`-Platform`: The operating system platform the Device Control policies are assigned to

`-Id`: An array of one or more Device Control policy IDs

## Example
```powershell
PS> Set-FDCPrecedence -Platform <string> -Id @(<string>, <string>)
```