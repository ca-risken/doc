# Code Parameters

These are the parameters for Code.

## Common Parameters

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_REGION** | AWS Region | | `ap-northeast-1` |
| **AWS_ACCESS_KEY_ID** | AWS Access Key ID | | |
| **AWS_SECRET_ACCESS_KEY** | AWS Secret Access Key | | |
| **AWS_SESSION_TOKEN** | AWS Session Token (when using STS temporary keys) | | |
| **SQS_ENDPOINT** | SQS endpoint | | `http://queue.middleware.svc.cluster.local:9324` |
| **CODE_DATA_KEY** | Encryption key for GitHub credentials | | |
| **GITHUB_DEFAULT_TOKEN** | Default GitHub token | | `your-token-here`|
| **CODE_GITLEAKS_QUEUE_NAME** | Gitleaks queue name | | `code-gitleaks` |
| **CODE_GITLEAKS_QUEUE_URL** | Gitleaks queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/code-gitleaks` |
| **CODE_DEPENDENCY_QUEUE_NAME** | Dependency queue name | | `code-dependency` |
| **CODE_DEPENDENCY_QUEUE_URL** | Dependency queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/code-dependency` |

### Parameter Store location (example)

Save the parameters under the following path:

- `/env/code/common`

## Gitleaks Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Enable DEBUG level logs | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Number of queue messages to process concurrently | | `10` |
| **WAIT_TIME_SECOND** | Interval for dequeuing (in seconds) | | `20` |
| **LIMIT_REPOSITORY_SIZE_KB** | Limit value for repository size during Gitleaks scan | | `500000` |
| **REDACT** | Mask detected secret information and store it on the RISKNEN side | | `true` |

### Parameter Store location (example)

Save the parameters under the following path:

- `/env/code/gitleaks`

## Dependency Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Enable DEBUG level logs | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Number of queue messages to process concurrently | | `10` |
| **WAIT_TIME_SECOND** | Interval for dequeuing (in seconds) | | `20` |
| **LIMIT_REPOSITORY_SIZE_KB** | Limit value for repository size during Dependency scan | | `500000` |

### Parameter Store location (example)

Save the parameters under the following path:

- `/env/code/dependency`