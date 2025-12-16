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
  * [Retries](#retries)
  * [Error Handling](#error-handling)
  * [Server Selection](#server-selection)
  * [Custom HTTP Client](#custom-http-client)
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
    FilterPersonId = "aa860051-c411-4709-9685-c1b716df611b",
    FilterAccountType = FilterAccountType.EarningsBalance,
    FilterSubtype = "ODP",
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
    Include = "estimated_funding_sources,final_funding_sources",
    IdempotencyKey = "e2736aa1-78c4-4cc6-b0a6-848e733f232a",
    TransferCreateData = new TransferCreateData() {
        Data = new TransferCreateResource() {
            Attributes = new TransferCreateAttributes() {
                Preview = true,
                Amount = 15000,
                Currency = "USD",
                Schedule = TransferCreateAttributesSchedule.WithinThirtyMinutes,
            },
            Relationships = new TransferCreateRelationships() {
                Origin = new AccountRelationship() {
                    Data = new AccountIdentifier() {
                        Id = "123e4567-e89b-12d3-a456-426614174000",
                    },
                },
                Destination = new AccountRelationship() {
                    Data = new AccountIdentifier() {
                        Id = "223e4567-e89b-12d3-a456-426614174001",
                    },
                },
                Person = new PersonRelationship() {
                    Data = new PersonIdentifier() {
                        Id = "aa860051-c411-4709-9685-c1b716df611b",
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

### [CardTokenization](docs/sdks/cardtokenization/README.md)

* [Create](docs/sdks/cardtokenization/README.md#create) - Obtain a card token

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

<!-- Start Retries [retries] -->
## Retries

Some of the endpoints in this SDK support retries. If you use the SDK without any configuration, it will fall back to the default retry strategy provided by the API. However, the default retry strategy can be overridden on a per-operation basis, or across the entire SDK.

To change the default retry strategy for a single API call, simply pass a `RetryConfig` to the call:
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

ReadJobRequest req = new ReadJobRequest() {
    JobId = "aa860051-c411-4709-9685-c1b716df611b",
};

var res = await sdk.Jobs.ReadAsync(
    retryConfig: new RetryConfig(
        strategy: RetryConfig.RetryStrategy.BACKOFF,
        backoff: new BackoffStrategy(
            initialIntervalMs: 1L,
            maxIntervalMs: 50L,
            maxElapsedTimeMs: 100L,
            exponent: 1.1
        ),
        retryConnectionErrors: false
    ),
    request: req
);

// handle response
```

If you'd like to override the default retry strategy for all operations that support retries, you can use the `RetryConfig` optional parameter when intitializing the SDK:
```csharp
using DailyPay.SDK.DotNet8;
using DailyPay.SDK.DotNet8.Models.Components;
using DailyPay.SDK.DotNet8.Models.Requests;

var sdk = new SDK(
    retryConfig: new RetryConfig(
        strategy: RetryConfig.RetryStrategy.BACKOFF,
        backoff: new BackoffStrategy(
            initialIntervalMs: 1L,
            maxIntervalMs: 50L,
            maxElapsedTimeMs: 100L,
            exponent: 1.1
        ),
        retryConnectionErrors: false
    ),
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
<!-- End Retries [retries] -->

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

<details><summary>Less common exceptions (8)</summary>

* [`System.Net.Http.HttpRequestException`](https://learn.microsoft.com/en-us/dotnet/api/system.net.http.httprequestexception): Network connectivity error. For more details about the underlying cause, inspect the `ex.InnerException`.

* Inheriting from [`DailyPayError`](./src/DailyPay/SDK/DotNet8/Models/Errors/DailyPayError.cs):
  * [`ErrorBadRequest`](./src/DailyPay/SDK/DotNet8/Models/Errors/ErrorBadRequest.cs): Bad Request. Status code `400`. Applicable to 12 of 17 methods.*
  * [`ErrorNotFound`](./src/DailyPay/SDK/DotNet8/Models/Errors/ErrorNotFound.cs): Resource was not found. Status code `404`. Applicable to 8 of 17 methods.*
  * [`JobUpdateError`](./src/DailyPay/SDK/DotNet8/Models/Errors/JobUpdateError.cs): Bad Request. Status code `400`. Applicable to 1 of 17 methods.*
  * [`AccountCreateError`](./src/DailyPay/SDK/DotNet8/Models/Errors/AccountCreateError.cs): The request contained an error. Status code `400`. Applicable to 1 of 17 methods.*
  * [`TransferCreateError`](./src/DailyPay/SDK/DotNet8/Models/Errors/TransferCreateError.cs): The request contained an error. Status code `400`. Applicable to 1 of 17 methods.*
  * [`ErrorConflict`](./src/DailyPay/SDK/DotNet8/Models/Errors/ErrorConflict.cs): A conflict occurred with the current state of the resource. Status code `409`. Applicable to 1 of 17 methods.*
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
    serverIndex: 0,
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

var res = await sdk.CardTokenization.CreateAsync(
    request: req,
    serverUrl: "https://payments.dailypay.com/v2"
);

// handle response
```
<!-- End Server Selection [server] -->

<!-- Start Custom HTTP Client [http-client] -->
## Custom HTTP Client

The C# SDK makes API calls using an `ISpeakeasyHttpClient` that wraps the native
[HttpClient](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient). This
client provides the ability to attach hooks around the request lifecycle that can be used to modify the request or handle
errors and response.

The `ISpeakeasyHttpClient` interface allows you to either use the default `SpeakeasyHttpClient` that comes with the SDK,
or provide your own custom implementation with customized configuration such as custom message handlers, timeouts,
connection pooling, and other HTTP client settings.

The following example shows how to create a custom HTTP client with request modification and error handling:

```csharp
using DailyPay.SDK.DotNet8;
using DailyPay.SDK.DotNet8.Utils;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

// Create a custom HTTP client
public class CustomHttpClient : ISpeakeasyHttpClient
{
    private readonly ISpeakeasyHttpClient _defaultClient;

    public CustomHttpClient()
    {
        _defaultClient = new SpeakeasyHttpClient();
    }

    public async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken? cancellationToken = null)
    {
        // Add custom header and timeout
        request.Headers.Add("x-custom-header", "custom value");
        request.Headers.Add("x-request-timeout", "30");
        
        try
        {
            var response = await _defaultClient.SendAsync(request, cancellationToken);
            // Log successful response
            Console.WriteLine($"Request successful: {response.StatusCode}");
            return response;
        }
        catch (Exception error)
        {
            // Log error
            Console.WriteLine($"Request failed: {error.Message}");
            throw;
        }
    }

    public void Dispose()
    {
        _httpClient?.Dispose();
        _defaultClient?.Dispose();
    }
}

// Use the custom HTTP client with the SDK
var customHttpClient = new CustomHttpClient();
var sdk = new SDK(client: customHttpClient);
```

<details>
<summary>You can also provide a completely custom HTTP client with your own configuration:</summary>

```csharp
using DailyPay.SDK.DotNet8.Utils;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

// Custom HTTP client with custom configuration
public class AdvancedHttpClient : ISpeakeasyHttpClient
{
    private readonly HttpClient _httpClient;

    public AdvancedHttpClient()
    {
        var handler = new HttpClientHandler()
        {
            MaxConnectionsPerServer = 10,
            // ServerCertificateCustomValidationCallback = customCertValidation, // Custom SSL validation if needed
        };

        _httpClient = new HttpClient(handler)
        {
            Timeout = TimeSpan.FromSeconds(30)
        };
    }

    public async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken? cancellationToken = null)
    {
        return await _httpClient.SendAsync(request, cancellationToken ?? CancellationToken.None);
    }

    public void Dispose()
    {
        _httpClient?.Dispose();
    }
}

var sdk = SDK.Builder()
    .WithClient(new AdvancedHttpClient())
    .Build();
```
</details>

<details>
<summary>For simple debugging, you can enable request/response logging by implementing a custom client:</summary>

```csharp
public class LoggingHttpClient : ISpeakeasyHttpClient
{
    private readonly ISpeakeasyHttpClient _innerClient;

    public LoggingHttpClient(ISpeakeasyHttpClient innerClient = null)
    {
        _innerClient = innerClient ?? new SpeakeasyHttpClient();
    }

    public async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken? cancellationToken = null)
    {
        // Log request
        Console.WriteLine($"Sending {request.Method} request to {request.RequestUri}");
        
        var response = await _innerClient.SendAsync(request, cancellationToken);
        
        // Log response
        Console.WriteLine($"Received {response.StatusCode} response");
        
        return response;
    }

    public void Dispose() => _innerClient?.Dispose();
}

var sdk = new SDK(client: new LoggingHttpClient());
```
</details>

The SDK also provides built-in hook support through the `SDKConfiguration.Hooks` system, which automatically handles
`BeforeRequestAsync`, `AfterSuccessAsync`, and `AfterErrorAsync` hooks for advanced request lifecycle management.
<!-- End Custom HTTP Client [http-client] -->

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
