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
using DailyPay;
using DailyPay.Models.Components;

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

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| DailyPay.Models.Errors.ErrorBadRequest   | 400                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnauthorized | 401                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorForbidden    | 403                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorNotFound     | 404                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnexpected   | 500                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.APIException      | 4XX, 5XX                                 | \*/\*                                    |

## List

Returns a list of account objects. An account object represents a person's bank accounts, debit and pay cards, and earnings balance accounts.
See [Filtering Accounts](https://developer.dailypay.com/tag/Filtering#section/Supported-Endpoint-Filters) for a description of filterable fields.


### Example Usage

```csharp
using DailyPay;
using DailyPay.Models.Components;
using DailyPay.Models.Requests;

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

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| DailyPay.Models.Errors.ErrorBadRequest   | 400                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnauthorized | 401                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorForbidden    | 403                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnexpected   | 500                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.APIException      | 4XX, 5XX                                 | \*/\*                                    |

## Create

Create an account object to store a person's bank or card information as a destination for funds.

### Example Usage

```csharp
using DailyPay;
using DailyPay.Models.Components;

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

| Error Type                                | Status Code                               | Content Type                              |
| ----------------------------------------- | ----------------------------------------- | ----------------------------------------- |
| DailyPay.Models.Errors.AccountCreateError | 400                                       | application/vnd.api+json                  |
| DailyPay.Models.Errors.ErrorUnauthorized  | 401                                       | application/vnd.api+json                  |
| DailyPay.Models.Errors.ErrorForbidden     | 403                                       | application/vnd.api+json                  |
| DailyPay.Models.Errors.ErrorUnexpected    | 500                                       | application/vnd.api+json                  |
| DailyPay.Models.Errors.APIException       | 4XX, 5XX                                  | \*/\*                                     |