# Alert API

The Alert API allows to manage and control the alert data.

---

## ListAlert

List alert by the various conditions.

### Endpoint

```yaml
GET: /alert/list-alert/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `status` | []number | query | | `1`: active, `2`: deactive |
| `severity` | []string | query | | `high`, `medium`, `low` |
| `description` | string | query | | |
| `from_at` | number | query | | unix time |
| `to_at` | number | query | | unix time |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://api.security-hub.jp/api/v1/alert/list-alert/?project_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "alert": [
            {
                "alert_id": 1001,
                "alert_condition_id": 1001,
                "description": "description",
                "severity": "low",
                "project_id": 1002,
                "status": 2,
                "created_at": 1604893439,
                "updated_at": 1629853210
            }
        ]
    }
}
```

---

## GetAlert

Get alert data by the various conditions.

### Endpoint

```yaml
GET: /alert/get-alert/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `alert_id` | number | query | yes | |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://api.security-hub.jp/api/v1/alert/get-alert/?project_id=1001&alert_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "alert": {
      "alert_id": 1001,
      "alert_condition_id": 1001,
      "description": "test_alert_condition",
      "severity": "high",
      "project_id": 1001,
      "status": 1,
      "created_at": 1629337534,
      "updated_at": 1629939609
    }
  }
}
```

---

## ListAlertHistory

### Endpoint

```yaml
GET: /alert/list-history/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `alert_id` | number | query | yes | |
| `history_type` | string | query | | `created`, `updated`, `deleted` |
| `severity` | string | query | | `high`, `medium`, `low` |
| `from_at` | number | query | | UNIX time |
| `to_at` | number | query | | UNIX time|

### Code sample

```bash
curl -XGET \
--header 'Authorization: Bearer xxx' \
'https://api.security-hub.jp/api/v1/alert/list-history/?project_id=1001&alert_id=1001'

```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "alert_history": [
            {
                "alert_history_id": 1011,
                "history_type": "updated",
                "alert_id": 1001,
                "description": "test_alert_condition",
                "severity": "high",
                "finding_history": "{\"finding_id\": [1001, 1003]}",
                "project_id": 1001,
                "created_at": 1629479367,
                "updated_at": 1629479367
            },
            {
                "alert_history_id": 1002,
                "history_type": "deleted",
                "alert_id": 1001,
                "description": "test_alert_history_2",
                "severity": "high",
                "finding_history": "{\"finding_id\": []}",
                "project_id": 1001,
                "created_at": 1629337534,
                "updated_at": 1629337534
            },
            {
                "alert_history_id": 1001,
                "history_type": "created",
                "alert_id": 1001,
                "description": "test_alert_history",
                "severity": "high",
                "finding_history": "{\"finding_id\": [1001, 1002, 1003, 1004, 1005, 1006]}",
                "project_id": 1001,
                "created_at": 1629337534,
                "updated_at": 1629337534
            }
        ]
    }
}
```

---

## ListCondition

### Endpoint

```yaml
GET: /alert/list-alert-condition/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `severity` | []string | query | | `high`, `medium`, `low` |
| `enabled` | bool | query | | |
| `from_at` | number | query | | UNIX time |
| `to_at` | number | query | | UNIX time|

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://api.security-hub.jp/api/v1/alert/list-condition/?project_id=1001&enabled=true'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "alert_condition": [
            {
                "alert_condition_id": 1001,
                "description": "test_alert_condition",
                "severity": "high",
                "project_id": 1001,
                "and_or": "and",
                "enabled": true,
                "created_at": 1629337534,
                "updated_at": 1629337534
            }
        ]
    }
}
```

---

## PutCondition

### Endpoint

```yaml
POST: /alert/put-condition/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `alert_condition.alert_condition_id` | number | body | | |
| `alert_condition.description` | string | body | | |
| `alert_condition.severity` | string | body | | `high`, `medium`, `low` |
| `alert_condition.project_id` | number | body | | |
| `alert_condition.and_or` | string | body | | `and`, `or` |
| `alert_condition.enabled` | bool | body | | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "alert_condition":{"alert_condition_id":1001, "description":"update", "severity":"high", "project_id":1001, "and_or":"and", "enabled":true}}' \
    'https://api.security-hub.jp/api/v1/alert/put-condition/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "alert_condition": {
            "alert_condition_id": 1001,
            "description": "update",
            "severity": "high",
            "project_id": 1001,
            "and_or": "and",
            "enabled": true,
            "created_at": 1629337534,
            "updated_at": 1629971952
        }
    }
}
```

---

## DeleteCondition

### Endpoint

```yaml
POST: /alert/delete-condition/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `alert_condition_id` | number | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "alert_condition_id":1003}' \
    'https://api.security-hub.jp/api/v1/alert/delete-condition/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListRule

### Endpoint

```yaml
GET: /alert/list-rule/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `from_score` | float | query | | |
| `to_score` | float | query | | |
| `from_at` | number | query | | UNIX time |
| `to_at` | number | query | | UNIX time |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://api.security-hub.jp/api/v1/alert/list-rule/?project_id=1001&from_score=1.0'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "alert_rule": [
            {
                "alert_rule_id": 1001,
                "name": "test_alert_rule",
                "project_id": 1001,
                "score": 1,
                "finding_cnt": 1,
                "created_at": 1629337534,
                "updated_at": 1629337534
            },
            {
                "alert_rule_id": 1002,
                "name": "test_alert_rule_2",
                "project_id": 1001,
                "score": 1,
                "resource_name": "test",
                "finding_cnt": 1,
                "created_at": 1629337534,
                "updated_at": 1629337534
            }
        ]
    }
}
```

---

## PutRule

### Endpoint

```yaml
POST: /alert/put-rule/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `alert_rule.alert_rule_id` | number | body | | |
| `alert_rule.name` | string | body | yes | |
| `alert_rule.project_id` | number | body | yes | |
| `alert_rule.score` | number | body | | `0.0` ~ `1.0` |
| `alert_rule.resource_name` | string | body | | |
| `alert_rule.tag` | string | body | | |
| `alert_rule.finding_cnt` | number | body | | 1 ~ |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "alert_rule":{"name":"over 0.5", "project_id":1001, "score":0.5, "finding_cnt":1}}' \
    'https://api.security-hub.jp/api/v1/alert/put-rule/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "alert_rule": {
            "alert_rule_id": 1003,
            "name": "over 0.5",
            "project_id": 1001,
            "score": 0.5,
            "finding_cnt": 1,
            "created_at": 1629972654,
            "updated_at": 1629972654
        }
    }
}
```

---

## DeleteRule

### Endpoint

```yaml
POST: /alert/delete-rule/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `alert_rule_id` | number | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "alert_rule_id":1003}' \
    'https://api.security-hub.jp/api/v1/alert/delete-rule/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListNotification

### Endpoint

```yaml
GET: /alert/list-notification/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `type` | string | query | | `slack` |
| `from_at` | number | query | | UNIX time |
| `to_at` | number | query | | UNIX time |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://api.security-hub.jp/api/v1/alert/list-notification/?project_id=1001&type=slack'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "notification": [
            {
                "notification_id": 1001,
                "name": "test_notification",
                "project_id": 1001,
                "type": "slack",
                "notify_setting": "{\"webhook_url\":\"http://hogeh************\",\"data\":null}",
                "created_at": 1629337534,
                "updated_at": 1629337534
            },
            {
                "notification_id": 1002,
                "name": "test_notification_2",
                "project_id": 1001,
                "type": "slack",
                "notify_setting": "{\"webhook_url\":\"http://hogeho*************\",\"data\":null}",
                "created_at": 1629337534,
                "updated_at": 1629337534
            }
        ]
    }
}
```

---

## PutNotification

### Endpoint

```yaml
POST: /alert/put-notification/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `notification.notification_id` | number | body | | |
| `notification.name` | string | body | yes | |
| `notification.project_id` | number | body | yes | |
| `notification.type` | string | body | | `slack` |
| `notification.notify_setting` | string | body | | Must JSON, must set key `webhook_url` for slack type |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001,"notification":{"name":"#channel","type":"slack","notify_setting":"{\"webhook_url\":\"https://your-webhook\",\"data\":{\"channel\":\"\",\"message\":\"\"}}","project_id":1001}}' \
    'https://api.security-hub.jp/api/v1/alert/put-notification/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "notification": {
            "notification_id": 1004,
            "name": "#channel",
            "project_id": 1001,
            "type": "slack",
            "notify_setting": "{\"webhook_url\":\"https://yo**********\",\"data\":{\"channel\":\"\",\"message\":\"\"}}",
            "created_at": 1629973390,
            "updated_at": 1629973390
        }
    }
}
```

---

## DeleteNotification

### Endpoint

```yaml
POST: /alert/delete-notification/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `notification_id` | number | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "notification_id":1004}' \
    'https://api.security-hub.jp/api/v1/alert/delete-notification/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListConditionRule

### Endpoint

```yaml
GET: /alert/list-condition_rule/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `alert_condition_id` | number | query | | |
| `alert_rule_id` | number | query | | |
| `from_at` | number | query | | UNIX time |
| `to_at` | number | query | | UNIX time |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://api.security-hub.jp/api/v1/alert/list-condition_rule/?project_id=1001'

```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "alert_cond_rule": [
            {
                "alert_condition_id": 1001,
                "alert_rule_id": 1001,
                "project_id": 1001,
                "created_at": 1629337534,
                "updated_at": 1629337534
            },
            {
                "alert_condition_id": 1002,
                "alert_rule_id": 1002,
                "project_id": 1001,
                "created_at": 1629337534,
                "updated_at": 1629337534
            }
        ]
    }
}
```

---

## PutConditionRule

### Endpoint

```yaml
POST: /alert/put-condition_rule/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `alert_cond_rule.alert_condition_id` | number | body | yes | |
| `alert_cond_rule.alert_rule_id` | number | body | yes | |
| `alert_cond_rule.project_id` | number | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "alert_cond_rule":{"alert_condition_id":1001, "alert_rule_id": 1001, "project_id": 1001}}' \
    'https://api.security-hub.jp/api/v1/alert/put-condition_rule/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "alert_cond_rule": {
            "alert_condition_id": 1001,
            "alert_rule_id": 1001,
            "project_id": 1001,
            "created_at": 1629337534,
            "updated_at": 1629974029
        }
    }
}
```

---

## DeleteConditionRule

### Endpoint

```yaml
POST: /alert/delete-condition_rule/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `alert_condition_id` | number | body | yes | |
| `alert_rule_id` | number | body | yes | |
| `project_id` | number | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"alert_condition_id":1001, "alert_rule_id": 1001, "project_id": 1001}' \
    'https://api.security-hub.jp/api/v1/alert/delete-condition_rule/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListConditionNotification

### Endpoint

```yaml
GET: /alert/list-condition_notification/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `alert_condition_id` | number | query | | |
| `notification_id` | number | query | | |
| `from_at` | number | query | | UNIX time |
| `to_at` | number | query | | UNIX time |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://api.security-hub.jp/api/v1/alert/list-condition_notification/?project_id=1001'

```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "alert_cond_notification": [
            {
                "alert_condition_id": 1001,
                "notification_id": 1001,
                "project_id": 1001,
                "cache_second": 1800,
                "notified_at": 1629939609,
                "created_at": 1629337534,
                "updated_at": 1629939609
            },
            {
                "alert_condition_id": 1002,
                "notification_id": 1002,
                "project_id": 1001,
                "cache_second": 1800,
                "notified_at": 1599030000,
                "created_at": 1629337534,
                "updated_at": 1629337534
            }
        ]
    }
}
```

---

## PutConditionNotification

### Endpoint

```yaml
POST: /alert/put-condition_notification/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `alert_cond_notification.alert_condition_id` | number | body | yes | |
| `alert_cond_notification.notification_id` | number | body | yes | |
| `alert_cond_notification.project_id` | number | body | yes | |
| `alert_cond_notification.cache_second` | number | body | | |
| `alert_cond_notification.notified_at` | number | body | | UNIX time |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "alert_cond_notification":{"alert_condition_id":1001, "notification_id": 1001, "project_id": 1001, "cache_second":3600, "notified_at":0}}' \
    'https://api.security-hub.jp/api/v1/alert/put-condition_notification/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "alert_cond_notification": {
            "alert_condition_id": 1001,
            "notification_id": 1001,
            "project_id": 1001,
            "cache_second": 3600,
            "created_at": 1629337534,
            "updated_at": 1629974613
        }
    }
}
```

---

## DleteConditionNotification

### Endpoint

```yaml
POST: /alert/delete-condition_notification/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `alert_condition_id` | number | body | yes | |
| `notification_id` | number | body | yes | |
| `project_id` | number | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"alert_condition_id":1001, "notification_id": 1001, "project_id": 1001}' \
    'https://api.security-hub.jp/api/v1/alert/delete-condition_notification/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## AnalyzeAlert

### Endpoint

```yaml
POST: /alert/analyze-alert/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `alert_condition_id` | []number | body | | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "alert_condition_id":[1001,1002]}' \
    'https://api.security-hub.jp/api/v1/alert/analyze-alert/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```
