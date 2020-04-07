**WARNING**: The PSFalcon modules are not a product of CrowdStrike and are not officially supported by
CrowdStrike. Neither CrowdStrike, nor the creator and/or associated contributors of PSFalcon shall be
responsible for any damages inflicted as a result of their use.

# Installation

1. Install **[PowerShell](https://github.com/PowerShell/PowerShell#Get-PowerShell)** 6.1 or newer
2. Place the PSFalcon modules in `$PSHOME\Modules\PSFalcon`

**NOTE**: You can find your `$PSHOME` path in a PowerShell session.

```powershell
PS> $PSHOME
C:\Program Files\PowerShell\<version>
```

# Usage

Interacting with the CrowdStrike Falcon OAuth2 APIs requires an **[API Client ID and Secret](https://falcon.crowdstrike.com/support/api-clients-and-keys)** and a valid
OAuth2 token.

If you attempt to run a PSFalcon command without a valid token, you will be forced to make a token
request. You can make a manual request using the `Get-CsToken` command:

```powershell
PS> Get-CsToken
Client Id: <string>
Client Secret: <string>
PS> $Falcon

Name                           Value
----                           -----
expires                        1/1/2020 8:00:00 AM
token                          <string>
id                             <string>
secret                         System.Security.SecureString
host                           <string>
```

**WARNING**: Using the optional `-Id` and `-Secret` parameters with `Get-CsToken` will result in your API
credentials being displayed in plain text. This could expose them to a third party.

If you need to choose a different cloud or use a proxy when making requests, you will need to issue a manual
`Get-CsToken` command at the beginning of your PowerShell session.

### Choosing a Cloud

By default, token requests are sent to the US cloud. The `-Cloud` parameter can be used to choose a different
destination. Your choice is saved in `$Falcon` and all requests will be sent to the chosen cloud unless a new
`Get-CsToken` request is made.

### Using a Proxy

The `-Proxy` parameter can be added to a token request to define a proxy. Your choice is saved in `$Falcon`
and all requests will be directed to your proxy until a new `Get-CsToken` request is made.

Once a valid OAuth2 token is received, it is cached under `$Falcon` with your credentials. Your cached
token will be checked and refreshed when needed while running PSFalcon commands.

# Commands

**[CrowdStrike Falcon Discover for AWS API](/cloud-connect-aws)**

**[CrowdStrike Falcon Detections API](/detects)**

**[CrowdStrike Falcon Device Control Policy API](/device-control-policies)**

**[CrowdStrike Falcon X Sandbox API](/falconx-sandbox)**

**[CrowdStrike Falcon Firewall Management API](/firewall-management)**

**[CrowdStrike Falcon Host Group API](/host-group)**

**[CrowdStrike Falcon Host API](/hosts)**

**[CrowdStrike CrowdScore Incident API](/incidents)**

**[CrowdStrike Threat Intelligence API](/intel)**

**[CrowdStrike OAuth2 Token API](/oauth2)**

**[CrowdStrike Falcon Prevention Policy API](/prevention-policies)**

**[CrowdStrike Falcon Real-time Response API](/real-time-response)**

**[CrowdStrike Falcon Sensor Download API](/sensor-download)**

**[CrowdStrike Falcon Sensor Update Policy API](/sensor-update-policies)**

**[CrowdStrike Falcon Spotlight API](/spotlight-vulnerabilities)**

**[CrowdStrike Falcon User Management API](/user-management)**

# Responses

PowerShell objects are generated in response to PSFalcon commands:

```powershell
PS> Get-CsHostId

meta                                                                        resources
----                                                                        ---------
@{query_time=<int>; pagination=; powered_by=<string>; trace_id=<string>}    @{...}
```

The members of the response object can be referenced to retrieve specific data. `$PSObject.meta`
contains information about the request itself:

```powershell
PS> $HostIds = Get-CsHostId
PS> $HostIds.meta

query_time  pagination                                  powered_by trace_id
----------  ----------                                  ---------- --------
<int>       @{offset=<int>; limit=<int>; total=<int>}   <string>   <string>
```

Results of a successful request are typically contained within `$PSObject.resources`. For some request
types, resources may fall under `$PSObject.combined`, or another specific field like `$PSObject.batch_id`.

You can return the results themselves by calling `$PSObject.resources` or a related sub-object:

```powershell
PS> $HostIds.resources
<array>
```

`$PSObject.errors` is populated when a request was received by the server and an error was returned:

```powershell
PS> $HostIds.errors

code    message
----    -------
<int>   <string>
```
