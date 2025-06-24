

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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

var res = await sdk.Accounts.ReadAsync(accountId: "2bc7d781-3247-46f6-b60f-4090d214936a");

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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

var res = await sdk.Accounts.CreateAsync(accountData: new AccountDataInput() {
    Data = new AccountResourceInput() {
        Attributes = AccountAttributesInput.CreateDepositoryInput(
            new DepositoryInput() {
                Name = "Acme Bank Checking Account",
                Subtype = AccountAttributesDepositorySubtype.Checking,
                DepositoryAccountDetails = new DepositoryAccountDetails() {
                    FirstName = "Edith",
                    LastName = "Clarke",
                    RoutingNumber = "XXXXX2021",
                    AccountNumber = "XXXXXX4321",
                },
            }
        ),
        Relationships = new AccountRelationships() {
            Person = new PersonRelationship() {
                Data = new PersonIdentifier() {
                    Id = "3fa8f641-5717-4562-b3fc-2c963f66afa6",
                },
            },
        },
    },
});

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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

var res = await sdk.Jobs.ReadAsync(jobId: "aa860051-c411-4709-9685-c1b716df611b");

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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

var res = await sdk.Jobs.UpdateAsync(
    jobId: "e9d84b0d-92ba-43c9-93bf-7c993313fa6f",
    jobUpdateData: new JobUpdateData() {
        Data = new Data() {
            Id = "e9d84b0d-92ba-43c9-93bf-7c993313fa6f",
            Attributes = new JobAttributesInput() {
                ActivationStatus = ActivationStatus.Deactivated,
            },
            Relationships = new JobRelationshipsInput() {
                DirectDepositDefaultDepository = new AccountRelationship() {
                    Data = new AccountIdentifier() {
                        Id = "2bc7d781-3247-46f6-b60f-4090d214936a",
                    },
                },
                DirectDepositDefaultCard = new AccountRelationship() {
                    Data = new AccountIdentifier() {
                        Id = "2bc7d781-3247-46f6-b60f-4090d214936a",
                    },
                },
            },
        },
    }
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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

var res = await sdk.Organizations.ReadAsync(organizationId: "123e4567-e89b-12d3-a456-426614174000");

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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

var res = await sdk.Organizations.ListAsync();

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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

var res = await sdk.Paychecks.ReadAsync(paycheckId: "3fa85f64-5717-4562-b3fc-2c963f66afa6");

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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

var res = await sdk.People.ReadAsync(personId: "aa860051-c411-4709-9685-c1b716df611b");

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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

var res = await sdk.People.UpdateAsync(
    personId: "aa860051-c411-4709-9685-c1b716df611b",
    personData: new PersonDataInput() {
        Data = new PersonResourceInput() {
            Id = "aa860051-c411-4709-9685-c1b716df611b",
            Attributes = new PersonAttributesInput() {
                StateOfResidence = "NY",
            },
        },
    }
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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

var res = await sdk.Transfers.ReadAsync(transferId: "aba332a2-24a2-46de-8257-5040e71ab210");

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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

var res = await sdk.Transfers.ListAsync();

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

var sdk = new SDK(
    version: 3,
    security: new Security() {
        OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
    }
);

var res = await sdk.Transfers.CreateAsync(
    idempotencyKey: "a9f22254-03be-42c3-bb00-eda090ffa656",
    transferCreateData: new TransferCreateData() {
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
    }
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