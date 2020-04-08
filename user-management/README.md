# Add-CsUser
Create a new user

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/87/users-and-roles-apis#create-a-new-user)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/user-management/CreateUser)**

## Parameters

`-Username`: The user's email address (or username)

`-First`: The user's first name

`-Last`: The user's last name

## Example
```powershell
PS> Add-CsUser -Username <string> -First <string> -Last <string>
```

# Add-CsUserRole
Assign one or more roles to an existing user

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/87/users-and-roles-apis#assign-a-role-to-a-user)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/user-management/GrantUserRoleIds)**

## Parameters

`-Id`: ID of a user

`-Role`: An array of one or more roles to assign to the user

## Example
```powershell
PS> Add-CsUserRole -Id <string> -Role @(<string>, <string>)
```

# Edit-CsUser
Modify an existing user's first or last name

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/87/users-and-roles-apis#modify-an-existing-user)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/user-management/UpdateUser)**

## Parameters

`-Id`: ID of a user

`-First`: The user's first name

`-Last`: The user's last name

## Example
```powershell
PS> Edit-CsUser -Id <string> -Last <string>
```

# Get-CsRole
List all roles available in your account

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/87/users-and-roles-apis#find-all-roles-available-in-your-customer-account)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/user-management/GetAvailableRoleIds)**

## Example
```powershell
PS> Get-CsRole
```

# Get-CsUserId
Retrieve all User Ids in your account, or an Id for a specific Username

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/87/users-and-roles-apis#find-existing-users)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/user-management/RetrieveUserUUID)**

## Parameters

`-Username`: This is usually the user’s email address, but may vary based on your configuration

## Example
```powershell
PS> Get-CsUserId
```

# Get-CsUserInfo
Get info about user IDs

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/87/users-and-roles-apis#find-existing-users)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/user-management/RetrieveUser)**

## Parameters

`-Id`: ID of one or more users

## Example
```powershell
PS> Get-CsUserInfo -Id @(<string>, <string>)
```

# Get-CsUsername
List all usernames (typically email addresses) in your account

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/87/users-and-roles-apis#find-existing-users)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/user-management/RetrieveUserUUIDsByCID)**

## Example
```powershell
PS> Get-CsUsername
```

# Get-CsUserRole
Show roles assigned to a user

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/user-management/GetRoles)**

## Parameters

`-Id`: ID of a user

## Example
```powershell
PS> Get-CsUserRole -Id <string>
```

# Remove-CsUser
Delete a user permanently

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/87/users-and-roles-apis#delete-an-existing-user)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/user-management/DeleteUser)**

## Parameters

`-Id`: ID of a user

## Example
```powershell
PS> Remove-CsUser -Id <string>
```

# Remove-CsUserRole
Revoke one or more roles from a user

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/87/users-and-roles-apis#revoke-a-role-from-a-user)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/user-management/RevokeUserRoleIds)**

## Parameters


`-Id`: ID of a user

`-Role`: An array of one or more roles to remove from the user

## Example
```powershell
PS> Remove-CsUserRole -Id <string> -Role @(<string>, <string>)
```