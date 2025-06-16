# Report API

レポートAPIを使用してレポートデータを管理および制御できます。

---

## GetReport

特定のプロジェクトのレポートデータを取得します。

### Endpoint

```yaml
GET: /report/get-report/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | プロジェクトID |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/report/get-report/?project_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "report": {
      "project_id": 1001,
      "findings": [
        {
          "finding_id": 1001,
          "description": "セキュリティ検出項目の説明",
          "score": 8.5,
          "status": "active"
        }
      ],
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## GetReportAll

全プロジェクトのレポートデータを取得します（管理者のみ）。

### Endpoint

```yaml
GET: /report/get-report-all/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/report/get-report-all/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "reports": [
      {
        "project_id": 1001,
        "findings": [
          {
            "finding_id": 1001,
            "description": "セキュリティ検出項目の説明",
            "score": 8.5,
            "status": "active"
          }
        ],
        "created_at": 1629337534,
        "updated_at": 1629337534
      },
      {
        "project_id": 1002,
        "findings": [],
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
  }
}
```
