# Add-CsPreventGroup
Add a Host Group to a Prevention policy

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/85/detection-and-prevention-policies-apis#assign-policies-to-groups)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/prevention-policies/performPreventionPoliciesAction)**

## Parameters

`-Id`: The Prevention Policy ID

`-Group`: The Host Group ID

## Example
```powershell
PS> Add-CsPreventGroup -Id <string> -Group <string>
```

# Disable-CsPreventPolicy
Disable Prevention policies

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/prevention-policies/performPreventionPoliciesAction)**

## Parameters

`-Id`: An array of one or more Prevention policy IDs

## Example
```powershell
PS> Disable-CsPreventPolicy -Id @(<string>, <string>)
```

# Edit-CsPreventPolicy
Update Prevention Policies by specifying the ID of the policy and details to update

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/85/detection-and-prevention-policies-apis#configure-policy-settings)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/prevention-policies/updatePreventionPolicies)**

## Parameters

`-Resources`: An array of Prevention policy properties

## Example
```powershell
PS> Edit-CsPreventPolicy -Resources @(@{ id = <string>; name = <string>; description = <string> })
```

# Enable-CsPreventPolicy
Enable Prevention policies

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/prevention-policies/performPreventionPoliciesAction)**

## Parameters

`-Id`: An array of one or more Prevention policy IDs

## Example
```powershell
PS> Enable-CsPreventPolicy -Id @(<string>, <string>)
```

# Get-CsPreventMemberId
Search for members of a Prevention policy in your environment

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/prevention-policies/queryPreventionPolicyMembers)**

## Parameters

`-Id`: The ID of the Prevention policy to search for members of

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [Default: 5000]

`-Offset`: The offset to start retrieving records from [Default: 0]

## Example
```powershell
PS> Get-CsPreventMemberId -Id <string>
```

# Get-CsPreventMemberInfo
Search for details about members of a Prevention policy in your environment

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/prevention-policies/queryCombinedPreventionPolicyMembers)**

## Parameters

`-Id`: The ID of the Prevention policy to search for members of

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [Default: 5000]

`-Offset`: The offset to start retrieving records from [Default: 0]

## Example
```powershell
PS> Get-CsPreventMemberInfo -Id <string>
```

# Get-CsPreventPolicyId
Search for Prevention policies in your environment

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/prevention-policies/queryPreventionPolicies)**

## Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [Default: 500]

`-Offset`: The offset to start retrieving records from [Default: 0]

## Example
```powershell
PS> Get-CsPreventPolicyId
```

# Get-CsPreventPolicyInfo
Search for info about Prevention policies

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/85/detection-and-prevention-policies-apis#find-existing-policies)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/prevention-policies/queryCombinedPreventionPolicies)**

## Parameters

`-Id`: The IDs of specific Prevention policies to return

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [Default: 500]

`-Offset`: The offset to start retrieving records from [Default: 0]

## Example
```powershell
PS> Get-CsPreventPolicyInfo
```

# New-CsPreventPolicy
Create Prevention policies by specifying details about the policy to create

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/85/detection-and-prevention-policies-apis#create-policies)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/prevention-policies/createPreventionPolicies)**

## Parameters

`-Resources`: An array of Prevention policy properties

## Example
```powershell
PS> New-CsPreventPolicy -Resources @(@{ name = <string>; platform_name = <string> })
```

# Remove-CsPreventGroup
Remove a Host Group from a Prevention policy

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/prevention-policies/performPreventionPoliciesAction)**

## Parameters

`-Id`: The Prevention policy ID

`-Group`: The Host Group ID

## Example
```powershell
PS> Remove-CsPreventGroup -Id <string> -Group <string>
```

# Remove-CsPreventPolicy
Delete a set of Prevention policies by specifying their IDs

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/prevention-policies/deletePreventionPolicies)**

## Parameters

`-Id`: The IDs of the Prevention policies to delete

## Example
```powershell
PS> Remove-CsPreventPolicy -Id @(<string>, <string>)
```

# Set-CsPreventPrecedence
Sets the precedence of Prevention policies based on the order of IDs specified in the request

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/85/detection-and-prevention-policies-apis#manage-policy-precedence)**, **[Swagger]()**

## Parameters

`-Platform`: The operating system platform the Prevention policies are assigned to

`-Id`: An array of one or more Prevention policy IDs

## Example
```powershell
PS> Set-CsPreventPrecedence -Platform <string> -Id @(<string>, <string>)
```