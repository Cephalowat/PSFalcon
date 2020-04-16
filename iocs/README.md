# Edit-CsIoc
Update an IOC by providing a type and value

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/88/custom-ioc-apis#modify-custom-iocs)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/iocs/UpdateIOC)**

### Parameters

`-Type`: The type of the indicator

`-Value`: The string representation of the indicator

`-Body`: A hashtable of IOC properties to modify

### Example
```powershell
PS> Edit-CsIoc -Type <string> -Value <string> -Body @(@{ source = <string>; description = <string> })
```

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

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat requests until all results are retrieved

### Example
```powershell
PS> Get-CsIoc
```

# Get-CsIocHostId
Find Host IDs that have observed a custom IOC

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/88/custom-ioc-apis#investigate-custom-iocs)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/iocs/DevicesRanOn)**

### Parameters

`-Type`: The type of the indicator

`-Value`: The string representation of the indicator

`-Limit`: The maximum records to return [default: 100]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat requests until all results are retrieved

### Example
```powershell
PS> Get-CsIocHostId -Type <string> -Value <string>
```

# Get-CsIocInfo
Get details about a custom IOC

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/88/custom-ioc-apis#find-and-get-details-on-custom-iocs)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/iocs/GetIOC)**

### Parameters

`-Type`: The type of the indicator

`-Value`: The string representation of the indicator

### Example
```powershell
PS> Get-CsIocInfo -Type <string> -Value <string>
```

# Get-CsIocProcessId
Find processes on a Host associated with a custom IOC

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/88/custom-ioc-apis#investigate-custom-iocs)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/iocs/ProcessesRanOn)**

### Parameters

`-Type`: The type of the indicator

`-Value`: The string representation of the indicator

`-Id`: Target Host ID

`-Limit`: The maximum records to return [default: 100]

`-Offset`: The offset to start retrieving records from [default: 0]

`-All`: Repeat requests until all results are retrieved

### Example
```powershell
PS> Get-CsIocProcessId -Type <string> -Value <string> -Id <string>
```

# Get-CsIocProcessInfo
Return details about Process IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/88/custom-ioc-apis#investigate-custom-iocs)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/iocs/DevicesRanOn)**

### Parameters

`-Id`: Target Process IDs

### Example
```powershell
PS> Get-CsIocProcessInfo -Id @(<string>, <string>)
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