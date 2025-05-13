

<!-- FILE: AccountCreateError.md -->

# AccountCreateError

The request contained an error


## Fields

| Field                                                                               | Type                                                                                | Required                                                                            | Description                                                                         |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `Errors`                                                                            | List<[ErrorAccountCreateError](../../Models/Components/ErrorAccountCreateError.md)> | :heavy_check_mark:                                                                  | A list of errors that occurred.                                                     |


<!-- FILE: BadRequestException.md -->

# BadRequestException

Something went wrong when exchanging oauth grant or refresh token for an access token. NOTE: This conforms to the OAuth spec and does not follow the same error pattern as the rest of the API


## Fields

| Field                                                                                                                                                                                          | Type                                                                                                                                                                                           | Required                                                                                                                                                                                       | Description                                                                                                                                                                                    | Example                                                                                                                                                                                        |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ErrorCode`                                                                                                                                                                                    | [ErrorCode](../../Models/Errors/ErrorCode.md)                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                             | Error code indicating what went wrong with the oauth token exchange. See the OAuth2 RFC for further context https://datatracker.ietf.org/doc/html/rfc6749#section-5.2                          |                                                                                                                                                                                                |
| `ErrorDescription`                                                                                                                                                                             | *string*                                                                                                                                                                                       | :heavy_minus_sign:                                                                                                                                                                             | A description of exactly went wrong with the oauth token exchange. This is meant to improve developer experience, and is subject to change, so this should not be relied upon programatically. | The requested scope is invalid, unknown, or malformed.                                                                                                                                         |
| `HttpMeta`                                                                                                                                                                                     | [HTTPMetadata](../../Models/Components/HTTPMetadata.md)                                                                                                                                        | :heavy_check_mark:                                                                                                                                                                             | N/A                                                                                                                                                                                            |                                                                                                                                                                                                |


<!-- FILE: ErrorBadRequest.md -->

# ErrorBadRequest

Bad Request


## Fields

| Field                                                                         | Type                                                                          | Required                                                                      | Description                                                                   |
| ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `Errors`                                                                      | List<[ErrorBadRequestError](../../Models/Components/ErrorBadRequestError.md)> | :heavy_check_mark:                                                            | A list of errors that occurred.                                               |


<!-- FILE: ErrorCode.md -->

# ErrorCode

Error code indicating what went wrong with the oauth token exchange. See the OAuth2 RFC for further context https://datatracker.ietf.org/doc/html/rfc6749#section-5.2


## Values

| Name                   | Value                  |
| ---------------------- | ---------------------- |
| `InvalidRequest`       | invalid_request        |
| `InvalidClient`        | invalid_client         |
| `InvalidGrant`         | invalid_grant          |
| `UnauthorizedClient`   | unauthorized_client    |
| `UnsupportedGrantType` | unsupported_grant_type |


<!-- FILE: ErrorForbidden.md -->

# ErrorForbidden

Not authorized to perform this operation


## Fields

| Field                                                                       | Type                                                                        | Required                                                                    | Description                                                                 |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `Errors`                                                                    | List<[ErrorForbiddenError](../../Models/Components/ErrorForbiddenError.md)> | :heavy_check_mark:                                                          | A list of errors that occurred.                                             |


<!-- FILE: ErrorNotFound.md -->

# ErrorNotFound

Resource was not found


## Fields

| Field                                                                     | Type                                                                      | Required                                                                  | Description                                                               |
| ------------------------------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `Errors`                                                                  | List<[ErrorNotFoundError](../../Models/Components/ErrorNotFoundError.md)> | :heavy_check_mark:                                                        | A list of errors that occurred.                                           |


<!-- FILE: ErrorUnauthorized.md -->

# ErrorUnauthorized

Invalid authentication credentials


## Fields

| Field                                                                             | Type                                                                              | Required                                                                          | Description                                                                       |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `Errors`                                                                          | List<[ErrorUnauthorizedError](../../Models/Components/ErrorUnauthorizedError.md)> | :heavy_check_mark:                                                                | A list of errors that occurred.                                                   |


<!-- FILE: ErrorUnexpected.md -->

# ErrorUnexpected

Unexpected error occured


## Fields

| Field                                                                         | Type                                                                          | Required                                                                      | Description                                                                   |
| ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `Errors`                                                                      | List<[ErrorUnexpectedError](../../Models/Components/ErrorUnexpectedError.md)> | :heavy_check_mark:                                                            | A list of errors that occurred.                                               |


<!-- FILE: JobUpdateError.md -->

# JobUpdateError

Bad Request


## Fields

| Field                                                                       | Type                                                                        | Required                                                                    | Description                                                                 |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `Errors`                                                                    | List<[ErrorJobUpdateError](../../Models/Components/ErrorJobUpdateError.md)> | :heavy_check_mark:                                                          | A list of errors that occurred.                                             |


<!-- FILE: TransferCreateError.md -->

# TransferCreateError

The request contained an error


## Fields

| Field                                                                                 | Type                                                                                  | Required                                                                              | Description                                                                           |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| `Errors`                                                                              | List<[ErrorTransferCreateError](../../Models/Components/ErrorTransferCreateError.md)> | :heavy_check_mark:                                                                    | A list of errors that occurred.                                                       |