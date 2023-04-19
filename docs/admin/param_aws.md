# AWS Parameters

AWSのパラメータです

## AWS共通

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_REGION** | AWSリージョン | | `ap-northeast-1` |
| **AWS_ACCESS_KEY_ID** | AWSアクセスキーID | | |
| **AWS_SECRET_ACCESS_KEY** | AWSシークレットキー | | |
| **AWS_SESSION_TOKEN** | AWSセッショントークン（STS一時キーを利用する場合） | | |
| **SQS_ENDPOINT** | SQSエンドポイント | | `http://queue.middleware.svc.cluster.local:9324` |
| **AWS_GUARD_DUTY_QUEUE_NAME** | AWS GuardDutyキュー名 | | `aws-guardduty` |
| **AWS_GUARD_DUTY_QUEUE_URL** | AWS GuardDutyキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-guardduty` |
| **AWS_ACCESS_ANALYZER_QUEUE_NAME** | AWS AccessAnalyzerキュー名 | | `aws-accessanalyzer` |
| **AWS_ACCESS_ANALYZER_QUEUE_URL** | AWS AccessAnalyzerキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-accessanalyzer` |
| **AWS_ADMIN_CHECKER_QUEUE_NAME** | AWS AdminCheckerキュー名 | | `aws-adminchecker` |
| **AWS_ADMIN_CHECKER_QUEUE_URL** | AWS AdminCheckerキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-adminchecker` |
| **AWS_CLOUDSPLOIT_QUEUE_NAME** | AWS CloudSploitキュー名 | | `aws-cloudsploit` |
| **AWS_CLOUDSPLOIT_QUEUE_URL** | AWS CloudSploitキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-cloudsploit` |
| **AWS_PORTSCAN_QUEUE_NAME** | AWS Portscanキュー名 | | `aws-portscan` |
| **AWS_PORTSCAN_QUEUE_URL** | AWS PortscanキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-portscan` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/common`

## AccessAnalyzerサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デクーの時間間隔（秒） | | `20` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/access-analyzer`

## AdminCheckerサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/admin-checker`

## CloudSploitサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `5` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/cloudsploit`

## GuardDutyサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/guard-duty`

## Portscanサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの間隔（秒） | | `20` |
| **SCAN_EXCLUDE_PORT_NUMBER** | スキャン対象のPort番号のレンジのリミット値（この数を超えるPort数はスキャン対象外になる） | | `1000` |
| **SCAN_CONCURRENCY** | スキャン並行数 | | `5` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/portscan`
