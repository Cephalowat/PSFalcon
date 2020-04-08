# Get-CsHostId
Search for hosts in your environment

## API References
**[Documentation]()**, **[Swagger]()**

## Parameters
`-Filter`: The filter expression that should be used to limit the results

`-Limit`: The maximum records to return

`-Offset`: The offset to start retrieving records from

## Example
```powershell
PS> $HostIds = (Get-CsHostId).resources
```

# Get-CsHostInfo
Get details on one or more hosts by providing agent IDs

## API References
**[Documentation]()**, **[Swagger]()**

## Parameters
`-Id`: The host agent IDs used to get details on

## Example
```powershell
PS> (Get-CsHostInfo -Id $HostIds).resources
```

# Hide-CsHost
Delete hosts. After a host is deleted, no new detections for that host will be reported in the UI or APIs

## API References
**[Documentation]()**, **[Swagger]()**

## Parameters
`-Id`: An array of one or more agent IDs to hide

## Example
```powershell
PS> (Hide-CsHost -Id $HostIds).resources
```

# Show-CsHost
Restore hosts. Detection reporting will resume after the host is restored

## API References
**[Documentation]()**, **[Swagger]()**

## Parameters
`-Id`: An array of one or more agent IDs to restore

## Example
```powershell
PS> (Show-CsHost -Id $HostIds).resources
```

# Start-CsContain
Contain hosts. Stops any network communication to locations other than the CrowdStrike cloud and IPs specified
in your containment policy

## API References
**[Documentation]()**, **[Swagger]()**

## Parameters
`-Id`: An array of one or more agent IDs to contain

## Example
```powershell
PS> (Start-CsContain -Id $HostIds).resources
```

# Stop-CsContain
Lift containment on hosts. Returns network communications to normal

## API References
**[Documentation]()**, **[Swagger]()**

## Parameters
`-Id`: An array of one or more agent IDs to release from containment

## Example
```powershell
PS> (Stop-CsContain -Id $HostIds).resources
```