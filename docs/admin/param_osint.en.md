# OSINT Parameters

These are the parameters for OSINT.

## OSINT Common

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_REGION** | AWS region | | `ap-northeast-1` |
| **AWS_ACCESS_KEY_ID** | AWS access key ID | | |
| **AWS_SECRET_ACCESS_KEY** | AWS secret key | | |
| **AWS_SESSION_TOKEN** | AWS session token (when using STS temporary keys) | | |
| **SQS_ENDPOINT** | SQS endpoint | | `http://queue.middleware.svc.cluster.local:9324` |
| **OSINT_SUBDOMAIN_QUEUE_NAME** | OSINT Subdomain queue name | | `osint-subdomain` |
| **OSINT_SUBDOMAIN_QUEUE_URL** | OSINT Subdomain queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/osint-subdomain` |
| **OSINT_WEBSITE_QUEUE_NAME** | OSINT Website queue name | | `osint-website` |
| **OSINT_WEBSITE_QUEUE_URL** | OSINT Website queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/osint-website` |

### Parameter Store path (example)

The parameters are saved under the following path:

- `/env/osint/common`

## Subdomain Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **MAX_NUMBER_OF_MESSAGE** | The maximum number of messages to process concurrently | | `5` |
| **WAIT_TIME_SECOND** | The time interval for dequeuing (in seconds) | | `20` |
| **INSPECT_CONCURRENCY** | The number of concurrent scans | | `50` |

### Parameter Store path (example)

The parameters are saved under the following path:

- `/env/osint/subdomain`

## Website Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **MAX_NUMBER_OF_MESSAGE** | The maximum number of messages to process concurrently | | `5` |
| **WAIT_TIME_SECOND** | The time interval for dequeuing (in seconds) | | `20` |

### Parameter Store path (example)

The parameters are saved under the following path:

- `/env/osint/website`