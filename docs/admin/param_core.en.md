# Core Parameters

These are the parameters for the Core.

## Core Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | Port number | | `8080` |

### Parameter Store Destination (Example)

Save the parameters under the following path:

- `/env/core/core`

## DataSourceAPI Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | Port number | | `8081` |
| **SQS_ENDPOINT** | SQS endpoint | | `http://queue.middleware.svc.cluster.local:9324` |
| **CODE_DATA_KEY** | Encryption key for GitHub credentials | yes | |
| **GOOGLE_CREDENTIAL_PATH** | Path to temporarily store GCP service account credentials | | `/tmp/credential.json` |
| **AWS_GUARD_DUTY_QUEUE_URL** | AWS GuardDuty queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-guardduty` |
| **AWS_ACCESS_ANALYZER_QUEUE_URL** | AWS AccessAnalyzer queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-accessanalyzer` |
| **AWS_ADMIN_CHECKER_QUEUE_URL** | AWS AdminChecker queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-adminchecker` |
| **AWS_CLOUDSPLOIT_QUEUE_URL** | AWS CloudSploit queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-cloudsploit` |
| **AWS_PORTSCAN_QUEUE_URL** | AWS Portscan queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-portscan` |
| **GOOGLE_ASSET_QUEUE_URL** | Google Asset queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-asset` |
| **GOOGLE_CLOUDSPLOIT_QUEUE_URL** | Google CloudSploit queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-cloudsploit` |
| **GOOGLE_SCC_QUEUE_URL** | Google Security Command Center queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-scc` |
| **GOOGLE_PORTSCAN_QUEUE_URL** | Google Portscan queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-portscan` |
| **CODE_GITLEAKS_QUEUE_URL** | Gitleaks queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/code-gitleaks` |
| **DIAGNOSIS_WPSCAN_QUEUE_URL** | WPScan queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/diagnosis-wpscan` |
| **DIAGNOSIS_PORTSCAN_QUEUE_URL** | Portscan queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/diagnosis-portscan` |
| **DIAGNOSIS_APPLICATION_SCAN_QUEUE_URL** | Application Scan queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/diagnosis-applicationscan` |
| **OSINT_SUBDOMAIN_QUEUE_URL** | OSINT Subdomain queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/osint-subdomain` |
| **OSINT_WEBSITE_QUEUE_URL** | OSINT Website queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/osint-website` |

### Parameter Store Destination (Example)

Save the parameters under the following

- `/env/core/datasource-api`
- `/env/aws/common`
- `/env/google/common`
- `/env/code/common`
- `/env/diagnosis/common`
- `/env/osint/common`

