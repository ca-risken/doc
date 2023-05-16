# Diagnosis Parameters

These are the parameters for Diagnosis.

## Common Diagnosis

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_REGION** | AWS Region | | `ap-northeast-1` |
| **AWS_ACCESS_KEY_ID** | AWS Access Key ID | | |
| **AWS_SECRET_ACCESS_KEY** | AWS Secret Key | | |
| **AWS_SESSION_TOKEN** | AWS Session Token (when using STS temporary keys) | | |
| **SQS_ENDPOINT** | SQS Endpoint | | `http://queue.middleware.svc.cluster.local:9324` |
| **DIAGNOSIS_WPSCAN_QUEUE_NAME** | WPScan queue name | | `diagnosis-wpscan` |
| **DIAGNOSIS_WPSCAN_QUEUE_URL** | WPScan queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/diagnosis-wpscan` |
| **DIAGNOSIS_PORTSCAN_QUEUE_NAME** | Portscan queue name | | `diagnosis-portscan` |
| **DIAGNOSIS_PORTSCAN_QUEUE_URL** | Portscan queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/diagnosis-portscan` |
| **DIAGNOSIS_APPLICATION_SCAN_QUEUE_NAME** | Application scan queue name | | `diagnosis-applicationscan` |
| **DIAGNOSIS_APPLICATION_SCAN_QUEUE_URL** | Application scan queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/diagnosis-applicationscan` |

### Parameter Store location (example)

The parameters are saved under the following path:

- `/env/diagnosis/common`

## Portscan service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Enable DEBUG level logging | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Maximum number of messages to process in parallel | | `10` |
| **WAIT_TIME_SECOND** | Time interval for dequeueing (seconds) | | `20` |

### Parameter Store location (example)

The parameters are saved under the following path:

- `/env/diagnosis/portscan`

## WPScan service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Enable DEBUG level logging | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Maximum number of messages to process in parallel | | `10` |
| **WAIT_TIME_SECOND** | Time interval for dequeueing (seconds) | | `20` |
| **WPSCAN_VULNDB_APIKEY** | API key for WPScan (required for paid plans) | | |

### Parameter Store location (example)

The parameters are saved under the following path:

- `/env/diagnosis/portscan`

## Application scan service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Enable DEBUG level logging | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Maximum number of messages to process in parallel | | `10` |
| **WAIT_TIME_SECOND** | Time interval for dequeueing (seconds) | | `20` |

### Parameter Store location (example)

The parameters are saved under the following path:

- `/env/diagnosis/applicationscan`