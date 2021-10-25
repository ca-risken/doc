# Google Parameters

Googleのパラメータです

## Google共通

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_REGION** | AWSリージョン | | `ap-northeast-1` |
| **AWS_ACCESS_KEY_ID** | AWSアクセスキーID | | |
| **AWS_SECRET_ACCESS_KEY** | AWSシークレットキー | | |
| **AWS_SESSION_TOKEN** | AWSセッショントークン（STS一時キーを利用する場合） | | |
| **SQS_ENDPOINT** | SQSエンドポイント | | `http://queue.middleware.svc.cluster.local:9324` |
| **ASSET_QUEUE_NAME** | Google Assetキュー名 | | `google-asset` |
| **ASSET_QUEUE_URL** | Google AssetキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-asset` |
| **CLOUDSPOIT_QUEUE_NAME** | Google CloudSploitキュー名 | | `google-cloudsploit` |
| **CLOUDSPOIT_QUEUE_URL** | Google CloudSploitキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-cloudsploit` |
| **SCC_QUEUE_NAME** | Security Command Centerキュー名 | | `google-scc` |
| **SCC_QUEUE_URL** | Security Command CenterキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-scc` |
| **PORTSCAN_QUEUE_NAME** | Security Command Centerキュー名 | | `google-portscan` |
| **PORTSCAN_QUEUE_URL** | Security Command CenterキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-portscan` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/google/common`


## Googleサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | | | `11001` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/google/google`

## Assetサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |
| **GOOGLE_CREDENTIAL_PATH** | GCPサービスアカウントのクレデンシャルを一時保存するパス | | `/tmp/credential.json` |
| **GOOGLE_SERVICE_ACCOUNT_JSON** | GCPサービスアカウントのクレデンシャル（JSON） | yes | `20` |
| **WAIT_MILLI_SEC_PER_REQUEST** | GCP Asset 1秒間の最大APIのリクエスト数 | | `500` |
| **ASSET_API_RETRY_NUM** | GCP Asset API失敗時のリトライ回数 | | `3` |
| **ASSET_API_RETRY_WAIT_SEC** | GCP Asset APIリトライ再開までの待ち時間（秒） | | `30` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/google/asset`

## CloudSploitサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |
| **GOOGLE_SERVICE_ACCOUNT_EMAIL** | GCPサービスアカウントのEMAIL | yes | |
| **GOOGLE_SERVICE_ACCOUNT_PRIVATE_KEY** | GCPサービスアカウントのRSA秘密鍵 | yes | |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/google/cloudsploit`


## Security Command Centerサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |
| **GOOGLE_CREDENTIAL_PATH** | GCPサービスアカウントのクレデンシャルを一時保存するパス | | `/tmp/credential.json` |
| **GOOGLE_SERVICE_ACCOUNT_JSON** | GCPサービスアカウントのクレデンシャル（JSON） | yes | `20` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/google/scc`

## Security Command Centerサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |
| **GOOGLE_CREDENTIAL_PATH** | GCPサービスアカウントのクレデンシャルを一時保存するパス | | `/tmp/credential.json` |
| **GOOGLE_SERVICE_ACCOUNT_JSON** | GCPサービスアカウントのクレデンシャル（JSON） | yes | `20` |
| **SCAN_EXCLUDE_PORT_NUMBER** | スキャン対象のPort番号のレンジのリミット値（この数を超えるPort数はスキャン対象外になる） | yes | `1000` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/google/portscan`