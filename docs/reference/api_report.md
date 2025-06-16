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
| `project_id` | number | query | yes | プロジェクトID（1以上の値） |
| `from_date` | string | query | no | 開始日（YYYY-MM-DD形式、例：2023-01-01） |
| `to_date` | string | query | no | 終了日（YYYY-MM-DD形式、例：2023-12-31） |
| `score` | number | query | no | スコア閾値（0.0-1.0の範囲） |
| `data_source` | array | query | no | データソースの配列（複数指定可能） |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/report/get-report/?project_id=1001&from_date=2023-01-01&to_date=2023-12-31&score=0.5&data_source=aws&data_source=gcp'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "report_finding": [
      {
        "finding_id": 1001,
        "description": "セキュリティ検出項目の説明",
        "score": 0.8,
        "data_source": "aws",
        "resource_name": "example-resource",
        "project_id": 1001,
        "created_at": 1629337534,
        "updated_at": 1629337534
      },
      {
        "finding_id": 1002,
        "description": "別のセキュリティ検出項目",
        "score": 0.6,
        "data_source": "gcp",
        "resource_name": "another-resource",
        "project_id": 1001,
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
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
| `project_id` | number | query | no | プロジェクトID（指定した場合、そのプロジェクトのみ） |
| `from_date` | string | query | no | 開始日（YYYY-MM-DD形式、例：2023-01-01） |
| `to_date` | string | query | no | 終了日（YYYY-MM-DD形式、例：2023-12-31） |
| `score` | number | query | no | スコア閾値（0.0-1.0の範囲） |
| `data_source` | array | query | no | データソースの配列（複数指定可能） |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/report/get-report-all/?from_date=2023-01-01&to_date=2023-12-31&score=0.7&data_source=aws&data_source=osint'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "report_finding": [
      {
        "finding_id": 1001,
        "description": "セキュリティ検出項目の説明",
        "score": 0.8,
        "data_source": "aws",
        "resource_name": "example-resource",
        "project_id": 1001,
        "created_at": 1629337534,
        "updated_at": 1629337534
      },
      {
        "finding_id": 2001,
        "description": "別のプロジェクトの検出項目",
        "score": 0.9,
        "data_source": "osint",
        "resource_name": "domain-resource",
        "project_id": 1002,
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
  }
}
```
