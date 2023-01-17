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
| **VERIFY_ID_TOKEN** | JWTペイロードの検証を行うかのフラグ | | `false` |
| **USER_IDP_KEY** | ユーザ予約で使用するUser Keyに使用するJWTペイロードのキー | | `preferred_username` |
| **REGION** | IdPに Amazon Cognitoを使用している場合のユーザープールを作成したRegion | | `ap-northeast-1` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/gateway/gateway`

## Webサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **VUE_APP_STATIC_LINK** | コンソール画面のヘッダとメニューに表するリンク | | `[]` |

### Parameter Store保存先（例）

以下の名前でParameter Storeに登録してください

- `/build/web/VUE_APP_STATIC_LINK`

???+ note
    Webサービスのパラメータはビルド時に参照されます
