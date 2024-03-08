# Common Parameters

These are the common parameters for RISKEN's services.

## DB

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DB_MASTER_HOST** | Hostname of the DB (Master). | | `db.middleware.svc.cluster.local` |
| **DB_MASTER_USER** | Username of the DB (Master). | | `hoge` |
| **DB_MASTER_PASSWORD** | Password of the DB (Master). | | `moge` |
| **DB_SLAVE_HOST** | Hostname of the DB (Slave). | | `db.middleware.svc.cluster.local` |
| **DB_SLAVE_USER** | Username of the DB (Slave). | | `hoge` |
| **DB_SLAVE_PASSWORD** | Password of the DB (Slave). | | `moge` |
| **DB_SCHEMA** | DB schema. | | `mimosa` |
| **DB_PORT** | DB port. | | `3306` |
| **DB_LOG_MODE** | DB log mode. | | `false` |

## Microservices (gRPC)

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **CORE_SVC_ADDR** | Core service address. | | `core.core.svc.cluster.local:8080` |
| **DATA_SOURCE_API_SVC_ADDR** | DataSourceAPI service address. | | `datasource-api.datasource.svc.cluster.local:8081` |

## Others

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **TZ** | Server timezone (for output date in logs, etc.). | | `Asia/Tokyo` |
| **ENV_NAME** | Identifier for each environment (used in observability). | | `local` |
| **SLACK_API_TOKEN** | The [Bot Token](https://api.slack.com/authentication/token-types#bot) for the Slack App (in the format starting with `xoxb-`) | | |

???+ info "Preparing the Slack App"
    By setting the Slack API Token, it becomes possible to send notifications via the Slack App.
    To create a Slack App, please refer to the [official documentation :octicons-link-external-24:](https://api.slack.com/reference){ target="_blank" }.
    Additionally, the permission required for notifications is [chat:write :octicons-link-external-24:](https://api.slack.com/scopes/chat:write){ target="_blank" }.

## Parameter Store Storage Location (Example)

Parameters are stored under the following path:

- `/env/common/`