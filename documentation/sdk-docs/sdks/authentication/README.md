# Authentication
(*Authentication*)

## Overview

# DailyPay API Access

---

DailyPay adheres to the [OAuth 2.0 RFC 6749](https://datatracker.ietf.org/doc/html/rfc6749) and [OpenID Connect](https://openid.net/specs/openid-connect-core-1_0.html) specifications. This document will walk you through the steps to get an _access token_ your application can use to make requests to the DailyPay Public REST API.

We support the following methods:

- [Authorization Code Flow](https://www.rfc-editor.org/rfc/rfc6749#section-4.1): This method is suitable when access to resources requires user consent, such as bank account information or the ability to initiate transfers on behalf of the user.

  > It allows your application to get `access` and `refresh` tokens, facilitating user consent and enabling your application to perform actions on their behalf.

- [Client Credential Flow](https://datatracker.ietf.org/doc/html/rfc6749#section-4.4): This method is suitable for server-to-server operations, where additional levels of user consent may not be required.
  > The client credentials grant facilitates the acquisition of an access token independent of a user's protected resources. For instance, you can utilize [the _Organizations_ endpoint](/tag/v3/Organizations#operation/readOrganization).

# Authorization Code Flow

The purpose of following the OAuth2 flow is to help you retrieve an authorization <strong><code>code</code></strong>
and exchange it for an <strong><code>access_token</code></strong> via the <a href="/tag/Authentication#operation/requestOauthAccessToken">request access token</a> endpoint.

## 1. Register your Application

Your DailyPay contact will ask you to provide

- a callback url that can receive the <strong><code>code</code></strong> result of the OAuth 2.0 authorization code flow
- links to your privacy policy and terms of service
- optionally, a logo for use on the OAuth consent screen

<details>
<summary>OpenID Connect (OIDC)</summary>

- For additional security, you may be asked to provide DailyPay with a JSON Web Key Set (JWKS) or url for retrieving your JWKS to utilize signed <a href="https://openid.net/specs/openid-connect-core-1_0.html#JWTRequests">OIDC requests</a>.</p>
</details>

## 2. Configure

<p>DailyPay will provide configuration values for your application:</p>
<ul>
    <li><code>client_id</code></li>
    <li><code>client_secret</code>, if applicable</li>
    <li><code>scope</code>a list of scopes your application can request, which may include "offline_access" and "openid"</li>
    <li><code>redirect_uri</code> the registered callback url you provided</li>
</ul>

You may wish to use a client library (https://oauth.net/code/) to perform the next steps, using the configuration values above.

## 3. Initiate an OAuth2 request

Construct the request url using the template below, replacing the <strong><code>{scope}</code></strong>, <strong><code>{client_id}</code></strong>, and <strong><code>{redirect_uri}</code></strong> parameters with the configuration values accordingly.

Additionally, generate a <strong><code>state</code></strong> parameter for the specific request, and a code challenge and verifier (used in a later step) for <a href="https://oauth.net/2/pkce/">Proof Key Code Exchange</a>.

  <pre><code>https://auth.dailypay.com/oauth2/auth
    ?response_type=code
    &scope={scope}
    &client_id={client_id}
    &redirect_uri={redirect_uri}
    &state={state}
    &code_challenge={code_challenge}
    &code_challenge_method=S256
  </code></pre>

  <details>
  <summary>Example</summary>
  
  <pre><code>https://auth.dailypay.com/oauth2/auth
    ?response_type=code
    &scope=user%3aread_write%20openid
    &client_id=your-client-id
    &redirect_uri=https%3A%2F%2Fexample.com%2Fcallback
    &state=9876543fghijklm
    &code_challenge=hKpKupTM391pE10xfQiorMxXarRKAHRhTfH_xkGf7U4
    &code_challenge_method=S256
  </code></pre>
  
  Make sure to url-encode each parameter e.g. <code>user:read_write</code> becomes <code>user%3aread_write</code>
  </details>
  <br>

## 4. Open a browser window, tab, or secure mobile view to the constructed URL.

The user will be prompted to log in or create a new DailyPay account and will be prompted to allow your application to act on their behalf.

<img src="https://s3.amazonaws.com/dp-devportal-images/pngs/OAuthAllowFlow.png">

## 5. Handle the code

Users will be redirected in the open tab to your callback url with a `code` query parameter,
or an `error` and `error_description` if the user did not consent to your application's request or otherwise encountered an error.
You will also be returned the `state` parameter.

## 6. Exchange the code for an Access Token

As also specified in our [token endpoint documentation](Authentication#operation/requestToken),
send the following parameters www-form-encoded in the request body to https://auth.dailypay.com/oauth2/token.

<table>
<thead>
<tr>
<th>Parameter</th>
<th>Required</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>grant_type</td>
<td>Yes</td>
<td>Must be set to <code>authorization_code</code>.</td>
</tr>
<tr>
<td>client_id</td>
<td>Yes</td>
<td>Your client id provided by DailyPay.</td>
</tr>
<tr>
<td>code</td>
<td>Yes</td>
<td>The authorization code received from the authorization server.</td>
</tr>
<tr>
<td>redirect_uri</td>
<td>Yes</td>
<td>MUST be the redirection URI used in the initial authorization request.</td>
</tr>
<tr>
<td>client_secret</td>
<td>Varies</td>
<td>Your client secret, if provided by DailyPay.</td>
</tr>
<tr>
<td>code_verifier</td>
<td>Varies</td>
<td>The PKCE verifier matching the code_challenge generated earlier.</td>
</tr>
</tbody>
</table>

Example Request to the Token Endpoint

<pre><code>curl --request POST \
    --url https://auth.dailypay.com/oauth2/token \
    --header 'accept: application/json' \
    --header 'content-type: application/x-www-form-urlencoded' \
    --data "grant_type=authorization_code" \
    --data "client_id={client_id}" \
    --data "code={code}" \
    --data "redirect_uri={redirect_uri}" \
    --data "code_verifier={verifier}"
</code></pre>

The resulting access token can be used to make requests to the DailyPay Public REST API:

<pre><code>{
    "access_token": "dpo_38347Ae178B4a16C7e42F292c6912E7710c8",
    "token_type": "bearer",
    "expires_in": 3600,
    "created_at": 1669741580
}
</code></pre>

> The authorization code, access token, and refresh tokens can vary in size but will typically remain under 4096 btyes.

# Client Credentials Flow

As also specified in our [token endpoint documentation](Authentication#operation/requestToken),
send the following parameters www-form-encoded in the request body to https://auth.dailypay.com/oauth2/token.

<table>
<thead>
<tr>
<th>Parameter</th>
<th>Required</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>grant_type</td>
<td>Yes</td>
<td>Must be set to <code>client_credentials</code>.</td>
</tr>
<tr>
<td>scope</td>
<td>Yes</td>
<td>The space-delimited list of requested scopes</td>
</tr>
<tr>
<td>client_id</td>
<td>Yes</td>
<td>Your client id provided by DailyPay.</td>
</tr>
<tr>
<td>client_secret</td>
<td>Yes</td>
<td>Your client secret provided by DailyPay.</td>
</tr>
</tbody>
</table>

Example Request to the Token Endpoint

<pre><code>curl --request POST \
    --url https://auth.dailypay.com/oauth2/token \
    --header 'accept: application/json' \
    --header 'content-type: application/x-www-form-urlencoded' \
    --data "grant_type=client_credentials" \
    --data "scope={scopes}" \
    --data "client_id={client_id}" \
    --data "client_secret={client_secret}"
</code></pre>

The resulting access token can be used to make requests to the DailyPay Public REST API:

<pre><code>{
    "access_token": "dpo_38347Ae178B4a16C7e42F292c6912E7710c8",
    "token_type": "bearer",
    "expires_in": 3600,
    "created_at": 1669741580
}
</code></pre>

> The authorization code, access token, and refresh tokens can vary in size but will typically remain under 4096 btyes.

---


### Available Operations

* [RequestToken](#requesttoken) - Request access token

## RequestToken

Request a Dailypay user access token, as described in the <a href='https://datatracker.ietf.org/doc/html/rfc6749#section-4.1.3'>OAuth2 spec</a>. When grant_type is authorization_code, the code and redirect_uri parameters are required. When grant_type is refresh_token, the refresh_token parameter is required.

### Example Usage

```csharp
using Openapi;
using Openapi.Models.Requests;

var sdk = new SDK();

RequestTokenRequest req = RequestTokenRequest.CreateAuthorizationCodeFlow(
    new AuthorizationCodeFlow() {
        GrantType = GrantType.AuthorizationCode,
        Code = "50BTIf2h7Wtg3DAk7ytpG5ML_PsNjfQA4M7iupH_3jw",
        RedirectUri = "https://example.com/callback",
        State = "Oregon",
        ClientId = "<id>",
    }
);

var res = await sdk.Authentication.RequestTokenAsync(req);

// handle response
```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `request`                                                           | [RequestTokenRequest](../../Models/Requests/RequestTokenRequest.md) | :heavy_check_mark:                                                  | The request object to use for the request.                          |
| `serverURL`                                                         | *string*                                                            | :heavy_minus_sign:                                                  | An optional server URL to use.                                      |

### Response

**[RequestTokenResponse](../../Models/Requests/RequestTokenResponse.md)**

### Errors

| Error Type                                | Status Code                               | Content Type                              |
| ----------------------------------------- | ----------------------------------------- | ----------------------------------------- |
| Openapi.Models.Errors.BadRequestException | 400                                       | application/json                          |
| Openapi.Models.Errors.ErrorUnexpected     | 500                                       | application/vnd.api+json                  |
| Openapi.Models.Errors.APIException        | 4XX, 5XX                                  | \*/\*                                     |