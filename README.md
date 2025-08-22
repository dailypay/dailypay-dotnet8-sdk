# DailyPay.SDK.DotNet8

Developer-friendly & type-safe Csharp SDK specifically catered to leverage *DailyPay.SDK.DotNet8* API.

<div align="left">
    <a href="https://www.speakeasy.com/?utm_source=daily-pay-sdk-dot-net8&utm_campaign=csharp"><img src="https://custom-icon-badges.demolab.com/badge/-Built%20By%20Speakeasy-212015?style=for-the-badge&logoColor=FBE331&logo=speakeasy&labelColor=545454" /></a>
    <a href="https://opensource.org/licenses/MIT">
        <img src="https://img.shields.io/badge/License-MIT-blue.svg" style="width: 100px; height: 28px;" />
    </a>
</div>

<!-- No Summary [summary] -->

<!-- Start Table of Contents [toc] -->
## Table of Contents
<!-- $toc-max-depth=2 -->
* [DailyPay.SDK.DotNet8](#dailypaysdkdotnet8)
  * [SDK Example Usage](#sdk-example-usage)
  * [Authentication](#authentication)
  * [Available Resources and Operations](#available-resources-and-operations)
  * [Error Handling](#error-handling)
  * [Server Selection](#server-selection)
* [Development](#development)
  * [Maturity](#maturity)
  * [Contributions](#contributions)

<!-- End Table of Contents [toc] -->

<!-- No SDK Installation [installation] -->

<!-- Start SDK Example Usage [usage] -->
## SDK Example Usage

### Look up accounts

Fetch a list of accounts, including earnings balance accounts.

```csharp
using DailyPay.SDK.DotNet8;
using DailyPay.SDK.DotNet8.Models.Components;
using DailyPay.SDK.DotNet8.Models.Requests;

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

ListAccountsRequest req = new ListAccountsRequest() {
    FilterAccountType = FilterAccountType.EarningsBalance,
};

var res = await sdk.Accounts.ListAsync(req);

// handle response
```

### Request a transfer

Initiate a transfer of funds from an earnings balance account to a personal depository or card account.

```csharp
using DailyPay.SDK.DotNet8;
using DailyPay.SDK.DotNet8.Models.Components;
using DailyPay.SDK.DotNet8.Models.Requests;

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

CreateTransferRequest req = new CreateTransferRequest() {
    IdempotencyKey = "ea9f2225-403b-4e2c-93b0-0eda090ffa65",
    TransferCreateData = new TransferCreateData() {
        Data = new TransferCreateResource() {
            Id = "aba332a2-24a2-46de-8257-5040e71ab210",
            Attributes = new TransferAttributesInput() {
                Preview = true,
                Amount = 2500,
                Currency = "USD",
                Schedule = TransferAttributesSchedule.WithinThirtyMinutes,
            },
            Relationships = new TransferCreateRelationships() {
                Origin = new AccountRelationship() {
                    Data = new AccountIdentifier() {
                        Id = "2bc7d781-3247-46f6-b60f-4090d214936a",
                    },
                },
                Destination = new AccountRelationship() {
                    Data = new AccountIdentifier() {
                        Id = "2bc7d781-3247-46f6-b60f-4090d214936a",
                    },
                },
                Person = new PersonRelationship() {
                    Data = new PersonIdentifier() {
                        Id = "3fa8f641-5717-4562-b3fc-2c963f66afa6",
                    },
                },
            },
        },
    },
};

var res = await sdk.Transfers.CreateAsync(req);

// handle response
```
<!-- End SDK Example Usage [usage] -->

<!-- Start Authentication [security] -->
## Authentication

### Per-Client Security Schemes

This SDK supports the following security schemes globally:

| Name                          | Type   | Scheme       |
| ----------------------------- | ------ | ------------ |
| `OauthUserToken`              | oauth2 | OAuth2 token |
| `OauthClientCredentialsToken` | oauth2 | OAuth2 token |

You can set the security parameters through the `security` optional parameter when initializing the SDK client instance. The selected scheme will be used by default to authenticate with the API for all operations that support it. For example:
```csharp
using DailyPay.SDK.DotNet8;
using DailyPay.SDK.DotNet8.Models.Components;
using DailyPay.SDK.DotNet8.Models.Requests;

var sdk = new SDK(
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    },
    version: 3
);

ReadJobRequest req = new ReadJobRequest() {
    JobId = "aa860051-c411-4709-9685-c1b716df611b",
};

var res = await sdk.Jobs.ReadAsync(req);

// handle response
```
<!-- End Authentication [security] -->

<!-- Suggested: Use a Callback for Access Tokens -->
### Suggested: Use a Callback for Access Tokens

You can use a callback to automatically refresh and retrieve user access tokens from secure storage. Pass a callback as a security source when initializing the SDK:

```csharp
using DailyPay.SDK.DotNet8;
using DailyPay.SDK.DotNet8.Models.Components;

// Example callback function to retrieve the latest access token
Func<Security> tokenSource = () =>
{
    // Retrieve or refresh token here
    var token = "<YOUR_OAUTH_USER_TOKEN_HERE>";
    return new Security { OauthUserToken = token };
};

var sdk = new SDK(securitySource: tokenSource, version: 3);

ReadJobRequest req = new ReadJobRequest()
{
    JobId = "aa860051-c411-4709-9685-c1b716df611b",
};

var res = await sdk.Jobs.ReadAsync(req);

// handle response
```

<!-- Start Available Resources and Operations [operations] -->
## Available Resources and Operations

<details open>
<summary>Available methods</summary>

### [Accounts](docs/sdks/accounts/README.md)

* [Read](docs/sdks/accounts/README.md#read) - Get an Account object
* [List](docs/sdks/accounts/README.md#list) - Get a list of Account objects
* [Create](docs/sdks/accounts/README.md#create) - Create an Account object

### [Cards](docs/sdks/cards/README.md)

* [Create](docs/sdks/cards/README.md#create) - Obtain a card token

### [Health](docs/sdks/health/README.md)

* [GetHealth](docs/sdks/health/README.md#gethealth) - Verify the status of the API

### [Jobs](docs/sdks/jobs/README.md)

* [Read](docs/sdks/jobs/README.md#read) - Get a job object
* [Update](docs/sdks/jobs/README.md#update) - Update paycheck settings or deactivate a job
* [List](docs/sdks/jobs/README.md#list) - Get a list of job objects

### [Organizations](docs/sdks/organizations/README.md)

* [Read](docs/sdks/organizations/README.md#read) - Get an organization
* [List](docs/sdks/organizations/README.md#list) - List organizations

### [Paychecks](docs/sdks/paychecks/README.md)

* [Read](docs/sdks/paychecks/README.md#read) - Get a Paycheck object
* [List](docs/sdks/paychecks/README.md#list) - Get a list of paycheck objects

### [People](docs/sdks/people/README.md)

* [Read](docs/sdks/people/README.md#read) - Get a person object
* [Update](docs/sdks/people/README.md#update) - Update a person


### [Transfers](docs/sdks/transfers/README.md)

* [Read](docs/sdks/transfers/README.md#read) - Get a transfer object
* [List](docs/sdks/transfers/README.md#list) - Get a list of transfers
* [Create](docs/sdks/transfers/README.md#create) - Request a transfer

</details>
<!-- End Available Resources and Operations [operations] -->

<!-- Start Error Handling [errors] -->
## Error Handling

Handling errors in this SDK should largely match your expectations. All operations return a response object or throw an exception.

By default, an API error will raise a `DailyPay.SDK.DotNet8.Models.Errors.APIException` exception, which has the following properties:

| Property      | Type                  | Description           |
|---------------|-----------------------|-----------------------|
| `Message`     | *string*              | The error message     |
| `Request`     | *HttpRequestMessage*  | The HTTP request      |
| `Response`    | *HttpResponseMessage* | The HTTP response     |

When custom error responses are specified for an operation, the SDK may also throw their associated exceptions. You can refer to respective *Errors* tables in SDK docs for more details on possible exception types for each operation. For example, the `ReadAsync` method throws the following exceptions:

| Error Type                                           | Status Code | Content Type             |
| ---------------------------------------------------- | ----------- | ------------------------ |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorBadRequest   | 400         | application/vnd.api+json |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnauthorized | 401         | application/vnd.api+json |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorForbidden    | 403         | application/vnd.api+json |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorNotFound     | 404         | application/vnd.api+json |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnexpected   | 500         | application/vnd.api+json |
| DailyPay.SDK.DotNet8.Models.Errors.APIException      | 4XX, 5XX    | \*/\*                    |

### Example

```csharp
using DailyPay.SDK.DotNet8;
using DailyPay.SDK.DotNet8.Models.Components;
using DailyPay.SDK.DotNet8.Models.Errors;
using DailyPay.SDK.DotNet8.Models.Requests;

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

try
{
    ReadJobRequest req = new ReadJobRequest() {
        JobId = "aa860051-c411-4709-9685-c1b716df611b",
    };

    var res = await sdk.Jobs.ReadAsync(req);

    // handle response
}
catch (Exception ex)
{
    if (ex is ErrorBadRequest)
    {
        // Handle exception data
        throw;
    }
    else if (ex is ErrorUnauthorized)
    {
        // Handle exception data
        throw;
    }
    else if (ex is ErrorForbidden)
    {
        // Handle exception data
        throw;
    }
    else if (ex is ErrorNotFound)
    {
        // Handle exception data
        throw;
    }
    else if (ex is ErrorUnexpected)
    {
        // Handle exception data
        throw;
    }
    else if (ex is DailyPay.SDK.DotNet8.Models.Errors.APIException)
    {
        // Handle default exception
        throw;
    }
}
```
<!-- End Error Handling [errors] -->

<!-- Start Server Selection [server] -->
## Server Selection

### Server Variables

The default server `https://api.{environment}.com` contains variables and is set to `https://api.dailypay.com` by default. To override default values, the following parameters are available when initializing the SDK client instance:

| Variable      | Parameter                                                    | Supported Values                     | Default      | Description |
| ------------- | ------------------------------------------------------------ | ------------------------------------ | ------------ | ----------- |
| `environment` | `environment: DailyPay.SDK.DotNet8.Models.ServerEnvironment` | - `"dailypay"`<br/>- `"dailypayuat"` | `"dailypay"` |             |

#### Example

```csharp
using DailyPay.SDK.DotNet8;
using DailyPay.SDK.DotNet8.Models.Components;
using DailyPay.SDK.DotNet8.Models.Requests;

var sdk = new SDK(
    environment: "dailypayuat",
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

ReadJobRequest req = new ReadJobRequest() {
    JobId = "aa860051-c411-4709-9685-c1b716df611b",
};

var res = await sdk.Jobs.ReadAsync(req);

// handle response
```

### Override Server URL Per-Client

The default server can be overridden globally by passing a URL to the `serverUrl: string` optional parameter when initializing the SDK client instance. For example:
```csharp
using DailyPay.SDK.DotNet8;
using DailyPay.SDK.DotNet8.Models.Components;
using DailyPay.SDK.DotNet8.Models.Requests;

var sdk = new SDK(
    serverUrl: "https://api.dailypay.com",
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

ReadJobRequest req = new ReadJobRequest() {
    JobId = "aa860051-c411-4709-9685-c1b716df611b",
};

var res = await sdk.Jobs.ReadAsync(req);

// handle response
```

### Override Server URL Per-Operation

The server URL can also be overridden on a per-operation basis, provided a server list was specified for the operation. For example:
```csharp
using DailyPay.SDK.DotNet8;
using DailyPay.SDK.DotNet8.Models.Requests;

var sdk = new SDK();

CreateGenericCardTokenRequest req = new CreateGenericCardTokenRequest() {
    FirstName = "Edith",
    LastName = "Clarke",
    CardNumber = "4007589999999912",
    ExpirationYear = "2027",
    ExpirationMonth = "02",
    Cvv = "123",
    AddressLineOne = "123 Kebly Street",
    AddressLineTwo = "Unit C",
    AddressCity = "Fort Lee",
    AddressState = "NJ",
    AddressZipCode = "07237",
    AddressCountry = "US",
};

var res = await sdk.Cards.CreateAsync(
    request: req,
    serverUrl: "https://payments.dailypay.com/v2"
);

// handle response
```
<!-- End Server Selection [server] -->

<!-- Placeholder for Future Speakeasy SDK Sections -->

# Development

## Maturity

This SDK is in beta, and there may be breaking changes between versions without a major version update. Therefore, we recommend pinning usage
to a specific package version. This way, you can install the same version each time without breaking changes unless you are intentionally
looking for the latest version.

## Contributions

While we value open-source contributions to this SDK, this library is generated programmatically. Any manual changes added to internal files will be overwritten on the next generation. 
We look forward to hearing your feedback. Feel free to open a PR or an issue with a proof of concept and we'll do our best to include it in a future release. 

### SDK Created by [Speakeasy](https://www.speakeasy.com/?utm_source=daily-pay-sdk-dot-net8&utm_campaign=csharp)
