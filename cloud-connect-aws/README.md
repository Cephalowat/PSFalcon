# Add-CsAwsSettings
Create or update Global Settings which are applied to all provisioned AWS accounts

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#set-and-update-global-settings)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/CreateOrUpdateAWSSettings)**

### Parameters

`-Resources`: An array of AWS settings

### Example
```powershell
PS> Add-CsAwsSettings -Resources @(@{ cloudtrail_bucket_owner_id = <string>; static_external_id = <string> })
```

# Edit-CsAwsAccount
Update AWS accounts by specifying the ID of the group and details to update

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#update-aws-accounts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/UpdateAWSAccounts)**

### Parameters

`-Resources`: An array of AWS account properties

### Example
```powershell
PS> Edit-CsAwsAccount -Resources @(@{ id = <string>; external_id = <string> })
```

# Get-CsAwsAccess
Performs an access verification check on the specified AWS account IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#verify-access-to-provisioned-aws-accounts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/VerifyAWSAccountAccess)**

### Parameters

`-Id`: IDs of accounts to verify access on

### Example
```powershell
PS> Get-CsAwsAccess -Id @(<string>, <string>)
```

# Get-CsAwsAccountId
Search for provisioned AWS Accounts

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#get-info-on-aws-accounts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/QueryAWSAccountsForIDs)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsAwsAccountId
```

# Get-CsAwsAccountInfo
Retrieve a set of AWS Accounts by specifying their IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#get-info-on-aws-accounts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/GetAWSAccounts)**

### Parameters

`-Id`: IDs of accounts to retrieve details

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-CsAwsAccountInfo
```

# Get-CsAwsSettings
Retrieve a set of Global Settings which are applicable to all provisioned AWS accounts

### References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/GetAWSSettings)**

### Example
```powershell
PS> Get-CsAwsSettings
```

# New-CsAwsAccount
Provision AWS accounts by specifying details about the accounts to provision

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#enable-discover-for-aws-accounts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/ProvisionAWSAccounts)**

### Parameters

`-Mode`: Mode for provisioning. Allowed values are 'manual' or 'cloudformation' [default: manual]

`-Resources`: An array of AWS account properties

### Example
```powershell
PS> New-CsAwsAccount -Resources @(@{ iam_role_arn = <string>; external_id = <string> })
```

# Remove-CsAwsAccount
Delete a set of AWS Accounts by specifying their IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#delete-aws-accounts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/DeleteAWSAccounts)**

### Parameters

`-Id`: IDs of accounts to remove

### Example
```powershell
PS> Remove-CsAwsAccount -Id @(<string>, <string>)
```