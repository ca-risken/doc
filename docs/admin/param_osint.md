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
| **OSINT_SUBDOMAIN_QUEUE_NAME** | OSINT Subdomainキュー名 | | `osint-subdomain` |
| **OSINT_SUBDOMAIN_QUEUE_URL** | OSINT SubdomainキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/osint-subdomain` |
| **OSINT_WEBSITE_QUEUE_NAME** | OSINT Websiteキュー名 | | `osint-website` |
| **OSINT_WEBSITE_QUEUE_URL** | OSINT WebsiteキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/osint-website` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/osint/common`

## Subdomainサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `5` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/osint/subdomain`

## Websiteサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `5` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/osint/website`
