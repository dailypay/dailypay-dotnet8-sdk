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
using DailyPay;
using DailyPay.Models.Components;

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

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| DailyPay.Models.Errors.ErrorBadRequest   | 400                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnauthorized | 401                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorForbidden    | 403                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorNotFound     | 404                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnexpected   | 500                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.APIException      | 4XX, 5XX                                 | \*/\*                                    |

## List

Returns a list of transfer objects.
See [Filtering Transfers](https://developer.dailypay.com/tag/Filtering#section/Supported-Endpoint-Filters) for a description of filterable fields.


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

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| DailyPay.Models.Errors.ErrorBadRequest   | 400                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnauthorized | 401                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorForbidden    | 403                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnexpected   | 500                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.APIException      | 4XX, 5XX                                 | \*/\*                                    |

## Create

Request transfer of funds from an `EARNINGS_BALANCE` account to a
personal `DEPOSITORY` or `CARD` account.


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

var res = await sdk.Transfers.CreateAsync(
    idempotencyKey: "ea9f2225-403b-4e2c-93b0-0eda090ffa65",
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

| Error Type                                 | Status Code                                | Content Type                               |
| ------------------------------------------ | ------------------------------------------ | ------------------------------------------ |
| DailyPay.Models.Errors.TransferCreateError | 400                                        | application/vnd.api+json                   |
| DailyPay.Models.Errors.ErrorUnauthorized   | 401                                        | application/vnd.api+json                   |
| DailyPay.Models.Errors.ErrorForbidden      | 403                                        | application/vnd.api+json                   |
| DailyPay.Models.Errors.ErrorUnexpected     | 500                                        | application/vnd.api+json                   |
| DailyPay.Models.Errors.APIException        | 4XX, 5XX                                   | \*/\*                                      |