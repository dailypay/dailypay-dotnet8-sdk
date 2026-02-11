# Jobs

## Overview

The _jobs_ endpoint provides access to comprehensive information 
about a person's employment. It enables you to retrieve details about
individual jobs, including information about the organization
they work for, status, wage rate, job title, location,
paycheck settings, and related links to associated accounts.


### Available Operations

* [Read](#read) - Get a job object
* [Update](#update) - Update paycheck settings or deactivate a job
* [List](#list) - Get a list of job objects

## Read

Returns details about a person's employment.

### Example Usage

<!-- UsageSnippet language="csharp" operationID="readJob" method="get" path="/rest/jobs/{job_id}" -->
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

ReadJobRequest req = new ReadJobRequest() {
    JobId = "aa860051-c411-4709-9685-c1b716df611b",
};

var res = await sdk.Jobs.ReadAsync(req);

// handle response
```

### Parameters

| Parameter                                                 | Type                                                      | Required                                                  | Description                                               |
| --------------------------------------------------------- | --------------------------------------------------------- | --------------------------------------------------------- | --------------------------------------------------------- |
| `request`                                                 | [ReadJobRequest](../../Models/Requests/ReadJobRequest.md) | :heavy_check_mark:                                        | The request object to use for the request.                |

### Response

**[ReadJobResponse](../../Models/Requests/ReadJobResponse.md)**

### Errors

| Error Type                                           | Status Code                                          | Content Type                                         |
| ---------------------------------------------------- | ---------------------------------------------------- | ---------------------------------------------------- |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorBadRequest   | 400                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnauthorized | 401                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorForbidden    | 403                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorNotFound     | 404                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnexpected   | 500                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.APIException      | 4XX, 5XX                                             | \*/\*                                                |

## Update

Update this job to set where pay should be deposited for paychecks related to this job,  or deactivate on-demand pay for this job. 
Returns the job object if the update succeeded. Returns an error if update parameters are invalid.


### Example Usage: Deactivate

<!-- UsageSnippet language="csharp" operationID="updateJob" method="patch" path="/rest/jobs/{job_id}" example="Deactivate" -->
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

UpdateJobRequest req = new UpdateJobRequest() {
    JobId = "e9d84b0d-92ba-43c9-93bf-7c993313fa6f",
    JobUpdateData = new JobUpdateData() {
        JobUpdateResource = new JobUpdateResource() {
            Id = "e9d84b0d-92ba-43c9-93bf-7c993313fa6f",
            JobUpdateAttributes = new JobUpdateAttributes() {
                ActivationStatus = JobUpdateDataActivationStatus.Deactivated,
            },
        },
    },
};

var res = await sdk.Jobs.UpdateAsync(req);

// handle response
```
### Example Usage: DirectDeposit

<!-- UsageSnippet language="csharp" operationID="updateJob" method="patch" path="/rest/jobs/{job_id}" example="DirectDeposit" -->
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

UpdateJobRequest req = new UpdateJobRequest() {
    JobId = "e9d84b0d-92ba-43c9-93bf-7c993313fa6f",
    JobUpdateData = new JobUpdateData() {
        JobUpdateResource = new JobUpdateResource() {
            Id = "e9d84b0d-92ba-43c9-93bf-7c993313fa6f",
            JobUpdateRelationships = new JobUpdateRelationships() {
                DirectDepositDefaultDepository = new AccountRelationship() {
                    Data = new AccountIdentifier() {
                        Id = "123e4567-e89b-12d3-a456-426614174000",
                    },
                },
                DirectDepositDefaultCard = new AccountRelationship() {
                    Data = new AccountIdentifier() {
                        Id = "223e4567-e89b-12d3-a456-426614174001",
                    },
                },
            },
        },
    },
};

var res = await sdk.Jobs.UpdateAsync(req);

// handle response
```

### Parameters

| Parameter                                                     | Type                                                          | Required                                                      | Description                                                   |
| ------------------------------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------------------- |
| `request`                                                     | [UpdateJobRequest](../../Models/Requests/UpdateJobRequest.md) | :heavy_check_mark:                                            | The request object to use for the request.                    |

### Response

**[UpdateJobResponse](../../Models/Requests/UpdateJobResponse.md)**

### Errors

| Error Type                                           | Status Code                                          | Content Type                                         |
| ---------------------------------------------------- | ---------------------------------------------------- | ---------------------------------------------------- |
| DailyPay.SDK.DotNet8.Models.Errors.JobUpdateError    | 400                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnauthorized | 401                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorForbidden    | 403                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorNotFound     | 404                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnexpected   | 500                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.APIException      | 4XX, 5XX                                             | \*/\*                                                |

## List

Returns a collection of job objects. This object represents a person's employment details.


### Example Usage

<!-- UsageSnippet language="csharp" operationID="listJobs" method="get" path="/rest/jobs" -->
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

ListJobsRequest req = new ListJobsRequest() {
    FilterExternalIdentifiersPrimaryIdentifier = "PRIMARY_ID_98765",
    FilterExternalIdentifiersEmployeeId = "EMP123456",
    FilterExternalIdentifiersGroup = "12345",
    FilterPersonId = "aa860051-c411-4709-9685-c1b716df611b",
    FilterOrganizationId = "f0b30634-108c-439c-a8c1-c6a91197f022",
};

var res = await sdk.Jobs.ListAsync(req);

// handle response
```

### Parameters

| Parameter                                                   | Type                                                        | Required                                                    | Description                                                 |
| ----------------------------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------- |
| `request`                                                   | [ListJobsRequest](../../Models/Requests/ListJobsRequest.md) | :heavy_check_mark:                                          | The request object to use for the request.                  |

### Response

**[ListJobsResponse](../../Models/Requests/ListJobsResponse.md)**

### Errors

| Error Type                                           | Status Code                                          | Content Type                                         |
| ---------------------------------------------------- | ---------------------------------------------------- | ---------------------------------------------------- |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorBadRequest   | 400                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnauthorized | 401                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorForbidden    | 403                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.ErrorUnexpected   | 500                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet8.Models.Errors.APIException      | 4XX, 5XX                                             | \*/\*                                                |