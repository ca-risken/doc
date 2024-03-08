# Common Parameters

RISKENのサービス共通のパラメータです

## DB

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **DB_MASTER_HOST** | DB(Master)のホスト名 | | `db.middleware.svc.cluster.local` |
| **DB_MASTER_USER** | DB(Master)のユーザ名 | | `hoge` |
| **DB_MASTER_PASSWORD** | DB(Master)のパスワード | | `moge` |
| **DB_SLAVE_HOST** | DB(Slave)のホスト名 | | `db.middleware.svc.cluster.local` |
| **DB_SLAVE_USER** | DB(Slave)のユーザ名 | | `hoge` |
| **DB_SLAVE_PASSWORD** | DB(Slave)のパスワード | | `moge` |
| **DB_SCHEMA** | DBスキーマ | | `mimosa` |
| **DB_PORT** | DBポート | | `3306` |
| **DB_LOG_MODE** | DBログモード | | `false` |

## MicroServicies（gRPC）

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **CORE_SVC_ADDR** | Coreサービスアドレス | | `core.core.svc.cluster.local:8080` |
| **DATA_SOURCE_API_SVC_ADDR** | DataSourceAPIサービスアドレス | | `datasource-api.datasource.svc.cluster.local:8081` |

## その他

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **TZ** | サーバータイムゾーン（ログの出力日付等） | | `Asia/Tokyo` |
| **ENV_NAME** | 環境ごとの識別子（Observability関連で利用） | | `local` |
| **SLACK_API_TOKEN** | Slack Appの[Botトークン](https://api.slack.com/authentication/token-types#bot) （`xoxb-` で始まる形式） | | |

???+ info "Slack Appの準備"
    SlackAPITokenを設定することでSlackApp経由の通知が可能になります。
    Slack Appの作成は[公式ドキュメント :octicons-link-external-24:](https://api.slack.com/reference){ target="_blank" }を参照してください。
    また、通知に必要なパーミッションとして [chat:write :octicons-link-external-24:](https://api.slack.com/scopes/chat:write){ target="_blank" }が必要になります。

## Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/common/`
