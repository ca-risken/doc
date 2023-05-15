# AWS Parameters

These are AWS parameters.

## AWS Common

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_REGION** | AWS region | | `ap-northeast-1` |
| **AWS_ACCESS_KEY_ID** | AWS access key ID | | |
| **AWS_SECRET_ACCESS_KEY** | AWS secret key | | |
| **AWS_SESSION_TOKEN** | AWS session token (if using STS temporary key) | | |
| **SQS_ENDPOINT** | SQS endpoint | | `http://queue.middleware.svc.cluster.local:9324` |
| **AWS_GUARD_DUTY_QUEUE_NAME** | AWS GuardDuty queue name | | `aws-guardduty` |
| **AWS_GUARD_DUTY_QUEUE_URL** | AWS GuardDuty queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-guardduty` |
| **AWS_ACCESS_ANALYZER_QUEUE_NAME** | AWS AccessAnalyzer queue name | | `aws-accessanalyzer` |
| **AWS_ACCESS_ANALYZER_QUEUE_URL** | AWS AccessAnalyzer queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-accessanalyzer` |
| **AWS_ADMIN_CHECKER_QUEUE_NAME** | AWS AdminChecker queue name | | `aws-adminchecker` |
| **AWS_ADMIN_CHECKER_QUEUE_URL** | AWS AdminChecker queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-adminchecker` |
| **AWS_CLOUDSPLOIT_QUEUE_NAME** | AWS CloudSploit queue name | | `aws-cloudsploit` |
| **AWS_CLOUDSPLOIT_QUEUE_URL** | AWS CloudSploit queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-cloudsploit` |
| **AWS_PORTSCAN_QUEUE_NAME** | AWS Portscan queue name | | `aws-portscan` |
| **AWS_PORTSCAN_QUEUE_URL** | AWS Portscan queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/aws-portscan` |

### Parameter Store Storage Example

Save parameters under the following path:

- `/env/aws/common`

## AccessAnalyzer Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Activate DEBUG level logs | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Number of messages to process concurrently at once | | `10` |
| **WAIT_TIME_SECOND** | Dequeue interval in seconds | | `20` |

### Parameter Store Storage Example

Save parameters under the following path:

- `/env/aws/access-analyzer`

## AdminChecker Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Activate DEBUG level logs | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Number of messages to process concurrently at once | | `10` |
| **WAIT_TIME_SECOND** | Dequeue interval in seconds | | `20` |

### Parameter Store Storage Example

Save parameters under the following path:

- `/env/aws/admin-checker`


## CloudSploit Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Enable DEBUG level logs | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Maximum number of queue messages to process in parallel | | `5` |
| **WAIT_TIME_SECOND** | Dequeue time interval in seconds | | `20` |

### Parameter Store Location (Example)

Parameters are stored under the following path:

- `/env/aws/cloudsploit`

## GuardDuty Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Enable DEBUG level logs | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Maximum number of queue messages to process in parallel | | `10` |
| **WAIT_TIME_SECOND** | Dequeue time interval in seconds | | `20` |

### Parameter Store Location (Example)

Parameters are stored under the following path:

- `/env/aws/guard-duty`

## Portscan Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Enable DEBUG level logs | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Maximum number of queue messages to process in parallel | | `10` |
| **WAIT_TIME_SECOND** | Dequeue time interval in seconds | | `20` |
| **SCAN_EXCLUDE_PORT_NUMBER** | The limit of the range of port numbers to be scanned (ports over this number will not be scanned) | | `1000` |
| **SCAN_CONCURRENCY** | Number of concurrent scans | | `5` |

### Parameter Store Location (Example)

Parameters are stored under the following path:

- `/env/aws/portscan`
