# Core Parameters

Coreのパラメータです

## Coreサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | ポート番号 | | `8080` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/core/core`

## DataSourceAPIサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | ポート番号 | | `8081` |
| **SQS_ENDPOINT** | SQSエンドポイント | | `http://queue.middleware.svc.cluster.local:9324` |
| **CODE_DATA_KEY** | GitHubのクレデンシャル用の暗号キー | yes | |
| **GOOGLE_CREDENTIAL_PATH** | GCPサービスアカウントのクレデンシャルを一時保存するパス | | `/tmp/credential.json` |
| **AWS_GUARD_DUTY_QUEUE_URL** | AWS GuardDutyキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-guardduty` |
| **AWS_ACCESS_ANALYZER_QUEUE_URL** | AWS AccessAnalyzerキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-accessanalyzer` |
| **AWS_ADMIN_CHECKER_QUEUE_URL** | AWS AdminCheckerキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-adminchecker` |
| **AWS_CLOUDSPLOIT_QUEUE_URL** | AWS CloudSploitキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-cloudsploit` |
| **AWS_PORTSCAN_QUEUE_URL** | AWS PortscanキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-portscan` |
| **GOOGLE_ASSET_QUEUE_URL** | Google AssetキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-asset` |
| **GOOGLE_CLOUDSPLOIT_QUEUE_URL** | Google CloudSploitキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-cloudsploit` |
| **GOOGLE_SCC_QUEUE_URL** | Google Security Command CenterキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-scc` |
| **GOOGLE_PORTSCAN_QUEUE_URL** | Google PortscanキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-portscan` |
| **CODE_GITLEAKS_QUEUE_URL** | GileaksキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/code-gitleaks` |
| **DIAGNOSIS_WPSCAN_QUEUE_URL** | WPScanキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/diagnosis-wpscan` |
| **DIAGNOSIS_PORTSCAN_QUEUE_URL** | PortscanキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/diagnosis-portscan` |
| **DIAGNOSIS_APPLICATION_SCAN_QUEUE_URL** | アプリケーションスキャンキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/diagnosis-applicationscan` |
| **OSINT_SUBDOMAIN_QUEUE_URL** | OSINT SubdomainキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/osint-subdomain` |
| **OSINT_WEBSITE_QUEUE_URL** | OSINT WebsiteキューURL | | `http://queue.middleware.svc.cluster.local:9324/queue/osint-website` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/core/datasource-api`
- `/env/aws/common`
- `/env/google/common`
- `/env/code/common`
- `/env/diagnosis/common`
- `/env/osint/common`

