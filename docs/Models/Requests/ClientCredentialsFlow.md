# ClientCredentialsFlow


## Fields

| Field                                                      | Type                                                       | Required                                                   | Description                                                | Example                                                    |
| ---------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------- |
| `GrantType`                                                | *string*                                                   | :heavy_check_mark:                                         | The OAuth2 grant type                                      | client_credentials                                         |
| `Scope`                                                    | *string*                                                   | :heavy_check_mark:                                         | A space-separated list of scopes to request                | client:lookup health:read                                  |
| `ClientId`                                                 | *string*                                                   | :heavy_check_mark:                                         | The client id of the application requesting the token.     |                                                            |
| `ClientSecret`                                             | *string*                                                   | :heavy_check_mark:                                         | The client secret of the application requesting the token. |                                                            |