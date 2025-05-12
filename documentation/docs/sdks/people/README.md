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