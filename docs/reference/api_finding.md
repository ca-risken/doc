# Finding API

The Finding API allows to manage and control the resource and finding data.

---

## ListFinding

List findings by the various conditions.

### Endpoint

```yaml
GET: /finding/list-finding/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `data_source` | []string | query | | |
| `resource_name` | []string | query | | |
| `from_score` | float | query | | |
| `to_score` | float | query | | |
| `tag` | string | query | | |
| `sort` | string | query | | `finding_id`, `description`, `data_source`, `resource_name`, `score`, `updated_at` |
| `direction` | string | query | | `asc`, `desc` |
| `offset` | number | query | | |
| `limit` | number | query | | |
| `status` | number | query | | `1`: active, `2`: pending  |
| `finding_id` | number | query | | |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://api.security-hub.jp/api/v1/finding/list-finding/?project_id=1002&data_source=osint:subdomain,aws:cloudsploit'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "finding_id": [
      1011,
      1012,
      124607,
      124608
    ],
    "count": 4,
    "total": 4
  }
}
```

---

## GetFinding

Get finding data.

### Endpoint

```yaml
GET: /finding/get-finding/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `finding_id` | number | query | yes | |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://api.security-hub.jp/api/v1/finding/get-finding/?project_id=1001&finding_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "finding": {
      "finding_id": 1001,
      "description": "desc-1001",
      "data_source": "aws:guard-duty",
      "data_source_id": "guard-duty-0001",
      "resource_name": "arn:aws:s3:::example-bucket",
      "project_id": 1001,
      "original_score": 100,
      "score": 1,
      "data": "{\"data\": {\"key\": \"value\"}}",
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## PutFinding

Insert or update the finding data.

### Endpoint

```yaml
POST: /finding/put-finding/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `finding.description` | string | body | yes | |
| `finding.data_source` | string | body | yes | |
| `finding.data_source_id` | string | body | yes | |
| `finding.resource_name` | string | body | yes | |
| `finding.original_score` | number | body | yes | |
| `finding.original_max_score` | number | body | yes | |
| `finding.data` | string | body | yes | must JSON format |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "finding":{"description":"desc", "data_source":"ds", "data_source_id":"ds-004", "resource_name":"rn", "project_id":1001, "original_score":55.51, "original_max_score":100.0, "data":"{\"key\":\"value\"}"}}' \
    'https://api.security-hub.jp/api/v1/finding/put-finding/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "finding": {
            "finding_id": 1042,
            "description": "desc",
            "data_source": "ds",
            "data_source_id": "ds-004",
            "resource_name": "rn",
            "project_id": 1001,
            "original_score": 55.51,
            "score": 0.56,
            "data": "{\"key\": \"value\"}",
            "created_at": 1629947204,
            "updated_at": 1629947204
        }
    }
}
```

---

## DeleteFinding

Delete the finding data.

### Endpoint

```yaml
POST: /finding/delete-finding/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `finding_id` | number | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "finding_id":1042}' \
    'https://api.security-hub.jp/api/v1/finding/delete-finding/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListFindingTag

### Endpoint

```yaml
GET: /finding/list-finding-tag/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `finding_id` | number | query | | |
| `sort` | string | query | | `finding_id`, `description`, `data_source`, `resource_name`, `score`, `updated_at` |
| `direction` | string | query | | `asc`, `desc` |
| `offset` | number | query | | |
| `limit` | number | query | | |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://api.security-hub.jp/api/v1/finding/list-finding-tag/?project_id=1001&finding_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "tag": [
      {
        "finding_tag_id": 1001,
        "finding_id": 1001,
        "project_id": 1001,
        "tag": "tag",
        "created_at": 1629337534,
        "updated_at": 1629337534
      },
      {
        "finding_tag_id": 1002,
        "finding_id": 1001,
        "project_id": 1001,
        "tag": "tag:key",
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ],
    "count": 2,
    "total": 2
  }
}

```

---

## TagFinding

### Endpoint

```yaml
POST: /finding/tag-finding/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `tag.finding_id` | number | body | yes | |
| `tag.project_id` | number | body | yes | |
| `tag.tag` | string | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "tag": {"finding_id":1001, "project_id":1001, "tag":"key:value"}}' \
    'https://api.security-hub.jp/api/v1/finding/tag-finding/'
```


### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "tag": {
            "finding_tag_id": 1007,
            "finding_id": 1001,
            "project_id": 1001,
            "tag": "key:value",
            "created_at": 1629969683,
            "updated_at": 1629969683
        }
    }
}
```

---

## UntagFinding

### Endpoint

```yaml
POST: /finding/untag-finding/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `finding_tag_id` | string | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "finding_tag_id":1007}' \
    'https://api.security-hub.jp/api/v1/finding/untag-finding/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## GetPendFinding

### Endpoint

```yaml
GET: /finding/get-pend-finding/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `finding_id` | number | query | yes | |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://api.security-hub.jp/api/v1/finding/get-pend-finding/?project_id=1001&finding_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "pend_finding": {
            "finding_id": 1001,
            "project_id": 1001,
            "note": "no risk",
            "created_at": 1629970068,
            "updated_at": 1629970068
        }
    }
}
```

---

## PutPendFindng

### Endpoint

```yaml
POST: /finding/put-pend-finding/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `pend_finding.finding_id` | number | body | yes | |
| `pend_finding.project_id` | number | body | yes | |
| `pend_finding.note` | string | body | | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "pend_finding": {"finding_id":1001, "project_id":1001, "note":"note"}}' \
    'https://api.security-hub.jp/api/v1/finding/put-pend-finding/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "pend_finding": {
            "finding_id": 1001,
            "project_id": 1001,
            "note": "note",
            "created_at": 1629970068,
            "updated_at": 1629970288
        }
    }
}
```

---

## DeletePendFindng

### Endpoint

```yaml
POST: /finding/delete-pend-finding/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `finding_id` | number | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "finding_id":1001}' \
    'https://api.security-hub.jp/api/v1/finding/delete-pend-finding/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```
