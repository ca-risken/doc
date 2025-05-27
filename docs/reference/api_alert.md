# Alert API

The Alert API allows to manage and control the alert data, including alerts, alert conditions, alert rules, and notifications.

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
    'https://{your-site}/api/v1/alert/list-alert/?project_id=1001'
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
    'https://{your-site}/api/v1/alert/get-alert/?project_id=1001&alert_id=1001'
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

List alert history by the various conditions.

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
'https://{your-site}/api/v1/alert/list-history/?project_id=1001&alert_id=1001'

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

List alert conditions by the various conditions.

### Endpoint

```yaml
GET: /alert/list-condition/
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
    'https://{your-site}/api/v1/alert/list-condition/?project_id=1001&enabled=true'
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

Create or update an alert condition.

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
    'https://{your-site}/api/v1/alert/put-condition/'
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

Delete an alert condition.

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
    'https://{your-site}/api/v1/alert/delete-condition/'
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
    'https://{your-site}/api/v1/alert/list-rule/?project_id=1001&from_score=1.0'
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

Create or update an alert rule.

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
    'https://{your-site}/api/v1/alert/put-rule/'
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

Delete an alert rule.

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
    'https://{your-site}/api/v1/alert/delete-rule/'
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

List notifications by the various conditions.

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
    'https://{your-site}/api/v1/alert/list-notification/?project_id=1001&type=slack'
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

Create or update a notification.

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
    'https://{your-site}/api/v1/alert/put-notification/'
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

Delete a notification.

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
    'https://{your-site}/api/v1/alert/delete-notification/'
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

List alert condition rules by the various conditions.

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
    'https://{your-site}/api/v1/alert/list-condition_rule/?project_id=1001'

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

Create or update a relationship between an alert condition and an alert rule.

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
    'https://{your-site}/api/v1/alert/put-condition_rule/'
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

Delete a relationship between an alert condition and an alert rule.

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
    'https://{your-site}/api/v1/alert/delete-condition_rule/'
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

List alert condition notifications by the various conditions.

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
    'https://{your-site}/api/v1/alert/list-condition_notification/?project_id=1001'

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

Create or update a relationship between an alert condition and a notification.

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
    'https://{your-site}/api/v1/alert/put-condition_notification/'
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

## DeleteConditionNotification

Delete a relationship between an alert condition and a notification.

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
    'https://{your-site}/api/v1/alert/delete-condition_notification/'
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

Analyze alerts based on alert conditions.

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
    'https://{your-site}/api/v1/alert/analyze-alert/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```
---

## PutAlert

Create or update an alert.

### Endpoint

```yaml
POST: /alert/put-alert/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `alert.alert_id` | number | body | | |
| `alert.alert_condition_id` | number | body | yes | |
| `alert.description` | string | body | | |
| `alert.severity` | string | body | | `high`, `medium`, `low` |
| `alert.project_id` | number | body | yes | |
| `alert.status` | number | body | | `1`: active, `2`: deactive |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "alert":{"alert_condition_id":1001, "description":"test alert", "severity":"high", "project_id":1001, "status":1}}' \
    'https://{your-site}/api/v1/alert/put-alert/'
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
            "description": "test alert",
            "severity": "high",
            "project_id": 1001,
            "status": 1,
            "created_at": 1629337534,
            "updated_at": 1629337534
        }
    }
}
```

---

## PutAlertFirstViewedAt

Update the first viewed timestamp of an alert.

### Endpoint

```yaml
POST: /alert/put-alert-first-viewed-at/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `alert_id` | number | body | yes | |
| `first_viewed_at` | number | body | | UNIX time |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "alert_id":1001, "first_viewed_at":1629337534}' \
    'https://{your-site}/api/v1/alert/put-alert-first-viewed-at/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListRelAlertFinding

List relationships between alerts and findings.

### Endpoint

```yaml
GET: /alert/list-rel_alert_finding/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `alert_id` | number | query | | |
| `finding_id` | number | query | | |
| `from_at` | number | query | | UNIX time |
| `to_at` | number | query | | UNIX time |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/alert/list-rel_alert_finding/?project_id=1001&alert_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "rel_alert_finding": [
            {
                "alert_id": 1001,
                "finding_id": 1001,
                "project_id": 1001,
                "created_at": 1629337534,
                "updated_at": 1629337534
            },
            {
                "alert_id": 1001,
                "finding_id": 1002,
                "project_id": 1001,
                "created_at": 1629337534,
                "updated_at": 1629337534
            }
        ]
    }
}
```

---

## TestNotification

Test a notification by sending a test message.

### Endpoint

```yaml
POST: /alert/test-notification/
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
    --data '{"project_id":1001, "notification_id":1001}' \
    'https://{your-site}/api/v1/alert/test-notification/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## RequestProjectRoleNotification

Request a notification for project role changes.

### Endpoint

```yaml
POST: /alert/request-project-role-notification/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `email` | string | body | yes | |
| `role` | string | body | yes | `admin`, `operator`, `viewer` |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "email":"user@example.com", "role":"admin"}' \
    'https://{your-site}/api/v1/alert/request-project-role-notification/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```
