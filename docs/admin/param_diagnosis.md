# Diagnosis Parameters

Diagnosisのパラメータです

## Diagnosis共通

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_REGION** | AWSリージョン | | `ap-northeast-1` |
| **AWS_ACCESS_KEY_ID** | AWSアクセスキーID | | |
| **AWS_SECRET_ACCESS_KEY** | AWSシークレットキー | | |
| **AWS_SESSION_TOKEN** | AWSセッショントークン（STS一時キーを利用する場合） | | |
| **SQS_ENDPOINT** | SQSエンドポイント | | `http://queue.middleware.svc.cluster.local:9324` |
| **DIAGNOSIS_JIRA_QUEUE_NAME** | JIRAキュー名 | | `diagnosis-jira` |
| **DIAGNOSIS_JIRA_QUEUE_URL** | JIRAキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/diagnosis-jira` |
| **DIAGNOSIS_WPSCAN_QUEUE_NAME** | WPScanキュー名 | | `diagnosis-wpscan` |
| **DIAGNOSIS_WPSCAN_QUEUE_URL** | WPScanキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/diagnosis-wpscan` |
| **DIAGNOSIS_PORTSCAN_QUEUE_NAME** | Portscanキュー名 | | `diagnosis-portscan` |
| **DIAGNOSIS_PORTSCAN_QUEUE_URL** | PortscanキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/diagnosis-portscan` |
| **DIAGNOSIS_APPLICATION_SCAN_QUEUE_NAME** | アプリケーションスキャンキュー名 | | `diagnosis-applicationscan` |
| **DIAGNOSIS_APPLICATION_SCAN_QUEUE_URL** | アプリケーションスキャンキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/diagnosis-applicationscan` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/diagnosis/common`

## Diagnosisサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | | | `19002` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/diagnosis/diagnosis`

## JIRAサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |
| **DIAGNOSIS_JIRA_URL** | JIRAのURL | yes | |
| **DIAGNOSIS_JIRA_USER_ID** | JIRAのユーザID | yes | |
| **DIAGNOSIS_JIRA_USER_PASSWORD** | JIRAのパスワード | yes | |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/diagnosis/jira`

## Portscanサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/diagnosis/portscan`

## WPScanサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |
| **WPSCAN_VULNDB_APIKEY** | WPScan用のAPIキー（有料プランを利用してる場合に設定） | | |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/diagnosis/portscan`

## ApplicationScanサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの時間間隔（秒） | | `20` |

### ParameterStore保存先（例）

以下のPath配下にパラメータを保存

- `/env/diagnosis/applicationscan`
