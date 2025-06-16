# Report API

Use the Report API to manage and control report data.

---

## GetReport

Retrieve report data for a specific project.

### Endpoint

```yaml
GET: /report/get-report/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID (value >= 1) |
| `from_date` | string | query | no | Start date (YYYY-MM-DD format, e.g., 2023-01-01) |
| `to_date` | string | query | no | End date (YYYY-MM-DD format, e.g., 2023-12-31) |
| `score` | number | query | no | Score threshold (0.0-1.0 range) |
| `data_source` | array | query | no | Array of data sources (multiple values allowed) |

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
        "description": "Security finding description",
        "score": 0.8,
        "data_source": "aws",
        "resource_name": "example-resource",
        "project_id": 1001,
        "created_at": 1629337534,
        "updated_at": 1629337534
      },
      {
        "finding_id": 1002,
        "description": "Another security finding",
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

Retrieve report data for all projects (administrators only).

### Endpoint

```yaml
GET: /report/get-report-all/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | no | Project ID (if specified, only that project) |
| `from_date` | string | query | no | Start date (YYYY-MM-DD format, e.g., 2023-01-01) |
| `to_date` | string | query | no | End date (YYYY-MM-DD format, e.g., 2023-12-31) |
| `score` | number | query | no | Score threshold (0.0-1.0 range) |
| `data_source` | array | query | no | Array of data sources (multiple values allowed) |

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
        "description": "Security finding description",
        "score": 0.8,
        "data_source": "aws",
        "resource_name": "example-resource",
        "project_id": 1001,
        "created_at": 1629337534,
        "updated_at": 1629337534
      },
      {
        "finding_id": 2001,
        "description": "Finding from another project",
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
