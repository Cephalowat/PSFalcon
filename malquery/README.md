# Get-CsMalQueryQuota
Get your current MalQuery quota status

### References
**[Documentation](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/malquery/GetMalQueryQuotasV1)**

### Example
```powershell
PS> Get-CsMalQueryQuota
```

# Get-CsMalQueryRequestInfo
Check the status and results of an asynchronous request, such as hunt or exact-search

### Parameters

`-Id`: MalQuery Request ID

### References
**[Documentation](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/malquery/GetMalQueryRequestV1)**

### Example
```powershell
PS> Get-CsMalQueryRequestInfo -Id @(<string>, <string>)
```

# Get-CsMalQuerySampleInfo
Retrieve indexed sample file metadata by hash

### Parameters

`-Id`: SHA256 hash values of sample files

### References
**[Documentation](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/malquery/GetMalQueryMetadataV1)**

### Example
```powershell
PS> Get-CsMalQuerySampleInfo -Id @(<string>, <string>)
```

# New-CsMalQueryArchive
Schedule MalQuery samples for download

### Parameters

`-Samples`: An array of SHA256 values of sample files

### References
**[Documentation](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/malquery/PostMalQueryEntitiesSamplesMultidownloadV1)**

### Example
```powershell
PS> New-CsMalQueryArchive
```

# New-CsMalQueryHunt
Schedule a YARA-based search for execution

### Parameters
A hashtable of MalQuery Hunt parameters

### References
**[Documentation](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/malquery/PostMalQueryHuntV1)**

### Example
```powershell
PS> New-CsMalQueryHunt -Body @{}
```

# New-CsMalQuerySearch
Search MalQuery for a combination of hex patterns and strings

### Parameters

`-Body`: A hashtable of MalQuery search parameters

`-Fuzzy`: Toggle a fuzzy search, which can return more results but has the potential for higher false positives

### References
**[Documentation](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/malquery/PostMalQueryExactSearchV1)**

### Example
```powershell
PS> New-CsMalQuerySearch -Body @{ filter_meta = @(@{ type = <string>; value = <string> })}
```

# Receive-CsMalQueryArchive
Download a password protected archive of samples from MalQuery

### Parameters

`-Id`: Multidownload job id

`-Path`: Destination path

### References
**[Documentation](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/malquery/GetMalQueryEntitiesSamplesFetchV1)**

### Example
```powershell
PS> Receive-CsMalQueryArchive -Id <string> -Path <string>
```

# Receive-CsMalQuerySample
Download a sample indexed by MalQuery

### Parameters

`-Id`: SHA256 hash value of the sample file

`-Path`: Destination path

### References
**[Documentation](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/malquery/GetMalQueryDownloadV1)**

### Example
```powershell
PS> Receive-CsMalQuerySample -Id <string> -Path <string>
```