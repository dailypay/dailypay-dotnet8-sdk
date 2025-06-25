# Openapi

Developer-friendly & type-safe Csharp SDK specifically catered to leverage *Openapi* API.

<div align="left">
    <a href="https://www.speakeasy.com/?utm_source=openapi&utm_campaign=csharp"><img src="https://custom-icon-badges.demolab.com/badge/-Built%20By%20Speakeasy-212015?style=for-the-badge&logoColor=FBE331&logo=speakeasy&labelColor=545454" /></a>
    <a href="https://opensource.org/licenses/MIT">
        <img src="https://img.shields.io/badge/License-MIT-blue.svg" style="width: 100px; height: 28px;" />
    </a>
</div>


<br /><br />
> [!IMPORTANT]
> This SDK is not yet ready for production use. To complete setup please follow the steps outlined in your [workspace](https://app.speakeasy.com/org/dailypay/dailypay). Delete this section before > publishing to a package manager.

<!-- Start Summary [summary] -->
## Summary

DailyPay Public Rest API: # Welcome

This site contains information on basic DailyPay concepts and instructions for using the endpoints of each API. We are just now getting started with our public documentation - please let us know if you have any feedback or questions via Suggested Edits, where you can suggest changes to the documentation directly from the portal.

Here are some links to help you get familiar with the DailyPay basics:

[API Versioning](/tag/Getting-Started#section/DailyPay's-API-Versioning) — Find out how we version our APIs.  
[Environments](/tag/Getting-Started#section/Environments) — Get an overview of the different environments in the DailyPay API.  
[Glossary](/tag/Glossary) — Explore a list of terms used in the DailyPay API.
<!-- End Summary [summary] -->

<!-- Start Table of Contents [toc] -->
## Table of Contents
<!-- $toc-max-depth=2 -->
* [Openapi](#openapi)
  * [SDK Installation](#sdk-installation)
  * [SDK Example Usage](#sdk-example-usage)
  * [Authentication](#authentication)
  * [Available Resources and Operations](#available-resources-and-operations)
  * [Error Handling](#error-handling)
  * [Server Selection](#server-selection)
* [Development](#development)
  * [Maturity](#maturity)
  * [Contributions](#contributions)

<!-- End Table of Contents [toc] -->

<!-- Start SDK Installation [installation] -->
## SDK Installation

To add a reference to a local instance of the SDK in a .NET project:
```bash
dotnet add reference src/DailyPay/DailyPay.csproj
```
<!-- End SDK Installation [installation] -->

<!-- Start SDK Example Usage [usage] -->
## SDK Example Usage

### Example

```csharp
using DailyPay;
using DailyPay.Models.Requests;

var sdk = new SDK();

RequestTokenRequest req = RequestTokenRequest.CreateAuthorizationCodeFlow(
    new AuthorizationCodeFlow() {
        GrantType = GrantType.AuthorizationCode,
        Code = "50BTIf2h7Wtg3DAk7ytpG5ML_PsNjfQA4M7iupH_3jw",
        RedirectUri = "https://example.com/callback",
        State = "Hawaii",
        ClientId = "<id>",
    }
);

var res = await sdk.Authentication.RequestTokenAsync(req);

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
using DailyPay;
using DailyPay.Models.Components;
using DailyPay.Models.Requests;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

RequestTokenRequest req = RequestTokenRequest.CreateAuthorizationCodeFlow(
    new AuthorizationCodeFlow() {
        GrantType = GrantType.AuthorizationCode,
        Code = "50BTIf2h7Wtg3DAk7ytpG5ML_PsNjfQA4M7iupH_3jw",
        RedirectUri = "https://example.com/callback",
        State = "Hawaii",
        ClientId = "<id>",
    }
);

var res = await sdk.Authentication.RequestTokenAsync(req);

// handle response
```
<!-- End Authentication [security] -->

<!-- Start Available Resources and Operations [operations] -->
## Available Resources and Operations

<details open>
<summary>Available methods</summary>

### [Accounts](docs/sdks/accounts/README.md)

* [Read](docs/sdks/accounts/README.md#read) - Get an Account object
* [List](docs/sdks/accounts/README.md#list) - Get a list of Account objects
* [Create](docs/sdks/accounts/README.md#create) - Create an Account object

### [Authentication](docs/sdks/authentication/README.md)

* [RequestToken](docs/sdks/authentication/README.md#requesttoken) - Request access token

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

By default, an API error will raise a `DailyPay.Models.Errors.APIException` exception, which has the following properties:

| Property      | Type                  | Description           |
|---------------|-----------------------|-----------------------|
| `Message`     | *string*              | The error message     |
| `Request`     | *HttpRequestMessage*  | The HTTP request      |
| `Response`    | *HttpResponseMessage* | The HTTP response     |

When custom error responses are specified for an operation, the SDK may also throw their associated exceptions. You can refer to respective *Errors* tables in SDK docs for more details on possible exception types for each operation. For example, the `RequestTokenAsync` method throws the following exceptions:

| Error Type                                 | Status Code | Content Type             |
| ------------------------------------------ | ----------- | ------------------------ |
| DailyPay.Models.Errors.BadRequestException | 400         | application/json         |
| DailyPay.Models.Errors.ErrorUnexpected     | 500         | application/vnd.api+json |
| DailyPay.Models.Errors.APIException        | 4XX, 5XX    | \*/\*                    |

### Example

```csharp
using DailyPay;
using DailyPay.Models.Errors;
using DailyPay.Models.Requests;

var sdk = new SDK();

try
{
    RequestTokenRequest req = RequestTokenRequest.CreateAuthorizationCodeFlow(
        new AuthorizationCodeFlow() {
            GrantType = GrantType.AuthorizationCode,
            Code = "50BTIf2h7Wtg3DAk7ytpG5ML_PsNjfQA4M7iupH_3jw",
            RedirectUri = "https://example.com/callback",
            State = "Hawaii",
            ClientId = "<id>",
        }
    );

    var res = await sdk.Authentication.RequestTokenAsync(req);

    // handle response
}
catch (Exception ex)
{
    if (ex is BadRequestException)
    {
        // Handle exception data
        throw;
    }
    else if (ex is ErrorUnexpected)
    {
        // Handle exception data
        throw;
    }
    else if (ex is DailyPay.Models.Errors.APIException)
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

| Variable      | Parameter                                        | Supported Values                     | Default      | Description |
| ------------- | ------------------------------------------------ | ------------------------------------ | ------------ | ----------- |
| `environment` | `environment: DailyPay.Models.ServerEnvironment` | - `"dailypay"`<br/>- `"dailypayuat"` | `"dailypay"` |             |

#### Example

```csharp
using DailyPay;
using DailyPay.Models.Requests;

var sdk = new SDK(environment: "dailypayuat");

RequestTokenRequest req = RequestTokenRequest.CreateAuthorizationCodeFlow(
    new AuthorizationCodeFlow() {
        GrantType = GrantType.AuthorizationCode,
        Code = "50BTIf2h7Wtg3DAk7ytpG5ML_PsNjfQA4M7iupH_3jw",
        RedirectUri = "https://example.com/callback",
        State = "Hawaii",
        ClientId = "<id>",
    }
);

var res = await sdk.Authentication.RequestTokenAsync(req);

// handle response
```

### Override Server URL Per-Client

The default server can be overridden globally by passing a URL to the `serverUrl: string` optional parameter when initializing the SDK client instance. For example:
```csharp
using DailyPay;
using DailyPay.Models.Requests;

var sdk = new SDK(serverUrl: "https://api.dailypay.com");

RequestTokenRequest req = RequestTokenRequest.CreateAuthorizationCodeFlow(
    new AuthorizationCodeFlow() {
        GrantType = GrantType.AuthorizationCode,
        Code = "50BTIf2h7Wtg3DAk7ytpG5ML_PsNjfQA4M7iupH_3jw",
        RedirectUri = "https://example.com/callback",
        State = "Hawaii",
        ClientId = "<id>",
    }
);

var res = await sdk.Authentication.RequestTokenAsync(req);

// handle response
```

### Override Server URL Per-Operation

The server URL can also be overridden on a per-operation basis, provided a server list was specified for the operation. For example:
```csharp
using DailyPay;
using DailyPay.Models.Requests;

var sdk = new SDK();

RequestTokenRequest req = RequestTokenRequest.CreateAuthorizationCodeFlow(
    new AuthorizationCodeFlow() {
        GrantType = GrantType.AuthorizationCode,
        Code = "50BTIf2h7Wtg3DAk7ytpG5ML_PsNjfQA4M7iupH_3jw",
        RedirectUri = "https://example.com/callback",
        State = "Hawaii",
        ClientId = "<id>",
    }
);

var res = await sdk.Authentication.RequestTokenAsync(
    request: req,
    serverUrl: "https://auth.uat.dailypay.com"
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

### SDK Created by [Speakeasy](https://www.speakeasy.com/?utm_source=openapi&utm_campaign=csharp)
