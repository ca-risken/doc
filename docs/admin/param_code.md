# Code Parameters

Codeのパラメータです

## Code共通

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_REGION** | AWSリージョン | | `ap-northeast-1` |
| **AWS_ACCESS_KEY_ID** | AWSアクセスキーID | | |
| **AWS_SECRET_ACCESS_KEY** | AWSシークレットキー | | |
| **AWS_SESSION_TOKEN** | AWSセッショントークン（STS一時キーを利用する場合） | | |
| **SQS_ENDPOINT** | SQSエンドポイント | | `http://queue.middleware.svc.cluster.local:9324` |
| **CODE_GITLEAKS_QUEUE_NAME** | Gitleaksキュー名 | | `code-gitleaks` |
| **CODE_GITLEAKS_QUEUE_URL** | GileaksキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/code-gitleaks` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/code/common`

## Gitleaksサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの間隔（秒） | | `20` |
| **CODE_DATA_KEY** | GitHubのクレデンシャル用の暗号キー | | |
| **GITHUB_DEFAULT_TOKEN** | GitHubデフォルトトークン | | `your-token-here`|
| **LIMIT_REPOSITORY_SIZE_KB** | Gitleaksスキャン時のリポジトリサイズLimit値 | | `500000` |
| **REDACT** | 検出されたシークレット情報をRISKNEN側でマスクして保存します | | `true` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/code/gitleaks`
