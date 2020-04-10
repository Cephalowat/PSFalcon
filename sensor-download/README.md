# Get-CsCCID
Request your Customer ID and Checksum

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/109/sensor-download-apis#get-your-customer-id-with-checksum)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-download/GetSensorInstallersCCIDByQuery)**

### Example
```powershell
PS> Get-CsCCID
```

# Get-CsInstallerId
Search for Falcon Sensor Installer hashes

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/109/sensor-download-apis#alternative-method)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-download/GetSensorInstallersByQuery)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset` : The offset to start retrieving records from [default: 0]

### Example
```powershell
PS> Get-CsInstallerId
```

# Get-CsInstallerInfo
Search for info about Falcon Sensor Installers

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/109/sensor-download-apis#find-a-sensor-installer)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-download/GetCombinedSensorInstallersByQuery)**

### Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [default: 500]

`-Offset`: The offset to start retrieving records from [default: 0]

`-Id`: Hashes of specific Falcon Sensor installers to return

### Example
```powershell
PS> Get-CsInstallerInfo
```

# Receive-CsInstaller
Download a specific Falcon Sensor Installer

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/109/sensor-download-apis#download-the-sensor-installer)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/sensor-download/DownloadSensorInstallerById)**

### Parameters

`-Id`: Falcon Sensor Installer hash

`-Path`: Destination path

### Example
```powershell
PS> Receive-CsInstaller -Id <string> -Path <string>
```