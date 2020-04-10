# Add-CsGroupMember
Add Hosts to a static Host Group

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/84/host-and-host-group-management-apis#assign-hosts-to-a-static-group)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/host-group/performGroupAction)**

### Parameters

`-Id`: The Host Group ID

`-Hosts`: One or more Agent IDs to add to the Host Group

### Example
```powershell
PS> Add-CsGroupMember -Id <string> -Hosts @(<string>, <string>)
```

# Edit-CsGroup
Update Host Groups by specifying the ID of the group and details to update

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/host-group/updateHostGroups)**

### Parameters

`-Resources`: An array of Host Group properties

### Example
```powershell
PS> Edit-CsGroup -Resources @(@{ id = <string>; assignment_rule = <string> }),
```

# Get-CsGroupId
Search for Host Groups IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/84/host-and-host-group-management-apis#find-existing-host-groups)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/host-group/queryHostGroups)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

### Example
```powershell
PS> Get-CsGroupId
```

# Get-CsGroupInfo
Search for info about Host Groups

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/host-group/queryCombinedHostGroups)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

`-Id`: IDs of specific host groups to return

### Example
```powershell
PS> Get-CsGroupInfo
```

# Get-CsGroupMemberId
Search for members of a Host Group in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/host-group/queryGroupMembers)**

### Parameters

`-Id`: The ID of the Host Group to search for members of

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 5000]

`-Offset`: The offset to start retrieving records from [default: 0]

### Example
```powershell
PS> Get-CsGroupMemberId -Id <string>
```

# Get-CsGroupMemberInfo
Search for detail about members of a Host Group in your environment

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/host-group/queryCombinedGroupMembers)**

### Parameters

`-Id`: The ID of the Host Group to search for members of

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 5000]

`-Offset`: The offset to start retrieving records from [default: 0]

### Example
```powershell
PS> Get-CsGroupMemberInfo -Id <string>
```

# New-CsGroup
Create Host Groups by specifying details about the group to create

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/84/host-and-host-group-management-apis#create-host-groups)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/host-group/createHostGroups)**

### Parameters

`-Resources`: An array of Host Group properties

### Example
```powershell
PS> New-CsGroup -Resources @(@{ name = <string>; description = <string> })
```

# Remove-CsGroup
Delete a set of Host Groups by specifying their IDs

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/host-group/deleteHostGroups)**

### Parameters

`-Id`:  An array of IDs of the Host Groups to delete

### Example
```powershell
PS> Remove-Group -Id @(<string>, <string>)
```

# Remove-CsGroupMember
Remove hosts from a static group

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/host-group/performGroupAction)**

### Parameters

`-Id`: The Host Group ID

`-Hosts`: One or more agent IDs to remove from the group

### Example
```powershell
PS> Remove-CsGroupMember -Id <string> -Hosts @(<string>, <string>)
```