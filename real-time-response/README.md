# Confirm-RtrBatch
Batch refresh a RTR session on multiple hosts

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/90/real-time-response-apis#send-real-time-response-commands-to-a-batch-of-hosts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response/BatchRefreshSessions)**

## Parameters

`-Id`: Batch ID to execute the command on

`-Timeout`: Timeout for how long to wait for the request in seconds [default: 30, maximum 600]

`-Remove`: An array of agent IDs to remove from the batch session. Heartbeats will no longer happen on these
hosts and the sessions will expire

## Example
```powershell
PS> Confirm-RtrBatch -Id <string>
```

# Confirm-RtrGetFile
Retrieves the status of the specified batch get command

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response/BatchGetCmdStatus)**

## Parameters

`-Id`: Batch Get Command Request ID received from

`-Timeout`: Time to wait for the command request in seconds [default: 30, maximum 600]

## Example
```powershell
PS> Confirm-RtrGetFile -Id <string>
```

# Get-RtrCloudFileId
Get a list of 'put' file IDs that are available to the user for the 'put' command

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/90/real-time-response-apis#find-and-get-info-on-an-existing-real-time-response-file)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response-admin/RTR_ListPut_Files)**

## Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [Default: 5000]

`-Offset`: The offset to start retrieving records from [Default: 0]

## Example
```powershell
PS> Get-RtrCloudFileId
```

# Get-RtrCloudFileInfo
Get 'put' files based on the ID's given

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/90/real-time-response-apis#find-and-get-info-on-an-existing-real-time-response-file)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response-admin/RTR_GetPut_Files)**

## Parameters

`-Id`: File IDs

## Example
```powershell
PS> Get-RtrCloudFileInfo -Id @(<string>, <string>)
```

# Get-RtrCloudScriptId
Get a list of custom-script ID's that are available to the user for the 'runscript' command

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/90/real-time-response-apis#find-and-get-info-on-an-existing-real-time-response-script)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response-admin/RTR_ListScripts)**

## Parameters

`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return [Default: 5000]

`-Offset`: The offset to start retrieving records from [Default: 0]

## Example
```powershell
PS> Get-RtrCloudScriptId
```

# Get-RtrCloudScriptInfo
Get custom-scripts based on the ID's given

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/90/real-time-response-apis#find-and-get-info-on-an-existing-real-time-response-script)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response-admin/RTR_GetScripts)**

## Parameters

`-Id`: Script IDs

## Example
```powershell
PS> Get-RtrCloudScriptInfo -Id @(<string>, <string>)
```

# New-RtrCloudFile
Upload a new put-file to use for the RTR 'put' command

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/90/real-time-response-apis#create-a-new-real-time-response-file)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response-admin/RTR_CreatePut_Files)**

## Parameters

`-Path`: Full path to the file to upload

`-Description`: File description

`-Name`: File name (if different than actual file name)

`-Comment`: The audit log comment

## Example
```powershell
PS> New-RtrCloudFile -Path <string> -Description <string>
```

# New-RtrCloudScript
Upload a new custom-script to use for the RTR 'runscript' command

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/90/real-time-response-apis#create-a-new-real-time-response-script)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response-admin/RTR_CreateScripts)**

## Parameters

`-Path`: Full path to the script you wish to upload

`-Permission`: Permission for the custom-script [Default: private]

`-Description`: File description

`-Name`: File name (if different than actual file name)

`-Comment`: The audit log comment

## Example
```powershell
PS> New-RtrCloudScript -Path <string> -Permission <string> -Description <string>
```

# Receive-RtrGetFile
Get RTR extracted file contents for specified session and sha256

## API References
**[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response/RTR_GetExtractedFileContents)**

## Parameters

`-Id`: RTR Session Id

`-Hash`: Extracted SHA256 hash

`-Path`: Destination path

## Example
```powershell
PS> Receive-RtrGetFile -Id <string> -Hash <string> -Path <string>
```

# Remove-RtrCloudFile
Delete a 'put' file based on the ID given

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/90/real-time-response-apis#delete-an-existing-real-time-response-file)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response-admin/RTR_DeletePut_Files)**

## Parameters

`-Id`: File ID

## Example
```powershell
PS> Remove-RtrCloudFile -Id <string>
```

# Remove-RtrCloudScript
Delete a custom-script based on the ID given

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/90/real-time-response-apis#delete-an-existing-real-time-response-script)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response-admin/RTR_DeleteScripts)**

## Parameters

`-Id`: Script ID

## Example
```powershell
PS> Remove-RtrCloudScript -Id <string>
```

# Send-RtrCommand
Batch executes a RTR command across the hosts mapped to the given batch ID

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/90/real-time-response-apis#send-real-time-response-commands-to-a-batch-of-hosts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response/BatchCmd)**

## Parameters

`-Id`: Batch ID to execute the command on

`-Command`: Command to execute

`-String`: Command string (text that follows the 'base command')

`-Timeout`: Time to wait for the command request in seconds [default: 30, maximum 600]

`-Optional`: List of a subset of hosts we want to run the command on. If this list is supplied, only
these hosts will receive the command

## Example
```powershell
PS> Send-RtrCommand -Id <string> -Command <string> -String <string>
```

# Send-RtrGetCommand
Batch executes 'get' command across hosts to retrieve files

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/90/real-time-response-apis#send-real-time-response-commands-to-a-batch-of-hosts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response/BatchGetCmd)**

## Parameters

`-Id`: Batch ID to execute the command on

`-Path`: Full path to the file that is to be retrieved from each host in the batch

`-Timeout`: Time to wait for the command request in seconds [default: 30, maximum 600]

`-Optional`: List of a subset of hosts we want to run the command on. If this list is supplied, only
these hosts will receive the command

## Example
```powershell
PS> Send-RtrGetCommand -Id <string> -Path <string>
```

# Start-RtrBatch
Batch initialize a RTR session on multiple hosts

## API References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/90/real-time-response-apis#send-real-time-response-commands-to-a-batch-of-hosts)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/real-time-response/BatchInitSessions)**

## Parameters

`-Id`: List of host agent IDs to initialize a RTR session on

`-Existing`: Optional batch ID. Use an existing batch ID if you want to initialize new hosts and
add them to an existing batch

`-Timeout`: Time to wait for the command request to complete, in seconds [default: 30, maximum 600]

## Example
```powershell
PS> Start-RtrBatch -Id @(<string>, <string>)
```