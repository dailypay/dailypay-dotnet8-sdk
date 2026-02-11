# Accounts

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

<!-- UsageSnippet language="csharp" operationID="readAccount" method="get" path="/rest/accounts/{account_id}" -->
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

ReadAccountRequest req = new ReadAccountRequest() {
    AccountId = "2bc7d781-3247-46f6-b60f-4090d214936a",
};

var res = await sdk.Accounts.ReadAsync(req);

// handle response
```

### Parameters

| Parameter                                                         | Type                                                              | Required                                                          | Description                                                       |
| ----------------------------------------------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------- |
| `request`                                                         | [ReadAccountRequest](../../Models/Requests/ReadAccountRequest.md) | :heavy_check_mark:                                                | The request object to use for the request.                        |

### Response

**[ReadAccountResponse](../../Models/Requests/ReadAccountResponse.md)**

### Errors

| Error Type                                           | Status Code                                          | Content Type                                         |
| ---------------------------------------------------- | ---------------------------------------------------- | ---------------------------------------------------- |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorBadRequest   | 400                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnauthorized | 401                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorForbidden    | 403                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorNotFound     | 404                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnexpected   | 500                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.APIException      | 4XX, 5XX                                             | \*/\*                                                |

## List

Returns a list of account objects. An account object represents a person's bank accounts, debit and pay cards, and earnings balance accounts.


### Example Usage: AllAccounts

<!-- UsageSnippet language="csharp" operationID="listAccounts" method="get" path="/rest/accounts" example="AllAccounts" -->
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
### Example Usage: ODPAccounts

<!-- UsageSnippet language="csharp" operationID="listAccounts" method="get" path="/rest/accounts" example="ODPAccounts" -->
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

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `request`                                                           | [ListAccountsRequest](../../Models/Requests/ListAccountsRequest.md) | :heavy_check_mark:                                                  | The request object to use for the request.                          |

### Response

**[ListAccountsResponse](../../Models/Requests/ListAccountsResponse.md)**

### Errors

| Error Type                                           | Status Code                                          | Content Type                                         |
| ---------------------------------------------------- | ---------------------------------------------------- | ---------------------------------------------------- |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorBadRequest   | 400                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnauthorized | 401                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorForbidden    | 403                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnexpected   | 500                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.APIException      | 4XX, 5XX                                             | \*/\*                                                |

## Create

Create an account object to store a person's bank or card information as a destination for funds.

### Example Usage: Card

<!-- UsageSnippet language="csharp" operationID="createAccount" method="post" path="/rest/accounts" example="Card" -->
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

CreateAccountRequest req = new CreateAccountRequest() {
    AccountCreateData = new AccountCreateData() {
        Data = new AccountCreateResource() {
            Attributes = AccountCreateAttributes.CreateAccountCreateAttributesCard(
                new AccountCreateAttributesCard() {
                    Name = "Acme Bank Debit Card",
                    Subtype = AccountCreateAttributesCardSubtype.Debit,
                    CreateCardAccountDetails = new CreateCardAccountDetails() {
                        Token = "abc.efg.123",
                        FirstName = "Edith",
                        LastName = "Clarke",
                        ExpirationMonth = "02",
                        ExpirationYear = "2027",
                        AddressLineOne = "123 Kebly Street",
                        AddressCity = "Fort Lee",
                        AddressState = "NJ",
                        AddressZipCode = "72374",
                        AddressCountry = "US",
                        Issuer = "411600",
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
    },
};

var res = await sdk.Accounts.CreateAsync(req);

// handle response
```
### Example Usage: Depository

<!-- UsageSnippet language="csharp" operationID="createAccount" method="post" path="/rest/accounts" example="Depository" -->
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

CreateAccountRequest req = new CreateAccountRequest() {
    AccountCreateData = new AccountCreateData() {
        Data = new AccountCreateResource() {
            Attributes = AccountCreateAttributes.CreateAccountCreateAttributesDepository(
                new AccountCreateAttributesDepository() {
                    Name = "Acme Bank Checking Account",
                    Subtype = AccountCreateAttributesDepositorySubtype.Checking,
                    DepositoryAccountDetails = new AccountCreateAttributesDepositoryDepositoryAccountDetails() {
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
    },
};

var res = await sdk.Accounts.CreateAsync(req);

// handle response
```

### Parameters

| Parameter                                                             | Type                                                                  | Required                                                              | Description                                                           |
| --------------------------------------------------------------------- | --------------------------------------------------------------------- | --------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `request`                                                             | [CreateAccountRequest](../../Models/Requests/CreateAccountRequest.md) | :heavy_check_mark:                                                    | The request object to use for the request.                            |

### Response

**[CreateAccountResponse](../../Models/Requests/CreateAccountResponse.md)**

### Errors

| Error Type                                            | Status Code                                           | Content Type                                          |
| ----------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- |
| DailyPay.SDK.DotNet8.Models.Errors.AccountCreateError | 400                                                   | application/vnd.api+json                              |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnauthorized  | 401                                                   | application/vnd.api+json                              |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorForbidden     | 403                                                   | application/vnd.api+json                              |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnexpected    | 500                                                   | application/vnd.api+json                              |
| DailyPay.SDK.DotNet8.Models.Errors.APIException       | 4XX, 5XX                                              | \*/\*                                                 |