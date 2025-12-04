<!-- Start SDK Example Usage [usage] -->
### Look up accounts

Fetch a list of accounts, including earnings balance accounts.

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

### Request a transfer

Initiate a transfer of funds from an earnings balance account to a personal depository or card account.

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

CreateTransferRequest req = new CreateTransferRequest() {
    Include = "estimated_funding_sources,final_funding_sources",
    IdempotencyKey = "e2736aa1-78c4-4cc6-b0a6-848e733f232a",
    TransferCreateData = new TransferCreateData() {
        Data = new TransferCreateResource() {
            Attributes = new TransferAttributesInput() {
                Preview = true,
                Amount = 15000,
                Currency = "USD",
                Schedule = TransferAttributesSchedule.WithinThirtyMinutes,
            },
            Relationships = new TransferCreateRelationships() {
                Origin = new AccountRelationship() {
                    Data = new AccountIdentifier() {
                        Id = "123e4567-e89b-12d3-a456-426614174000",
                    },
                },
                Destination = new AccountRelationship() {
                    Data = new AccountIdentifier() {
                        Id = "223e4567-e89b-12d3-a456-426614174001",
                    },
                },
                Person = new PersonRelationship() {
                    Data = new PersonIdentifier() {
                        Id = "aa860051-c411-4709-9685-c1b716df611b",
                    },
                },
            },
        },
    },
};

var res = await sdk.Transfers.CreateAsync(req);

// handle response
```
<!-- End SDK Example Usage [usage] -->