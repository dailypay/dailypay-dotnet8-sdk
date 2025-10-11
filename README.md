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
        OauthClientCredentialsToken = new SchemeOauthClientCredentialsToken() {
            ClientID = "<YOUR_CLIENT_ID_HERE>",
            ClientSecret = "<YOUR_CLIENT_SECRET_HERE>",
            TokenURL = "<YOUR_TOKEN_URL_HERE>",
        },
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
        OauthClientCredentialsToken = new SchemeOauthClientCredentialsToken() {
            ClientID = "<YOUR_CLIENT_ID_HERE>",
            ClientSecret = "<YOUR_CLIENT_SECRET_HERE>",
            TokenURL = "<YOUR_TOKEN_URL_HERE>",
        },
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
| `OauthClientCredentialsToken` | oauth2 | OAuth2 token |
| `OauthUserToken`              | oauth2 | OAuth2 token |

You can set the security parameters through the `security` optional parameter when initializing the SDK client instance. The selected scheme will be used by default to authenticate with the API for all operations that support it. For example:
```csharp
using DailyPay.SDK.DotNet8;
using DailyPay.SDK.DotNet8.Models.Components;
using DailyPay.SDK.DotNet8.Models.Requests;

var sdk = new SDK(
    security: new Security() {
        OauthClientCredentialsToken = new SchemeOauthClientCredentialsToken() {
            ClientID = "<YOUR_CLIENT_ID_HERE>",
            ClientSecret = "<YOUR_CLIENT_SECRET_HERE>",
            TokenURL = "<YOUR_TOKEN_URL_HERE>",
        },
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
using DailyPay.SDK.DotNet8.Models.Requests;

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

[`DailyPayError`](./src/DailyPay/SDK/DotNet8/Models/Errors/DailyPayError.cs) is the base exception class for all HTTP error responses. It has the following properties:

| Property      | Type                  | Description           |
|---------------|-----------------------|-----------------------|
| `Message`     | *string*              | Error message         |
| `Request`     | *HttpRequestMessage*  | HTTP request object   |
| `Response`    | *HttpResponseMessage* | HTTP response object  |

Some exceptions in this SDK include an additional `Payload` field, which will contain deserialized custom error data when present. Possible exceptions are listed in the [Error Classes](#error-classes) section.

### Example

```csharp
using DailyPay.SDK.DotNet8;
using DailyPay.SDK.DotNet8.Models.Components;
using DailyPay.SDK.DotNet8.Models.Errors;
using DailyPay.SDK.DotNet8.Models.Requests;
using System.Collections.Generic;

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthClientCredentialsToken = new SchemeOauthClientCredentialsToken() {
            ClientID = "<YOUR_CLIENT_ID_HERE>",
            ClientSecret = "<YOUR_CLIENT_SECRET_HERE>",
            TokenURL = "<YOUR_TOKEN_URL_HERE>",
        },
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
catch (DailyPayError ex)  // all SDK exceptions inherit from DailyPayError
{
    // ex.ToString() provides a detailed error message
    System.Console.WriteLine(ex);

    // Base exception fields
    HttpRequestMessage request = ex.Request;
    HttpResponseMessage response = ex.Response;
    var statusCode = (int)response.StatusCode;
    var responseBody = ex.Body;

    if (ex is ErrorBadRequest) // different exceptions may be thrown depending on the method
    {
        // Check error data fields
        ErrorBadRequestPayload payload = ex.Payload;
        List<ErrorBadRequestError> Errors = payload.Errors;
    }

    // An underlying cause may be provided
    if (ex.InnerException != null)
    {
        Exception cause = ex.InnerException;
    }
}
catch (System.Net.Http.HttpRequestException ex)
{
    // Check ex.InnerException for Network connectivity errors
}
```

### Error Classes

**Primary exceptions:**
* [`DailyPayError`](./src/DailyPay/SDK/DotNet8/Models/Errors/DailyPayError.cs): The base class for HTTP error responses.
  * [`ErrorUnauthorized`](./src/DailyPay/SDK/DotNet8/Models/Errors/ErrorUnauthorized.cs): Invalid authentication credentials. Status code `401`. *
  * [`ErrorUnexpected`](./src/DailyPay/SDK/DotNet8/Models/Errors/ErrorUnexpected.cs): Unexpected error occured. Status code `500`. *
  * [`ErrorForbidden`](./src/DailyPay/SDK/DotNet8/Models/Errors/ErrorForbidden.cs): Not authorized to perform this operation. Status code `403`. *

<details><summary>Less common exceptions (7)</summary>

* [`System.Net.Http.HttpRequestException`](https://learn.microsoft.com/en-us/dotnet/api/system.net.http.httprequestexception): Network connectivity error. For more details about the underlying cause, inspect the `ex.InnerException`.

* Inheriting from [`DailyPayError`](./src/DailyPay/SDK/DotNet8/Models/Errors/DailyPayError.cs):
  * [`ErrorBadRequest`](./src/DailyPay/SDK/DotNet8/Models/Errors/ErrorBadRequest.cs): Bad Request. Status code `400`. Applicable to 12 of 17 methods.*
  * [`ErrorNotFound`](./src/DailyPay/SDK/DotNet8/Models/Errors/ErrorNotFound.cs): Resource was not found. Status code `404`. Applicable to 8 of 17 methods.*
  * [`JobUpdateError`](./src/DailyPay/SDK/DotNet8/Models/Errors/JobUpdateError.cs): Bad Request. Status code `400`. Applicable to 1 of 17 methods.*
  * [`AccountCreateError`](./src/DailyPay/SDK/DotNet8/Models/Errors/AccountCreateError.cs): The request contained an error. Status code `400`. Applicable to 1 of 17 methods.*
  * [`TransferCreateError`](./src/DailyPay/SDK/DotNet8/Models/Errors/TransferCreateError.cs): The request contained an error. Status code `400`. Applicable to 1 of 17 methods.*
  * [`ResponseValidationError`](./src/DailyPay/SDK/DotNet8/Models/Errors/ResponseValidationError.cs): Thrown when the response data could not be deserialized into the expected type.
</details>

\* Refer to the [relevant documentation](#available-resources-and-operations) to determine whether an exception applies to a specific operation.
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
        OauthClientCredentialsToken = new SchemeOauthClientCredentialsToken() {
            ClientID = "<YOUR_CLIENT_ID_HERE>",
            ClientSecret = "<YOUR_CLIENT_SECRET_HERE>",
            TokenURL = "<YOUR_TOKEN_URL_HERE>",
        },
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
        OauthClientCredentialsToken = new SchemeOauthClientCredentialsToken() {
            ClientID = "<YOUR_CLIENT_ID_HERE>",
            ClientSecret = "<YOUR_CLIENT_SECRET_HERE>",
            TokenURL = "<YOUR_TOKEN_URL_HERE>",
        },
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
