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
| **GITLEAKS_QUEUE_NAME** | Gitleaksキュー名 | | `code-gitleaks` |
| **GITLEAKS_QUEUE_URL** | GileaksキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/code-gitleaks` |
| **GITLEAKS_FULL_SCAN_QUEUE_NAME** | Gitleaks(full-scan用)キュー名 | | `code-gitleaks` |
| **GITLEAKS_FULL_SCAN_QUEUE_URL** | Gitleaks(full-scan用)キューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/code-gitleaks` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/code/common`

## Codeサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | | | `10001` |
| **DATA_KEY** | GitHubのクレデンシャル用の暗号キー | yes | |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/code/code`

## Gitleaksサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | DEBUGレベルログの有効化 | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | 1度に並行処理するキューメッセージ数 | | `10` |
| **WAIT_TIME_SECOND** | デキューの間隔（秒） | | `20` |
| **DATA_KEY** | GitHubのクレデンシャル用の暗号キー | | |
| **GITHUB_DEFAULT_TOKEN** | GitHubデフォルトトークン | | `your-token-here`|
| **LIMIT_REPOSITORY_SIZE_KB** | Gitleaksスキャン時のリポジトリサイズLimit値 | | `500000` |
| **SEPERATE_SCAN_DAYS** | Gitleaksスキャン時のコミット分割期間 | | `365` |
| **GITLEAKS_SCAN_THREADS** | Gitleaksのスキャンスレッドオプション | | `1` |
| **SCAN_ON_MEMORY** | リポジトリスキャンをOnMemoryで実行するかどうか | | `false` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/code/gitleaks`

## GitleaksFullScanサービス（Optional）

Gitleaksの初回スキャンはGitHubリポジトリのフルスキャン処理が実行されるため時間がかかる可能性があります。（次回以降は差分スキャンです。）

オプションとして `GITLEAKS_FULL_SCAN_QUEUE_NAME` と `GITLEAKS_FULL_SCAN_QUEUE_URL` を設定することで、別のキューにスキャン処理の依頼を振り分けることができます。（デフォルト値は通常のスキャンと同じキューURLが設定されています）

初回フルスキャン用のキューを分けると以下のメリットがあります

- Podのスペックを調整できる
- キューの可視性タイムアウト時間を調整できる

フルスキャン用のキューに振り分ける場合は、専用のDeploymentを追加してください。コンテナイメージはGitleaksのものと同じです。
マニフェストのサンプルは以下です。

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: gitleaks-full-scan
  namespace: code
  labels:
    app: gitleaks-full-scan
spec:
  replicas: 1
  selector:
    matchLabels:
      app: gitleaks-full-scan
  template:
    metadata:
      labels:
        app: gitleaks-full-scan
    spec:
      serviceAccountName: code
      containers:
        - name: gitleaks-full-scan
          image: 'public.ecr.aws/risken/code/gitleaks:latest'
          ports:
            - containerPort: 10002
              name: gitleaks
```
