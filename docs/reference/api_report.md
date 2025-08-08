# Report API

Use the Report API to manage and control report data.

---

## GetReportFinding

Retrieve finding data for report generation.

### Endpoint

```yaml
GET: /report/get-report-finding/
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
    'https://{your-site}/api/v1/report/get-report-finding/?project_id=1001&from_date=2023-01-01&to_date=2023-12-31&score=0.5&data_source=aws'
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
      }
    ]
  }
}
```

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
| `report_id` | number | query | yes | Report ID |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/report/get-report/?project_id=1001&report_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "report": {
      "report_id": 1001,
      "name": "Monthly Security Report",
      "project_id": 1001,
      "from_date": "2023-01-01",
      "to_date": "2023-01-31",
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## ListReport

List reports for a specific project.

### Endpoint

```yaml
GET: /report/list-report/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID (value >= 1) |
| `sort` | string | query | no | Sort field: `report_id`, `name`, `created_at`, `updated_at` |
| `direction` | string | query | no | Sort direction: `asc`, `desc` |
| `offset` | number | query | no | Offset for pagination |
| `limit` | number | query | no | Limit for pagination |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/report/list-report/?project_id=1001&sort=created_at&direction=desc&limit=10'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "report": [
      {
        "report_id": 1001,
        "name": "Monthly Security Report",
        "project_id": 1001,
        "from_date": "2023-01-01",
        "to_date": "2023-01-31",
        "created_at": 1629337534,
        "updated_at": 1629337534
      },
      {
        "report_id": 1002,
        "name": "Weekly Vulnerability Report",
        "project_id": 1001,
        "from_date": "2023-01-01",
        "to_date": "2023-01-07",
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

## PutReport

Insert or update report data.

### Endpoint

```yaml
POST: /report/put-report/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `report.name` | string | body | yes | Report name |
| `report.from_date` | string | body | yes | Start date (YYYY-MM-DD format) |
| `report.to_date` | string | body | yes | End date (YYYY-MM-DD format) |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{
      "project_id": 1001,
      "report": {
        "name": "Monthly Security Report",
        "from_date": "2023-01-01",
        "to_date": "2023-01-31"
      }
    }' \
    'https://{your-site}/api/v1/report/put-report/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "report": {
      "report_id": 1001,
      "name": "Monthly Security Report",
      "project_id": 1001,
      "from_date": "2023-01-01",
      "to_date": "2023-01-31",
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## GetReportFindingAll

Retrieve finding data for all projects (administrators only).

### Endpoint

```yaml
GET: /report/get-report-finding-all/
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
    'https://{your-site}/api/v1/report/get-report-finding-all/?from_date=2023-01-01&to_date=2023-12-31&score=0.7&data_source=aws&data_source=osint'
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
