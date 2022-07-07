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
| **GOOGLE_ASSET_QUEUE_NAME** | Google Assetキュー名 | | `google-asset` |
| **GOOGLE_ASSET_QUEUE_URL** | Google AssetキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-asset` |
| **GOOGLE_CLOUDSPLOIT_QUEUE_NAME** | Google CloudSploitキュー名 | | `google-cloudsploit` |
| **GOOGLE_CLOUDSPLOIT_QUEUE_URL** | Google CloudSploitキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-cloudsploit` |
| **GOOGLE_SCC_QUEUE_NAME** | Security Command Centerキュー名 | | `google-scc` |
| **GOOGLE_SCC_QUEUE_URL** | Security Command CenterキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-scc` |
| **GOOGLE_PORTSCAN_QUEUE_NAME** | Security Command Centerキュー名 | | `google-portscan` |
| **GOOGLE_PORTSCAN_QUEUE_URL** | Security Command CenterキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-portscan` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/google/common`

## Assetサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |
| **GOOGLE_CREDENTIAL_PATH** | GCPサービスアカウントのクレデンシャルを一時保存するパス | | `/tmp/credential.json` |
| **GOOGLE_SERVICE_ACCOUNT_JSON** | GCPサービスアカウントのクレデンシャル（JSON） | yes | |
| **WAIT_MILLI_SEC_PER_REQUEST** | GCP Asset 1秒間の最大APIのリクエスト数 | | `500` |
| **ASSET_API_RETRY_NUM** | GCP Asset API失敗時のリトライ回数 | | `3` |
| **ASSET_API_RETRY_WAIT_SEC** | GCP Asset APIリトライ再開までの待ち時間（秒） | | `30` |

### Parameter Store保存先（例）

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

### Parameter Store保存先（例）

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
| **GOOGLE_SERVICE_ACCOUNT_JSON** | GCPサービスアカウントのクレデンシャル（JSON） | yes | |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/google/scc`

## Portscanサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |
| **GOOGLE_CREDENTIAL_PATH** | GCPサービスアカウントのクレデンシャルを一時保存するパス | | `/tmp/credential.json` |
| **GOOGLE_SERVICE_ACCOUNT_JSON** | GCPサービスアカウントのクレデンシャル（JSON） | yes ||
| **SCAN_EXCLUDE_PORT_NUMBER** | スキャン対象のPort番号のレンジのリミット値（この数を超えるPort数はスキャン対象外になる） | | `1000` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/google/portscan`
