# OSINT Parameters

OSINTのパラメータです

## OSINT共通

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_REGION** | AWSリージョン | | `ap-northeast-1` |
| **AWS_ACCESS_KEY_ID** | AWSアクセスキーID | | |
| **AWS_SECRET_ACCESS_KEY** | AWSシークレットキー | | |
| **AWS_SESSION_TOKEN** | AWSセッショントークン（STS一時キーを利用する場合） | | |
| **SQS_ENDPOINT** | SQSエンドポイント | | `http://queue.middleware.svc.cluster.local:9324` |
| **SUBDOMAIN_QUEUE_NAME** | OSINT Subdomainキュー名 | | `osint-subdomain` |
| **SUBDOMAIN_QUEUE_URL** | OSINT SubdomainキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/osint-subdomain` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/osint/common`

## OSINTサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | | yes | `18081` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/osint/osint`

## Subdomainサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `5` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/osint/subdomain`