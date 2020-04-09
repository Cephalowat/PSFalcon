# Get-CsHostId
Search for hosts in your environment

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/84/host-and-host-group-management-apis#find-hosts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/hosts/QueryDevicesByFilter)**

### Parameters
`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return

`-Offset`: The offset to start retrieving records from

### Example
```powershell
PS> Get-CsHostId
```

# Get-CsHostInfo
Get details on one or more hosts by providing agent IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/84/host-and-host-group-management-apis#get-info-about-hosts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/hosts/GetDeviceDetails)**

### Parameters
`-Id`: The host agent IDs used to get details on

### Example
```powershell
PS> Get-CsHostInfo -Id @(<string>, <string>)
```

# Hide-CsHost
Delete hosts. After a host is deleted, no new detections for that host will be reported in the UI or APIs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/84/host-and-host-group-management-apis#delete-and-restore-hosts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/hosts/PerformActionV2)**

### Parameters
`-Id`: An array of one or more agent IDs to hide

### Example
```powershell
PS> Hide-CsHost -Id @(<string>, <string>)
```

# Show-CsHost
Restore hosts. Detection reporting will resume after the host is restored

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/84/host-and-host-group-management-apis#delete-and-restore-hosts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/hosts/PerformActionV2)**

### Parameters
`-Id`: An array of one or more agent IDs to restore

### Example
```powershell
PS> Show-CsHost -Id @(<string>, <string>)
```

# Start-CsContain
Contain hosts. Stops any network communication to locations other than the CrowdStrike cloud and IPs specified
in your containment policy

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/84/host-and-host-group-management-apis#contain-or-lift-containment-on-hosts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/hosts/PerformActionV2)**

### Parameters
`-Id`: An array of one or more agent IDs to contain

### Example
```powershell
PS> Start-CsContain -Id @(<string>, <string>)
```

# Stop-CsContain
Lift containment on hosts. Returns network communications to normal

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/84/host-and-host-group-management-apis#contain-or-lift-containment-on-hosts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/hosts/PerformActionV2)**

### Parameters
`-Id`: An array of one or more agent IDs to release from containment

### Example
```powershell
PS> Stop-CsContain -Id @(<string>, <string>)
```