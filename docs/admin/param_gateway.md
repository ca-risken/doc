# Gateway Parameters

Gatewayのパラメータです

## Gatewayサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | ポート番号 | | `8000` |
| **DEBUG** | Debugログ有効化 | | `false` |
| **USER_IDENTITY_HEADER** | IdPから渡されるヘッダ（ユーザを識別する値） | | `x-amzn-oidc-identity` |
| **OIDC_DATA_HEADER** | IdPから渡されるヘッダ（ユーザ情報が含まれるJWTペイロード） | | `x-amzn-oidc-data` |
| **IDP_PROVIDER_NAME** | IdP名 | | |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/gateway/gateway`
