# Azure Parameters

Parameters for Azure

## Azure Common

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_REGION** | AWS Region | | `ap-northeast-1` |
| **AWS_ACCESS_KEY_ID** | AWS access key ID | | |
| **AWS_SECRET_ACCESS_KEY** | AWS sercret key | | |
| **AWS_SESSION_TOKEN** | AWS session token (if using STS temporary key) | | |
| **SQS_ENDPOINT** | SQS endpoint | | `http://queue.middleware.svc.cluster.local:9324` |
| **GOOGLE_PROWLER_QUEUE_NAME** | Azure Prowler queue name | | `azure-prowler` |
| **GOOGLE_PROWLER_QUEUE_URL** | Azure Prowler queue URL | | `http://queue.middleware.svc.cluster.local:9324/queue/azure-prowler` |

### Parameter Store Storage Example

Save parameters under the following path:

- `/env/azure/common`

## Prowler Service

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DEBUG** | Activate DEBUG level logs | | `false` |
| **MAX_NUMBER_OF_MESSAGE** | Number of messages to process concurrently at once | | `10` |
| **WAIT_TIME_SECOND** | Dequeue interval in seconds | | `20` |
| **AZURE_CLIENT_ID** | Azure Service Principal client ID | yes | |
| **AZURE_CLIENT_SECRET** | Azure Service Principal client sercret | yes | |
| **AZURE_TENANT_ID** | Azure Service Principal tenant ID | yes | |

### Parameter Store Storage Example

Save parameters under the following path:

- `/env/azure/prowler`

