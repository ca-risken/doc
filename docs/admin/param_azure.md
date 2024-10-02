# Azure Parameters

Azureのパラメータです

## Azure共通

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_REGION** | AWSリージョン | | `ap-northeast-1` |
| **AWS_ACCESS_KEY_ID** | AWSアクセスキーID | | |
| **AWS_SECRET_ACCESS_KEY** | AWSシークレットキー | | |
| **AWS_SESSION_TOKEN** | AWSセッショントークン（STS一時キーを利用する場合） | | |
| **SQS_ENDPOINT** | SQSエンドポイント | | `http://queue.middleware.svc.cluster.local:9324` |
| **AZURE_PROWLER_QUEUE_NAME** | Azure Prowlerキュー名 | | `azure-prowler` |
| **AZURE_PROWLER_QUEUE_URL** | Azure ProwlerキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/azure-prowler` |
### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/azure/common`

## Prowlerサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |
| **AZURE_CLIENT_ID** | Azure Service PrincipalのクライアントID | yes | |
| **AZURE_CLIENT_SECRET** | Azure Service Principalのクライアントシークレット | yes | |
| **AZURE_TENANT_ID** | Azure Service PrincipalのテナントID | yes | |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/azure/prowler`

