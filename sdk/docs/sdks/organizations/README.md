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
using DailyPay;
using DailyPay.Models.Components;

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

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| DailyPay.Models.Errors.ErrorBadRequest   | 400                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnauthorized | 401                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorForbidden    | 403                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorNotFound     | 404                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnexpected   | 500                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.APIException      | 4XX, 5XX                                 | \*/\*                                    |

## List

Get organizations with an optional filter

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

| Error Type                               | Status Code                              | Content Type                             |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| DailyPay.Models.Errors.ErrorBadRequest   | 400                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnauthorized | 401                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorForbidden    | 403                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.ErrorUnexpected   | 500                                      | application/vnd.api+json                 |
| DailyPay.Models.Errors.APIException      | 4XX, 5XX                                 | \*/\*                                    |