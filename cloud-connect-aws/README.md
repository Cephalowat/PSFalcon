# Add-FDAwsSettings
Create or update Global Settings which are applied to all provisioned AWS accounts

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#set-and-update-global-settings)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/CreateOrUpdateAWSSettings)**

## Parameters

`-Resources`: An array of AWS settings

## Example
```powershell
PS> Add-FDAwsSettings -Resources @(@{ cloudtrail_bucket_owner_id = <string>; static_external_id = <string> })
```

# Edit-FDAwsAccount
Update AWS accounts by specifying the ID of the group and details to update

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#update-aws-accounts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/UpdateAWSAccounts)**

## Parameters

`-Resources`: An array of AWS account properties

## Example
```powershell
PS> Edit-FDAwsAccount -Resources @(@{ id = <string>; external_id = <string> })
```

# Get-FDAwsAccess
Performs an access verification check on the specified AWS account IDs

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#verify-access-to-provisioned-aws-accounts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/VerifyAWSAccountAccess)**

## Parameters

`-Id`: IDs of accounts to verify access on

## Example
```powershell
PS> Get-FDAwsAccess -Id @(<string>, <string>)
```

# Get-FDAwsAccountId
Search for provisioned AWS Accounts

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#get-info-on-aws-accounts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/QueryAWSAccountsForIDs)**

## Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [Default: 500]

`-Offset`: The offset to start retrieving records from [Default: 0]

## Example
```powershell
PS> Get-FDAwsAccountId
```

# Get-FDAwsAccountInfo
Retrieve a set of AWS Accounts by specifying their IDs

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#get-info-on-aws-accounts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/GetAWSAccounts)**

## Parameters

`-Id`: IDs of accounts to retrieve details

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [Default: 500]

`-Offset`: The offset to start retrieving records from [Default: 0]

## Example
```powershell
PS> Get-FDAwsAccountInfo
```

# Get-FDAwsSettings
Retrieve a set of Global Settings which are applicable to all provisioned AWS accounts

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/GetAWSSettings)**

## Example
```powershell
PS> Get-FDAwsSettings
```

# New-FDAwsAccount
Provision AWS accounts by specifying details about the accounts to provision

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#enable-discover-for-aws-accounts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/ProvisionAWSAccounts)**

## Parameters

`-Mode`: Mode for provisioning. Allowed values are 'manual' or 'cloudformation' [Default: manual]

`-Resources`: An array of AWS account properties

## Example
```powershell
PS> New-FDAwsAccount -Resources @(@{ iam_role_arn = <string>; external_id = <string> })
```

# Remove-FDAwsAccount
Delete a set of AWS Accounts by specifying their IDs

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/91/discover-for-aws-apis#delete-aws-accounts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/cloud-connect-aws/DeleteAWSAccounts)**

## Parameters

`-Id`: IDs of accounts to remove

## Example
```powershell
PS> Remove-FDAwsAccount -Id @(<string>, <string>)
```