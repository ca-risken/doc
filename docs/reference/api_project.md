# Project API

Project APIは、プロジェクトの作成、更新、削除、タグ付けなどの操作を提供します。

---

## ListProject

### Endpoint

```yaml
GET: /project/list-project/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `user_id` | number | query | | ユーザーID |
| `project_id` | number | query | | プロジェクトID |
| `name` | string | query | | プロジェクト名 |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/project/list-project/?project_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "project": [
            {
                "project_id": 1001,
                "name": "sample-project",
                "tag": [
                    {
                        "project_id": 1001,
                        "tag": "sample-tag",
                        "color": "blue",
                        "created_at": 1629337534,
                        "updated_at": 1629337534
                    }
                ],
                "created_at": 1629337534,
                "updated_at": 1629337534
            }
        ]
    }
}
```

---

## CreateProject

### Endpoint

```yaml
POST: /project/create-project/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `user_id` | number | body | yes | プロジェクトオーナーのユーザーID |
| `name` | string | body | yes | プロジェクト名（1〜64文字） |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"user_id":1001, "name":"sample-project"}' \
    'https://{your-site}/api/v1/project/create-project/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "project": {
            "project_id": 1001,
            "name": "sample-project",
            "created_at": 1629337534,
            "updated_at": 1629337534
        }
    }
}
```

---

## UpdateProject

### Endpoint

```yaml
POST: /project/update-project/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `name` | string | body | yes | プロジェクト名（1〜64文字） |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "name":"updated-project-name"}' \
    'https://{your-site}/api/v1/project/update-project/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "project": {
            "project_id": 1001,
            "name": "updated-project-name",
            "created_at": 1629337534,
            "updated_at": 1629974029
        }
    }
}
```

---

## DeleteProject

### Endpoint

```yaml
POST: /project/delete-project/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001}' \
    'https://{your-site}/api/v1/project/delete-project/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## TagProject

### Endpoint

```yaml
POST: /project/tag-project/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `tag` | string | body | yes | タグ名（1〜512文字） |
| `color` | string | body | | タグの色（0〜32文字） |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "tag":"sample-tag", "color":"blue"}' \
    'https://{your-site}/api/v1/project/tag-project/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "project_tag": {
            "project_id": 1001,
            "tag": "sample-tag",
            "color": "blue",
            "created_at": 1629337534,
            "updated_at": 1629337534
        }
    }
}
```

---

## UntagProject

### Endpoint

```yaml
POST: /project/untag-project/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `tag` | string | body | yes | タグ名（1〜512文字） |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "tag":"sample-tag"}' \
    'https://{your-site}/api/v1/project/untag-project/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```
