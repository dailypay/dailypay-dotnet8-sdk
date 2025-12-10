# CardTokenization

## Overview

Securely tokenize personal cards for use in the accounts API.

### Available Operations

* [Create](#create) - Obtain a card token

## Create

Obtain a PCI DSS Compliant card token. This token must be used in order to add a card to a user’s DailyPay account.

### Example Usage

<!-- UsageSnippet language="csharp" operationID="createGenericCardToken" method="post" path="/cards/generic" -->
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

var res = await sdk.CardTokenization.CreateAsync(req);

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

| Error Type                                      | Status Code                                     | Content Type                                    |
| ----------------------------------------------- | ----------------------------------------------- | ----------------------------------------------- |
| DailyPay.SDK.DotNet8.Models.Errors.APIException | 4XX, 5XX                                        | \*/\*                                           |