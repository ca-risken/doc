# Core Parameters

Coreのパラメータです

## Findingサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | ポート番号 | | `8001` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/core/finding`

## IAMサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | ポート番号 | | `8002` |
| **DEBUG** | DEBUGレベルのログ | | `false` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/core/iam`

## Projectサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | ポート番号 | | `8003` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/core/project`

## Alertサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | ポート番号 | | `8004` |
| **NOTIFICATION_ALERT_URL** | アラートのメッセージ内に埋め込まれるリンクURL | | `http://localhost` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/core/alert`

## Reportサービス

### Parameters

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **PORT** | ポート番号 | | `8005` |

### Parameter Store保存先（例）

以下のPath配下にパラメータを保存

- `/env/core/report`

