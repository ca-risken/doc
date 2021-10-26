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
| **GUARD_DUTY_QUEUE_NAME** | AWS GuardDutyキュー名 | | `aws-guardduty` |
| **GUARD_DUTY_QUEUE_URL** | AWS GuardDutyキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-guardduty` |
| **ACCESS_ANALYZER_QUEUE_NAME** | AWS AccessAnalyzerキュー名 | | `aws-accessanalyzer` |
| **ACCESS_ANALYZER_QUEUE_URL** | AWS AccessAnalyzerキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-accessanalyzer` |
| **ADMIN_CHECKER_QUEUE_NAME** | AWS AdminCheckerキュー名 | | `aws-adminchecker` |
| **ADMIN_CHECKER_QUEUE_URL** | AWS AdminCheckerキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-adminchecker` |
| **CLOUDSPLOIT_QUEUE_NAME** | AWS CloudSploitキュー名 | | `aws-cloudsploit` |
| **CLOUDSPLOIT_QUEUE_URL** | AWS CloudSploitキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-cloudsploit` |
| **PORTSCAN_QUEUE_NAME** | AWS Portscanキュー名 | | `aws-portscan` |
| **PORTSCAN_QUEUE_URL** | AWS PortscanキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-portscan` |
| **ASSET_NAME** | AWS Portscanキュー名 | | `aws-portscan` |
| **ASSET_QUEUE_URL** | AWS PortscanキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-portscan` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/common`

## AWSサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | | yes | `9001` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/aws`

## AccessAnalyzerサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デクーの時間間隔（秒） | | `20` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/access-analyzer`

## Activityサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | | | `9007` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/activity`

## AdminCheckerサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/admin-checker`

## CloudSploitサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `5` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/cloudsploit`

## GuardDutyサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/guard-duty`

## Portscanサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの間隔（秒） | | `20` |
| **SCAN_EXCLUDE_PORT_NUMBER** | スキャン対象のPort番号のレンジのリミット値（この数を超えるPort数はスキャン対象外になる） | yes | `1000` |


### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/aws/portscan`
