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
using DailyPay;
using DailyPay.Models.Components;

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

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| DailyPay.Models.Errors.ErrorBadRequest   | 400                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnauthorized | 401                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorForbidden    | 403                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorNotFound     | 404                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnexpected   | 500                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.APIException      | 4XX, 5XX                                 | \*/\*                                    |

## List

Returns a collection of paycheck objects. This object details a person's pay and pay period.
See [Filtering Paychecks](https://developer.dailypay.com/tag/Filtering#section/Supported-Endpoint-Filters) for a description of filterable fields.


### Example Usage

```csharp
using DailyPay;
using DailyPay.Models.Components;
using DailyPay.Models.Requests;
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

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| DailyPay.Models.Errors.ErrorBadRequest   | 400                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnauthorized | 401                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorForbidden    | 403                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnexpected   | 500                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.APIException      | 4XX, 5XX                                 | \*/\*                                    |