# Get-CsToken
Request an OAuth2 access token

### References
**[Documentation](https://falcon.crowdstrike.com/support/documentation/93/oauth2-auth-token-apis#get-an-auth-token)**, **[Swagger](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/oauth2/oauth2AccessToken)**

### Parameters
`-Id`: Client Id

`-Secret`: Client Secret

`-CID`: Specific CID to target in MSSP configurations

`-Cloud`: CrowdStrike destination cloud [default: 'US']

`-Proxy`: Web proxy address

**WARNING**: Using the optional `-Id` and `-Secret` parameters with `Get-CsToken` will result in your API
credentials being displayed in plain text. This could expose them to a third party.

### Example
```powershell
PS> Get-CsToken
```