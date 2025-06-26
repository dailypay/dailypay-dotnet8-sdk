<!-- Start SDK Example Usage [usage] -->
```csharp
using DailyPay;
using DailyPay.Models.Requests;

var sdk = new SDK();

RequestTokenRequest req = RequestTokenRequest.CreateAuthorizationCodeFlow(
    new AuthorizationCodeFlow() {
        GrantType = GrantType.AuthorizationCode,
        Code = "50BTIf2h7Wtg3DAk7ytpG5ML_PsNjfQA4M7iupH_3jw",
        RedirectUri = "https://example.com/callback",
        State = "Hawaii",
        ClientId = "<id>",
    }
);

var res = await sdk.Authentication.RequestTokenAsync(req);

// handle response
```
<!-- End SDK Example Usage [usage] -->