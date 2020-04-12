# Get-FSVulnId
Search for Vulnerabilities in your environment

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/98/spotlight-apis#find-vulnerabilities)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/spotlight-vulnerabilities/queryVulnerabilities)**

### Parameters

`-Filter`: Filter items using a query in Falcon Query Language (FQL) [default: Created in last 24 hours]

`-Limit`: The maximum records to return [default: 500]

`-After`: The pagination token to continue results after an initial request

`-All`: Repeat request until all results are returned

### Example
```powershell
PS> Get-FSVulnId
```

# Get-FSVulnInfo
Get details on vulnerabilities by providing one or more IDs

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/98/spotlight-apis#find-vulnerabilities)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/spotlight-vulnerabilities/getVulnerabilities)**

### Parameters

`-Id`: One or more vulnerability IDs

### Example
```powershell
PS> Get-FSVulnInfo -Id @(<string>, <string>)
```