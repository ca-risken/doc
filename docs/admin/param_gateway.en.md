# Gateway Parameters

These are parameters for the Gateway.

## Gateway Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | Port number | | `8000` |
| **DEBUG** | Enable debug logs | | `false` |
| **USER_IDENTITY_HEADER** | Header from IdP containing a value to identify the user | | `x-amzn-oidc-identity` |
| **OIDC_DATA_HEADER** | Header from IdP containing a JWT payload with user information | | `x-amzn-oidc-data` |
| **IDP_PROVIDER_NAME** | Name of the IdP | | |
| **VERIFY_ID_TOKEN** | Flag to enable verification of JWT payload | | `false` |
| **USER_IDP_KEY** | Key in the JWT payload to use for the User Key reserved for the user | | `preferred_username` |
| **REGION** | Region where the User Pool is created when using Amazon Cognito as the IdP | | `ap-northeast-1` |

### Parameter Store Location (Example)

Save the parameters under the following path:

- `/env/gateway/gateway`

## Web Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **VUE_APP_STATIC_LINK** | Link to display in the header and menu of the console page | | `[]` |

### Parameter Store Location (Example)

Register the parameter with the following name in Parameter Store:

- `/build/web/VUE_APP_STATIC_LINK`

Here is a sample value to register:

```json
[{"title": "Document", "url": "https://docs.security-hub.jp/"}]
```

???+ note
    Parameters for the Web service are referenced during the build.