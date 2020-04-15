# Get-CsIoc
Search the custom IOCs in your account

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/88/custom-ioc-apis#find-and-get-details-on-custom-iocs)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/iocs/QueryIOCs)**

### Parameters

`-Type`: Type of the indicator

`-Value`: String representation of the indicator

`-After`: Find custom IOCs created after this time (RFC-3339 timestamp)

`-Before`: Find custom IOCs created before this time (RFC-3339 timestamp)

`-Policy`: Find custom IOCs within a policy [default: 'detect']

`-Source`: Source where this indicator originated

`-Share`: Share level of indicator [default: 'red']

`-CreatedBy`: User who created the custom IOC

`-DeletedBy`: User who deleted the custom IOC

`-Deleted`: Include deleted IOCs [default: False]

`-All`: Repeat requests until all results are retrieved

### Example
```powershell
PS> Get-CsIoc
```

# New-CsIoc
Create a new IOC

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/88/custom-ioc-apis#upload-custom-iocs)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/iocs/CreateIOC)**

### Parameters

`-Body`: An array of IOC properties

### Example
```powershell
PS> New-CsIoc -Body @(@{ type = <string>; value = <string>; policy = <string>})
```

# Remove-CsIoc
Delete an IOC by providing a type and value

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/88/custom-ioc-apis#delete-custom-iocs)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/iocs/DeleteIOC)**

### Parameters

`-Type`: The type of the indicator

`-Value`: The string representation of the indicator

### Example
```powershell
PS> Remove-CsIoc -Type <string> -Value <string>
```