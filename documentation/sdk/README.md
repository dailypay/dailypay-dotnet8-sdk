

<!-- FILE: accounts/README.md -->

# Accounts
(*Accounts*)

## Overview

The _accounts_ endpoint provides comprehensive information about money
accounts. You can retrieve account details, including the
account's unique ID, a link to the account holder, type, subtype,
verification status, balance details, transfer capabilities, and
user-specific information such as names, routing numbers, and partial
account numbers.


**Functionality:** Access detailed user account information, verify
account balances, view transfer capabilities, and access user-specific
details associated with each account.


### Available Operations

* [Read](#read) - Get an Account object
* [List](#list) - Get a list of Account objects
* [Create](#create) - Create an Account object

## Read

Returns details about an account. This object represents a person's bank accounts, debit and pay cards, and earnings balance accounts.

### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.Accounts.ReadAsync(
    accountId: "2bc7d781-3247-46f6-b60f-4090d214936a",
    version: 3
);

// handle response
```

### Parameters

| Parameter                                                                                                              | Type                                                                                                                   | Required                                                                                                               | Description                                                                                                            | Example                                                                                                                |
| ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `AccountId`                                                                                                            | *string*                                                                                                               | :heavy_check_mark:                                                                                                     | Unique UUID of the Account.                                                                                            | 2bc7d781-3247-46f6-b60f-4090d214936a                                                                                   |
| `Version`                                                                                                              | *long*                                                                                                                 | :heavy_minus_sign:                                                                                                     | The version of the DailyPay API to use for this request. If not provided, the latest version of the API will be used.<br/> |                                                                                                                        |

### Response

**[ReadAccountResponse](../../Models/Requests/ReadAccountResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.ErrorBadRequest   | 400                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorForbidden    | 403                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorNotFound     | 404                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |

## List

Returns a list of account objects. An account object represents a person's bank accounts, debit and pay cards, and earnings balance accounts.
See [Filtering Accounts](https://developer.dailypay.com/tag/Filtering#section/Supported-Endpoint-Filters) for a description of filterable fields.


### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;
using Openapi.Models.Requests;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

ListAccountsRequest req = new ListAccountsRequest() {
    FilterAccountType = FilterAccountType.EarningsBalance,
};

var res = await sdk.Accounts.ListAsync(req);

// handle response
```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `request`                                                           | [ListAccountsRequest](../../Models/Requests/ListAccountsRequest.md) | :heavy_check_mark:                                                  | The request object to use for the request.                          |

### Response

**[ListAccountsResponse](../../Models/Requests/ListAccountsResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.ErrorBadRequest   | 400                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorForbidden    | 403                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |

## Create

Create an account object to store a person's bank or card information as a destination for funds.

### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.Accounts.CreateAsync(
    accountData: new AccountDataInput() {
        Data = new AccountResourceInput() {
            Attributes = AccountAttributesInput.CreateEarningsBalanceReadOnlyInput(
                new EarningsBalanceReadOnlyInput() {}
            ),
            Relationships = new AccountRelationships() {
                Person = new PersonRelationship() {
                    Data = new PersonIdentifier() {
                        Id = "3fa8f641-5717-4562-b3fc-2c963f66afa6",
                    },
                },
            },
        },
    },
    version: 3
);

// handle response
```

### Parameters

| Parameter                                                                                                              | Type                                                                                                                   | Required                                                                                                               | Description                                                                                                            |
| ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `AccountData`                                                                                                          | [AccountDataInput](../../Models/Components/AccountDataInput.md)                                                        | :heavy_check_mark:                                                                                                     | N/A                                                                                                                    |
| `Version`                                                                                                              | *long*                                                                                                                 | :heavy_minus_sign:                                                                                                     | The version of the DailyPay API to use for this request. If not provided, the latest version of the API will be used.<br/> |

### Response

**[CreateAccountResponse](../../Models/Requests/CreateAccountResponse.md)**

### Errors

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| Openapi.Models.Errors.AccountCreateError | 400                                      | application/vnd.api+json                 |
| Openapi.Models.Errors.ErrorUnauthorized  | 401                                      | application/vnd.api+json                 |
| Openapi.Models.Errors.ErrorForbidden     | 403                                      | application/vnd.api+json                 |
| Openapi.Models.Errors.ErrorUnexpected    | 500                                      | application/vnd.api+json                 |
| Openapi.Models.Errors.APIException       | 4XX, 5XX                                 | \*/\*                                    |


<!-- FILE: authentication/README.md -->

# Authentication
(*Authentication*)

## Overview

# DailyPay API Access

---

DailyPay adheres to the [OAuth 2.0 RFC 6749](https://datatracker.ietf.org/doc/html/rfc6749) and [OpenID Connect](https://openid.net/specs/openid-connect-core-1_0.html) specifications. This document will walk you through the steps to get an _access token_ your application can use to make requests to the DailyPay Public REST API.

We support the following methods:

- [Authorization Code Flow](https://www.rfc-editor.org/rfc/rfc6749#section-4.1): This method is suitable when access to resources requires user consent, such as bank account information or the ability to initiate transfers on behalf of the user.

  > It allows your application to get `access` and `refresh` tokens, facilitating user consent and enabling your application to perform actions on their behalf.

- [Client Credential Flow](https://datatracker.ietf.org/doc/html/rfc6749#section-4.4): This method is suitable for server-to-server operations, where additional levels of user consent may not be required.
  > The client credentials grant facilitates the acquisition of an access token independent of a user's protected resources. For instance, you can utilize [the _Organizations_ endpoint](/tag/v3/Organizations#operation/readOrganization).

# Authorization Code Flow

The purpose of following the OAuth2 flow is to help you retrieve an authorization <strong><code>code</code></strong>
and exchange it for an <strong><code>access_token</code></strong> via the <a href="/tag/Authentication#operation/requestOauthAccessToken">request access token</a> endpoint.

## 1. Register your Application

Your DailyPay contact will ask you to provide

- a callback url that can receive the <strong><code>code</code></strong> result of the OAuth 2.0 authorization code flow
- links to your privacy policy and terms of service
- optionally, a logo for use on the OAuth consent screen

<details>
<summary>OpenID Connect (OIDC)</summary>

- For additional security, you may be asked to provide DailyPay with a JSON Web Key Set (JWKS) or url for retrieving your JWKS to utilize signed <a href="https://openid.net/specs/openid-connect-core-1_0.html#JWTRequests">OIDC requests</a>.</p>
</details>

## 2. Configure

<p>DailyPay will provide configuration values for your application:</p>
<ul>
    <li><code>client_id</code></li>
    <li><code>client_secret</code>, if applicable</li>
    <li><code>scope</code>a list of scopes your application can request, which may include "offline_access" and "openid"</li>
    <li><code>redirect_uri</code> the registered callback url you provided</li>
</ul>

You may wish to use a client library (https://oauth.net/code/) to perform the next steps, using the configuration values above.

## 3. Initiate an OAuth2 request

Construct the request url using the template below, replacing the <strong><code>{scope}</code></strong>, <strong><code>{client_id}</code></strong>, and <strong><code>{redirect_uri}</code></strong> parameters with the configuration values accordingly.

Additionally, generate a <strong><code>state</code></strong> parameter for the specific request, and a code challenge and verifier (used in a later step) for <a href="https://oauth.net/2/pkce/">Proof Key Code Exchange</a>.

  <pre><code>https://auth.dailypay.com/oauth2/auth
    ?response_type=code
    &scope={scope}
    &client_id={client_id}
    &redirect_uri={redirect_uri}
    &state={state}
    &code_challenge={code_challenge}
    &code_challenge_method=S256
  </code></pre>

  <details>
  <summary>Example</summary>
  
  <pre><code>https://auth.dailypay.com/oauth2/auth
    ?response_type=code
    &scope=user%3aread_write%20openid
    &client_id=your-client-id
    &redirect_uri=https%3A%2F%2Fexample.com%2Fcallback
    &state=9876543fghijklm
    &code_challenge=hKpKupTM391pE10xfQiorMxXarRKAHRhTfH_xkGf7U4
    &code_challenge_method=S256
  </code></pre>
  
  Make sure to url-encode each parameter e.g. <code>user:read_write</code> becomes <code>user%3aread_write</code>
  </details>
  <br>

## 4. Open a browser window, tab, or secure mobile view to the constructed URL.

The user will be prompted to log in or create a new DailyPay account and will be prompted to allow your application to act on their behalf.

<img src="https://s3.amazonaws.com/dp-devportal-images/pngs/OAuthAllowFlow.png">

## 5. Handle the code

Users will be redirected in the open tab to your callback url with a `code` query parameter,
or an `error` and `error_description` if the user did not consent to your application's request or otherwise encountered an error.
You will also be returned the `state` parameter.

## 6. Exchange the code for an Access Token

As also specified in our [token endpoint documentation](Authentication#operation/requestToken),
send the following parameters www-form-encoded in the request body to https://auth.dailypay.com/oauth2/token.

<table>
<thead>
<tr>
<th>Parameter</th>
<th>Required</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>grant_type</td>
<td>Yes</td>
<td>Must be set to <code>authorization_code</code>.</td>
</tr>
<tr>
<td>client_id</td>
<td>Yes</td>
<td>Your client id provided by DailyPay.</td>
</tr>
<tr>
<td>code</td>
<td>Yes</td>
<td>The authorization code received from the authorization server.</td>
</tr>
<tr>
<td>redirect_uri</td>
<td>Yes</td>
<td>MUST be the redirection URI used in the initial authorization request.</td>
</tr>
<tr>
<td>client_secret</td>
<td>Varies</td>
<td>Your client secret, if provided by DailyPay.</td>
</tr>
<tr>
<td>code_verifier</td>
<td>Varies</td>
<td>The PKCE verifier matching the code_challenge generated earlier.</td>
</tr>
</tbody>
</table>

Example Request to the Token Endpoint

<pre><code>curl --request POST \
    --url https://auth.dailypay.com/oauth2/token \
    --header 'accept: application/json' \
    --header 'content-type: application/x-www-form-urlencoded' \
    --data "grant_type=authorization_code" \
    --data "client_id={client_id}" \
    --data "code={code}" \
    --data "redirect_uri={redirect_uri}" \
    --data "code_verifier={verifier}"
</code></pre>

The resulting access token can be used to make requests to the DailyPay Public REST API:

<pre><code>{
    "access_token": "dpo_38347Ae178B4a16C7e42F292c6912E7710c8",
    "token_type": "bearer",
    "expires_in": 3600,
    "created_at": 1669741580
}
</code></pre>

> The authorization code, access token, and refresh tokens can vary in size but will typically remain under 4096 btyes.

# Client Credentials Flow

As also specified in our [token endpoint documentation](Authentication#operation/requestToken),
send the following parameters www-form-encoded in the request body to https://auth.dailypay.com/oauth2/token.

<table>
<thead>
<tr>
<th>Parameter</th>
<th>Required</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>grant_type</td>
<td>Yes</td>
<td>Must be set to <code>client_credentials</code>.</td>
</tr>
<tr>
<td>scope</td>
<td>Yes</td>
<td>The space-delimited list of requested scopes</td>
</tr>
<tr>
<td>client_id</td>
<td>Yes</td>
<td>Your client id provided by DailyPay.</td>
</tr>
<tr>
<td>client_secret</td>
<td>Yes</td>
<td>Your client secret provided by DailyPay.</td>
</tr>
</tbody>
</table>

Example Request to the Token Endpoint

<pre><code>curl --request POST \
    --url https://auth.dailypay.com/oauth2/token \
    --header 'accept: application/json' \
    --header 'content-type: application/x-www-form-urlencoded' \
    --data "grant_type=client_credentials" \
    --data "scope={scopes}" \
    --data "client_id={client_id}" \
    --data "client_secret={client_secret}"
</code></pre>

The resulting access token can be used to make requests to the DailyPay Public REST API:

<pre><code>{
    "access_token": "dpo_38347Ae178B4a16C7e42F292c6912E7710c8",
    "token_type": "bearer",
    "expires_in": 3600,
    "created_at": 1669741580
}
</code></pre>

> The authorization code, access token, and refresh tokens can vary in size but will typically remain under 4096 btyes.

---


### Available Operations

* [RequestToken](#requesttoken) - Request access token

## RequestToken

Request a Dailypay user access token, as described in the <a href='https://datatracker.ietf.org/doc/html/rfc6749#section-4.1.3'>OAuth2 spec</a>. When grant_type is authorization_code, the code and redirect_uri parameters are required. When grant_type is refresh_token, the refresh_token parameter is required.

### Example Usage

```csharp
using Openapi;
using Openapi.Models.Requests;

var sdk = new SDK();

RequestTokenRequest req = RequestTokenRequest.CreateAuthorizationCodeFlow(
    new AuthorizationCodeFlow() {
        GrantType = GrantType.AuthorizationCode,
        Code = "50BTIf2h7Wtg3DAk7ytpG5ML_PsNjfQA4M7iupH_3jw",
        RedirectUri = "https://example.com/callback",
        State = "Oregon",
        ClientId = "<id>",
    }
);

var res = await sdk.Authentication.RequestTokenAsync(req);

// handle response
```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `request`                                                           | [RequestTokenRequest](../../Models/Requests/RequestTokenRequest.md) | :heavy_check_mark:                                                  | The request object to use for the request.                          |
| `serverURL`                                                         | *string*                                                            | :heavy_minus_sign:                                                  | An optional server URL to use.                                      |

### Response

**[RequestTokenResponse](../../Models/Requests/RequestTokenResponse.md)**

### Errors

| Error Type                                | Status Code                               | Content Type                              |
| ----------------------------------------- | ----------------------------------------- | ----------------------------------------- |
| Openapi.Models.Errors.BadRequestException | 400                                       | application/json                          |
| Openapi.Models.Errors.ErrorUnexpected     | 500                                       | application/vnd.api+json                  |
| Openapi.Models.Errors.APIException        | 4XX, 5XX                                  | \*/\*                                     |


<!-- FILE: cards/README.md -->

# Cards
(*Cards*)

## Overview

## What is the Payments API?

The Payments API is a PCI compliant endpoint and allows for secure debit card token creation. These tokens are used within DailyPay's APIs. When a tokenized debit card is added to a user’s account they can begin to take instant transfers.

**How does this work?** A user's debit card data is sent via POST request to the Payments API. The debit card data is encrypted and tokenized before being returned. This tokenized card data is used for instant transfers via the Extend API.

### What is PCI compliance?

It’s how we keep card data secure. DailyPay has a responsibility and legal requirement to protect debit card data therefore the Payments API endpoint complies with the Payment Card Industry Data Security Standards [PCI DSS](https://www.pcisecuritystandards.org/).

> 📘 **Info**
> DailyPay only handles card data during encryption and tokenization
> **The Payments server is DailyPay’s only PCI compliant API.**

## Create a Debit Card Token

Steps to create a tokenized debit card for use within DailyPay's APIs.

### 1. POST debit card data to the Payments API

After you have securely collected the debit card data for a user, create a POST to the PCI compliant payments endpoint [`POST Generic Card`](/v2/tag/Card-Creation) with the following required parameters in this example.

```json
{
  "first_name": "Edith",
  "last_name": "Clarke",
  "card_number": "4007589999999912",
  "expiration_year": "2027",
  "expiration_month": "02",
  "cvv": "123",
  "address_line_one": "1234 Street",
  "address_city": "Fort Lee",
  "address_state": "NJ",
  "address_zip_code": "07237",
  "address_country": "US"
}
```

### 2. Receive and handle the tokenized card data

The [payments endpoint](https://developer.dailypay.com/v2/reference/post_cards-generic) returns an opaque string representing the card details. This token is encrypted and complies with PCI DSS. You will need the token for step 3, after which it can be discarded. The token is a long string and will look similar to below:

```json
{"token":"eyJhbGciOiJSU0Et.....T0FFU”}
```

### 3. POST the token to the Extend API

> 📘 **Important** > [Proper authorization](/v2/tag/Authorization) is required to create a transfer account.

Send the encrypted token in a POST request to the [transfer accounts endpoint](/v2/tag/Users#operation/createTransferAccount) as the value for the `generic_token` field. This will create a transfer account and allow a user to start taking transfers.


### Available Operations

* [Create](#create) - Obtain a card token

## Create

Obtain a PCI DSS Compliant card token. This token must be used in order to add a card to a user’s DailyPay account.

### Example Usage

```csharp
using Openapi;
using Openapi.Models.Requests;

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

var res = await sdk.Cards.CreateAsync(req);

// handle response
```

### Parameters

| Parameter                                                                               | Type                                                                                    | Required                                                                                | Description                                                                             |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `request`                                                                               | [CreateGenericCardTokenRequest](../../Models/Requests/CreateGenericCardTokenRequest.md) | :heavy_check_mark:                                                                      | The request object to use for the request.                                              |
| `serverURL`                                                                             | *string*                                                                                | :heavy_minus_sign:                                                                      | An optional server URL to use.                                                          |

### Response

**[CreateGenericCardTokenResponse](../../Models/Requests/CreateGenericCardTokenResponse.md)**

### Errors

| Error Type                         | Status Code                        | Content Type                       |
| ---------------------------------- | ---------------------------------- | ---------------------------------- |
| Openapi.Models.Errors.APIException | 4XX, 5XX                           | \*/\*                              |


<!-- FILE: health/README.md -->

# Health
(*Health*)

## Overview

The _health_ endpoint provides a simple health check for the API. 

**Functionality:** Check the status of the API to ensure it is functioning
correctly.


### Available Operations

* [GetHealth](#gethealth) - Verify the status of the API

## GetHealth

Returns a 200 status code if the API is up and running.


### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.Health.GetHealthAsync();

// handle response
```

### Response

**[GetHealthResponse](../../Models/Requests/GetHealthResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |


<!-- FILE: jobs/README.md -->

# Jobs
(*Jobs*)

## Overview

The _jobs_ endpoint provides access to comprehensive information 
about a person's employment. It enables you to retrieve details about
individual jobs, including information about the organization
they work for, status, wage rate, job title, location,
paycheck settings, and related links to associated accounts.


### Available Operations

* [Read](#read) - Get a job object
* [Update](#update) - Update paycheck settings or deactivate a job
* [List](#list) - Get a list of job objects

## Read

Returns details about a person's employment.

### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.Jobs.ReadAsync(
    jobId: "aa860051-c411-4709-9685-c1b716df611b",
    version: 3
);

// handle response
```

### Parameters

| Parameter                                                                                                              | Type                                                                                                                   | Required                                                                                                               | Description                                                                                                            | Example                                                                                                                |
| ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `JobId`                                                                                                                | *string*                                                                                                               | :heavy_check_mark:                                                                                                     | Unique ID of the job                                                                                                   | aa860051-c411-4709-9685-c1b716df611b                                                                                   |
| `Version`                                                                                                              | *long*                                                                                                                 | :heavy_minus_sign:                                                                                                     | The version of the DailyPay API to use for this request. If not provided, the latest version of the API will be used.<br/> |                                                                                                                        |

### Response

**[ReadJobResponse](../../Models/Requests/ReadJobResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.ErrorBadRequest   | 400                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorForbidden    | 403                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorNotFound     | 404                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |

## Update

Update this job to set where pay should be deposited for paychecks related to this job,  or deactivate on-demand pay for this job. 
Returns the job object if the update succeeded. Returns an error if update parameters are invalid.


### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.Jobs.UpdateAsync(
    jobId: "e9d84b0d-92ba-43c9-93bf-7c993313fa6f",
    jobUpdateData: new JobUpdateData() {
        Data = new Data() {
            Id = "e9d84b0d-92ba-43c9-93bf-7c993313fa6f",
            Attributes = new JobAttributesInput() {
                ActivationStatus = ActivationStatus.Activated,
            },
            Relationships = new JobRelationshipsInput() {
                DirectDepositDefaultDepository = new AccountRelationship() {
                    Data = new AccountIdentifier() {
                        Id = "410ae962-51e1-4f44-b0a0-a0fd230a4dc5",
                    },
                },
                DirectDepositDefaultCard = new AccountRelationship() {
                    Data = new AccountIdentifier() {
                        Id = "2bc7d781-3247-46f6-b60f-4090d214936a",
                    },
                },
            },
        },
    },
    version: 3
);

// handle response
```

### Parameters

| Parameter                                                                                                              | Type                                                                                                                   | Required                                                                                                               | Description                                                                                                            | Example                                                                                                                |
| ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `JobId`                                                                                                                | *string*                                                                                                               | :heavy_check_mark:                                                                                                     | Unique ID of the job                                                                                                   | e9d84b0d-92ba-43c9-93bf-7c993313fa6f                                                                                   |
| `JobUpdateData`                                                                                                        | [JobUpdateData](../../Models/Components/JobUpdateData.md)                                                              | :heavy_check_mark:                                                                                                     | N/A                                                                                                                    |                                                                                                                        |
| `Version`                                                                                                              | *long*                                                                                                                 | :heavy_minus_sign:                                                                                                     | The version of the DailyPay API to use for this request. If not provided, the latest version of the API will be used.<br/> |                                                                                                                        |

### Response

**[UpdateJobResponse](../../Models/Requests/UpdateJobResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.JobUpdateError    | 400                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorForbidden    | 403                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorNotFound     | 404                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |

## List

Returns a collection of job objects. This object represents a person's employment details.
See [Filtering Jobs](https://developer.dailypay.com/tag/Filtering#section/Supported-Endpoint-Filters) for a description of filterable fields.


### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;
using Openapi.Models.Requests;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

ListJobsRequest req = new ListJobsRequest() {};

var res = await sdk.Jobs.ListAsync(req);

// handle response
```

### Parameters

| Parameter                                                   | Type                                                        | Required                                                    | Description                                                 |
| ----------------------------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------- |
| `request`                                                   | [ListJobsRequest](../../Models/Requests/ListJobsRequest.md) | :heavy_check_mark:                                          | The request object to use for the request.                  |

### Response

**[ListJobsResponse](../../Models/Requests/ListJobsResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.ErrorBadRequest   | 400                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorForbidden    | 403                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |


<!-- FILE: organizations/README.md -->

# Organizations
(*Organizations*)

## Overview

The _organizations_ endpoint provides details about a business entity, 
such as an employer, or a group of people, such as a division.

The response includes the organization name and ID which can be used to
make subsequent endpoint calls related to the organization and its
employees.


### Available Operations

* [Read](#read) - Get an organization
* [List](#list) - List organizations

## Read

Lookup organization by ID for a detailed view of single organization.

### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.Organizations.ReadAsync(
    organizationId: "123e4567-e89b-12d3-a456-426614174000",
    version: 3
);

// handle response
```

### Parameters

| Parameter                                                                                                              | Type                                                                                                                   | Required                                                                                                               | Description                                                                                                            | Example                                                                                                                |
| ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `OrganizationId`                                                                                                       | *string*                                                                                                               | :heavy_check_mark:                                                                                                     | Unique ID of the organization                                                                                          | 123e4567-e89b-12d3-a456-426614174000                                                                                   |
| `Version`                                                                                                              | *long*                                                                                                                 | :heavy_minus_sign:                                                                                                     | The version of the DailyPay API to use for this request. If not provided, the latest version of the API will be used.<br/> |                                                                                                                        |

### Response

**[ReadOrganizationResponse](../../Models/Requests/ReadOrganizationResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.ErrorBadRequest   | 400                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorForbidden    | 403                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorNotFound     | 404                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |

## List

Get organizations with an optional filter

### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.Organizations.ListAsync(
    version: 3,
    filterBy: "<value>"
);

// handle response
```

### Parameters

| Parameter                                                                                                               | Type                                                                                                                    | Required                                                                                                                | Description                                                                                                             |
| ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `Version`                                                                                                               | *long*                                                                                                                  | :heavy_minus_sign:                                                                                                      | The version of the DailyPay API to use for this request. If not provided, the latest version of the API will be used.<br/> |
| `FilterBy`                                                                                                              | *string*                                                                                                                | :heavy_minus_sign:                                                                                                      | : warning: ** DEPRECATED **: This will be removed in a future release, please migrate away from it as soon as possible. |

### Response

**[ListOrganizationsResponse](../../Models/Requests/ListOrganizationsResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.ErrorBadRequest   | 400                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorForbidden    | 403                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |


<!-- FILE: paychecks/README.md -->

# Paychecks
(*Paychecks*)

## Overview

The _paychecks_ endpoint provides detailed information about paychecks. 
You can retrieve individual paycheck details, including the
person and job associated with the paycheck, its status, pay period,
expected deposit date, total debited amount, withholdings, earnings, and
currency.

**Functionality:** Retrieve specific paycheck details, including payee and
job information, and monitor the status and financial details of each
paycheck.


### Available Operations

* [Read](#read) - Get a Paycheck object
* [List](#list) - Get a list of paycheck objects

## Read

Returns details about a paycheck object.

### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.Paychecks.ReadAsync(
    paycheckId: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    version: 3
);

// handle response
```

### Parameters

| Parameter                                                                                                              | Type                                                                                                                   | Required                                                                                                               | Description                                                                                                            | Example                                                                                                                |
| ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `PaycheckId`                                                                                                           | *string*                                                                                                               | :heavy_check_mark:                                                                                                     | Unique ID of the paycheck                                                                                              | 3fa85f64-5717-4562-b3fc-2c963f66afa6                                                                                   |
| `Version`                                                                                                              | *long*                                                                                                                 | :heavy_minus_sign:                                                                                                     | The version of the DailyPay API to use for this request. If not provided, the latest version of the API will be used.<br/> |                                                                                                                        |

### Response

**[ReadPaycheckResponse](../../Models/Requests/ReadPaycheckResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.ErrorBadRequest   | 400                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorForbidden    | 403                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorNotFound     | 404                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |

## List

Returns a collection of paycheck objects. This object details a person's pay and pay period.
See [Filtering Paychecks](https://developer.dailypay.com/tag/Filtering#section/Supported-Endpoint-Filters) for a description of filterable fields.


### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;
using Openapi.Models.Requests;
using System;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

ListPaychecksRequest req = new ListPaychecksRequest() {
    FilterDepositExpectedAtGte = System.DateTime.Parse("2023-03-15T04:00:00Z"),
    FilterDepositExpectedAtLt = System.DateTime.Parse("2023-03-15T04:00:00Z"),
    FilterPayPeriodEndsAtGte = System.DateTime.Parse("2023-03-15T04:00:00Z"),
    FilterPayPeriodEndsAtLt = System.DateTime.Parse("2023-03-15T04:00:00Z"),
    FilterPayPeriodStartsAtGte = System.DateTime.Parse("2023-03-15T04:00:00Z"),
    FilterPayPeriodStartsAtLt = System.DateTime.Parse("2023-03-15T04:00:00Z"),
};

var res = await sdk.Paychecks.ListAsync(req);

// handle response
```

### Parameters

| Parameter                                                             | Type                                                                  | Required                                                              | Description                                                           |
| --------------------------------------------------------------------- | --------------------------------------------------------------------- | --------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `request`                                                             | [ListPaychecksRequest](../../Models/Requests/ListPaychecksRequest.md) | :heavy_check_mark:                                                    | The request object to use for the request.                            |

### Response

**[ListPaychecksResponse](../../Models/Requests/ListPaychecksResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.ErrorBadRequest   | 400                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorForbidden    | 403                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |


<!-- FILE: people/README.md -->

# People
(*People*)

## Overview

The _people_ endpoint allows you to see information related to who owns 
resources such as jobs and accounts.

**Functionality:** Retrieve limited details about a person, including
their name, global status, and state of residence.


### Available Operations

* [Read](#read) - Get a person object
* [Update](#update) - Update a person

## Read

Returns details about a person.

### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.People.ReadAsync(
    personId: "aa860051-c411-4709-9685-c1b716df611b",
    version: 3
);

// handle response
```

### Parameters

| Parameter                                                                                                              | Type                                                                                                                   | Required                                                                                                               | Description                                                                                                            | Example                                                                                                                |
| ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `PersonId`                                                                                                             | *string*                                                                                                               | :heavy_check_mark:                                                                                                     | Unique ID of the person                                                                                                | aa860051-c411-4709-9685-c1b716df611b                                                                                   |
| `Version`                                                                                                              | *long*                                                                                                                 | :heavy_minus_sign:                                                                                                     | The version of the DailyPay API to use for this request. If not provided, the latest version of the API will be used.<br/> |                                                                                                                        |

### Response

**[ReadPersonResponse](../../Models/Requests/ReadPersonResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.ErrorBadRequest   | 400                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorForbidden    | 403                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorNotFound     | 404                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |

## Update

Update a person object.

### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.People.UpdateAsync(
    personId: "aa860051-c411-4709-9685-c1b716df611b",
    personData: new PersonDataInput() {
        Data = new PersonResourceInput() {
            Id = "aa860051-c411-4709-9685-c1b716df611b",
            Attributes = new PersonAttributesInput() {
                StateOfResidence = "NY",
            },
        },
    },
    version: 3
);

// handle response
```

### Parameters

| Parameter                                                                                                              | Type                                                                                                                   | Required                                                                                                               | Description                                                                                                            | Example                                                                                                                |
| ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `PersonId`                                                                                                             | *string*                                                                                                               | :heavy_check_mark:                                                                                                     | Unique ID of the person                                                                                                | aa860051-c411-4709-9685-c1b716df611b                                                                                   |
| `PersonData`                                                                                                           | [PersonDataInput](../../Models/Components/PersonDataInput.md)                                                          | :heavy_check_mark:                                                                                                     | N/A                                                                                                                    |                                                                                                                        |
| `Version`                                                                                                              | *long*                                                                                                                 | :heavy_minus_sign:                                                                                                     | The version of the DailyPay API to use for this request. If not provided, the latest version of the API will be used.<br/> |                                                                                                                        |

### Response

**[UpdatePersonResponse](../../Models/Requests/UpdatePersonResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.ErrorBadRequest   | 400                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorForbidden    | 403                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorNotFound     | 404                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |


<!-- FILE: sdk/README.md -->

# SDK

## Overview

DailyPay Public Rest API: # Welcome

This site contains information on basic DailyPay concepts and instructions for using the endpoints of each API. We are just now getting started with our public documentation - please let us know if you have any feedback or questions via Suggested Edits, where you can suggest changes to the documentation directly from the portal.

Here are some links to help you get familiar with the DailyPay basics:

[API Versioning](/tag/Getting-Started#section/DailyPay's-API-Versioning) — Find out how we version our APIs.  
[Environments](/tag/Getting-Started#section/Environments) — Get an overview of the different environments in the DailyPay API.  
[Glossary](/tag/Glossary) — Explore a list of terms used in the DailyPay API.


### Available Operations



<!-- FILE: transfers/README.md -->

# Transfers
(*Transfers*)

## Overview

The _transfers_ endpoint allows you to initiate and track money movement.  You can access transfer details, including the transfer's unique ID, amount, currency, status, schedule, submission and resolution times, fees, and related links to the involved parties.

**Functionality** Retrieve transfer information, monitor transfer statuses, view transfer schedules, and access relevant links for the source, destination, and origin of the transfer.

**Important** - Account origin: a user initiated movement of money from one account to another - Paycheck origin: an automatic (system-generated) movement of money as part of payroll


### Available Operations

* [Read](#read) - Get a transfer object
* [List](#list) - Get a list of transfers
* [Create](#create) - Request a transfer

## Read

Returns details about a transfer of money from one account to another. 

Created when a person takes an advance against a future paycheck, or on a daily basis when available balance is updated based on current employment.


### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.Transfers.ReadAsync(
    transferId: "aba332a2-24a2-46de-8257-5040e71ab210",
    version: 3,
    include: "<value>"
);

// handle response
```

### Parameters

| Parameter                                                                                                                                              | Type                                                                                                                                                   | Required                                                                                                                                               | Description                                                                                                                                            | Example                                                                                                                                                |
| ------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `TransferId`                                                                                                                                           | *string*                                                                                                                                               | :heavy_check_mark:                                                                                                                                     | Unique ID of the transfer                                                                                                                              | aba332a2-24a2-46de-8257-5040e71ab210                                                                                                                   |
| `Version`                                                                                                                                              | *long*                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                     | The version of the DailyPay API to use for this request. If not provided, the latest version of the API will be used.<br/>                             |                                                                                                                                                        |
| `Include`                                                                                                                                              | *string*                                                                                                                                               | :heavy_minus_sign:                                                                                                                                     | Add related resources to the response. <br/><br/>The value of the include parameter must be a comma-separated (U+002C COMMA, “,”) list of relationship paths.<br/> |                                                                                                                                                        |

### Response

**[ReadTransferResponse](../../Models/Requests/ReadTransferResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.ErrorBadRequest   | 400                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorForbidden    | 403                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorNotFound     | 404                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |

## List

Returns a list of transfer objects.
See [Filtering Transfers](https://developer.dailypay.com/tag/Filtering#section/Supported-Endpoint-Filters) for a description of filterable fields.


### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.Transfers.ListAsync(
    version: 3,
    filterPersonId: "<value>",
    include: "<value>",
    filterBy: "<value>"
);

// handle response
```

### Parameters

| Parameter                                                                                                                                              | Type                                                                                                                                                   | Required                                                                                                                                               | Description                                                                                                                                            |
| ------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `Version`                                                                                                                                              | *long*                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                     | The version of the DailyPay API to use for this request. If not provided, the latest version of the API will be used.<br/>                             |
| `FilterPersonId`                                                                                                                                       | *string*                                                                                                                                               | :heavy_minus_sign:                                                                                                                                     | Limit the results to documents related to a specific person                                                                                            |
| `Include`                                                                                                                                              | *string*                                                                                                                                               | :heavy_minus_sign:                                                                                                                                     | Add related resources to the response. <br/><br/>The value of the include parameter must be a comma-separated (U+002C COMMA, “,”) list of relationship paths.<br/> |
| `FilterBy`                                                                                                                                             | *string*                                                                                                                                               | :heavy_minus_sign:                                                                                                                                     | : warning: ** DEPRECATED **: This will be removed in a future release, please migrate away from it as soon as possible.                                |

### Response

**[ListTransfersResponse](../../Models/Requests/ListTransfersResponse.md)**

### Errors

| Error Type                              | Status Code                             | Content Type                            |
| --------------------------------------- | --------------------------------------- | --------------------------------------- |
| Openapi.Models.Errors.ErrorBadRequest   | 400                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnauthorized | 401                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorForbidden    | 403                                     | application/vnd.api+json                |
| Openapi.Models.Errors.ErrorUnexpected   | 500                                     | application/vnd.api+json                |
| Openapi.Models.Errors.APIException      | 4XX, 5XX                                | \*/\*                                   |

## Create

Request transfer of funds from an `EARNINGS_BALANCE` account to a
personal `DEPOSITORY` or `CARD` account.


### Example Usage

```csharp
using Openapi;
using Openapi.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.Transfers.CreateAsync(
    idempotencyKey: "7a621cf0-21cd-49cf-8540-3315211a509a",
    transferCreateData: new TransferCreateData() {
        Data = new TransferCreateResource() {
            Id = "aba332a2-24a2-46de-8257-5040e71ab210",
            Attributes = new TransferAttributesInput() {
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
                        Id = "410ae962-51e1-4f44-b0a0-a0fd230a4dc5",
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
    version: 3,
    include: "<value>"
);

// handle response
```

### Parameters

| Parameter                                                                                                                                                                                               | Type                                                                                                                                                                                                    | Required                                                                                                                                                                                                | Description                                                                                                                                                                                             |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `IdempotencyKey`                                                                                                                                                                                        | *string*                                                                                                                                                                                                | :heavy_check_mark:                                                                                                                                                                                      | An idempotency key is a unique string that you provide to ensure a request is only processed once.<br/>Any number of requests with the same idempotency key and payload will return an identical response.<br/> |
| `TransferCreateData`                                                                                                                                                                                    | [TransferCreateData](../../Models/Components/TransferCreateData.md)                                                                                                                                     | :heavy_check_mark:                                                                                                                                                                                      | N/A                                                                                                                                                                                                     |
| `Version`                                                                                                                                                                                               | *long*                                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                      | The version of the DailyPay API to use for this request. If not provided, the latest version of the API will be used.<br/>                                                                              |
| `Include`                                                                                                                                                                                               | *string*                                                                                                                                                                                                | :heavy_minus_sign:                                                                                                                                                                                      | Add related resources to the response. <br/><br/>The value of the include parameter must be a comma-separated (U+002C COMMA, “,”) list of relationship paths.<br/>                                      |

### Response

**[CreateTransferResponse](../../Models/Requests/CreateTransferResponse.md)**

### Errors

| Error Type                                | Status Code                               | Content Type                              |
| ----------------------------------------- | ----------------------------------------- | ----------------------------------------- |
| Openapi.Models.Errors.TransferCreateError | 400                                       | application/vnd.api+json                  |
| Openapi.Models.Errors.ErrorUnauthorized   | 401                                       | application/vnd.api+json                  |
| Openapi.Models.Errors.ErrorForbidden      | 403                                       | application/vnd.api+json                  |
| Openapi.Models.Errors.ErrorUnexpected     | 500                                       | application/vnd.api+json                  |
| Openapi.Models.Errors.APIException        | 4XX, 5XX                                  | \*/\*                                     |