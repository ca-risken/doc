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
| **FINDING_SVC_ADDR** | Findingサービスアドレス | | `finding.core.svc.cluster.local:8001` |
| **IAM_SVC_ADDR** | IAMサービスアドレス | | `iam.core.svc.cluster.local:8002` |
| **PROJECT_SVC_ADDR** | Projectサービスアドレス | | `project.core.svc.cluster.local:8003` |
| **ALERT_SVC_ADDR** | Alertサービスアドレス | | `alert.core.svc.cluster.local:8004` |
| **REPORT_SVC_ADDR** | Reportサービスアドレス | | `report.core.svc.cluster.local:8005` |
| **AWS_SVC_ADDR** | AWSサービスアドレス | | `aws.aws.svc.cluster.local:9001` |
| **AWS_ACTIVITY_SVC_ADDR** | AWS Actibityサービスアドレス | | `activity.aws.svc.cluster.local:9007` |
| **OSINT_SVC_ADDR** | OSINTサービスアドレス | | `osint.osint.svc.cluster.local:18081` |
| **DIAGNOSIS_SVC_ADDR** | Diagnosisサービスアドレス | | `diagnosis.diagnosis.svc.cluster.local:19001` |
| **CODE_SVC_ADDR** | Codeサービスアドレス | | `code.code.svc.cluster.local:10001` |
| **GOOGLE_SVC_ADDR** | Googleサービスアドレス | | `google.google.svc.cluster.local:11001` |

## その他

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **TZ** | サーバータイムゾーン（ログの出力日付等） | | `Asia/Tokyo` |
| **ENV_NAME** | 環境ごとの識別子（Observability関連で利用） | | `local` |
| **AWS_XRAY_SDK_DISABLED** | XRAYの無効化 | | `true` |
| **AWS_XRAY_CONTEXT_MISSING** | XRAYのコンテキストパラメータが存在しない場合の挙動 | | `LOG_ERROR` |

## Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/common/`
