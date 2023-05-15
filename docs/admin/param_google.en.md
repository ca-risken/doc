# Google Parameters

Parameters for Google

## Google Common

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_REGION** | AWS Region | | `ap-northeast-1` |
| **AWS_ACCESS_KEY_ID** | AWS Access Key ID | | |
| **AWS_SECRET_ACCESS_KEY** | AWS Secret Key | | |
| **AWS_SESSION_TOKEN** | AWS Session Token (when using STS temporary key) | | |
| **SQS_ENDPOINT** | SQS endpoint | | `http://queue.middleware.svc.cluster.local:9324` |
| **GOOGLE_ASSET_QUEUE_NAME** | Google Asset queue name | | `google-asset` |
| **GOOGLE_ASSET_QUEUE_URL** | Google Asset queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-asset` |
| **GOOGLE_CLOUDSPLOIT_QUEUE_NAME** | Google CloudSploit queue name | | `google-cloudsploit` |
| **GOOGLE_CLOUDSPLOIT_QUEUE_URL** | Google CloudSploit queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-cloudsploit` |
| **GOOGLE_SCC_QUEUE_NAME** | Security Command Center queue name | | `google-scc` |
| **GOOGLE_SCC_QUEUE_URL** | Security Command Center queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-scc` |
| **GOOGLE_PORTSCAN_QUEUE_NAME** | Google Portscan queue name | | `google-portscan` |
| **GOOGLE_PORTSCAN_QUEUE_URL** | Google Portscan queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/google-portscan` |

### Parameter Store location (example)

The parameters are stored under the following path:

- `/env/google/common`

## Asset Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Activate DEBUG level logs | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Number of queue messages to process concurrently | | `10` |
| **WAIT_TIME_SECOND** | Interval of dequeue (in seconds) | | `20` |
| **GOOGLE_CREDENTIAL_PATH** | Path to temporarily store GCP service account credentials | | `/tmp/credential.json` |
| **GOOGLE_SERVICE_ACCOUNT_JSON** | GCP service account credentials (JSON) | yes | |

### Parameter Store location (example)

The parameters are stored under the following path:

- `/env/google/asset`

## CloudSploit Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Activate DEBUG level logs | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Number of queue messages to process concurrently | | `10` |
| **WAIT_TIME_SECOND** | Interval of dequeue (in seconds) | | `20` |
| **GOOGLE_SERVICE_ACCOUNT_EMAIL** | GCP service account email | yes | |
| **GOOGLE_SERVICE_ACCOUNT_PRIVATE_KEY** | RSA private key of the GCP service account | yes | |

### Parameter Store location (example)

The parameters are stored under the following path:

- `/env/google/cloudsploit`

## Security Command Center Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Enable DEBUG level logging | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Maximum number of queued messages to process concurrently | | `10` |
| **WAIT_TIME_SECOND** | Dequeue interval time in seconds | | `20` |
| **GOOGLE_CREDENTIAL_PATH** | Path to temporarily store GCP service account credentials | | `/tmp/credential.json` |
| **GOOGLE_SERVICE_ACCOUNT_JSON** | GCP service account credentials (JSON) | yes | |

### Parameter Store destination (example)

Save the parameters under the following path:

- `/env/google/scc`

## Portscan Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Enable DEBUG level logging | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Maximum number of queued messages to process concurrently | | `10` |
| **WAIT_TIME_SECOND** | Dequeue interval time in seconds | | `20` |
| **GOOGLE_CREDENTIAL_PATH** | Path to temporarily store GCP service account credentials | | `/tmp/credential.json` |
| **GOOGLE_SERVICE_ACCOUNT_JSON** | GCP service account credentials (JSON) | yes ||
| **SCAN_EXCLUDE_PORT_NUMBER** | Limit value of the range of Port numbers to be scanned (Ports over this number are excluded from scanning) | | `1000` |
| **SCAN_CONCURRENCY** | Number of concurrent Portscan processes | | `5` |

### Parameter Store destination (example)

Save the parameters under the following path:

- `/env/google/portscan`
