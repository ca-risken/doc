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
| **CORE_SVC_ADDR** | Coreサービスアドレス | | `ccore.core.svc.cluster.local:8080` |
| **DATA_SOURCE_API_SVC_ADDR** | DataSourceAPIサービスアドレス | | `datasource-api.core.svc.cluster.local:8081` |
| **AWS_ACTIVITY_SVC_ADDR** | AWS Actibityサービスアドレス | | `activity.aws.svc.cluster.local:9007` |

## その他

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **TZ** | サーバータイムゾーン（ログの出力日付等） | | `Asia/Tokyo` |
| **ENV_NAME** | 環境ごとの識別子（Observability関連で利用） | | `local` |

## Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/common/`
