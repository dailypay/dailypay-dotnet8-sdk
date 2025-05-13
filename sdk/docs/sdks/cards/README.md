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