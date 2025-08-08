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
        "report_finding_id": 1001,
        "report_date": "2023-01-01",
        "project_id": 1001,
        "project_name": "Example Project",
        "category": "Security",
        "data_source": "aws",
        "score": 0.8,
        "count": 5
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
| `report_id` | number | query | yes | Report ID (value >= 1) |

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
      "project_id": 1001,
      "name": "Monthly Security Report",
      "type": "Markdown",
      "status": "OK",
      "content": "# Security Report\n\nThis is the report content...",
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

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/report/list-report/?project_id=1001'
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
        "project_id": 1001,
        "name": "Monthly Security Report",
        "type": "Markdown",
        "status": "OK",
        "content": "# Security Report\n\nThis is the report content...",
        "created_at": 1629337534,
        "updated_at": 1629337534
      },
      {
        "report_id": 1002,
        "project_id": 1001,
        "name": "Weekly Vulnerability Report",
        "type": "HTML",
        "status": "IN_PROGRESS",
        "content": "<h1>Vulnerability Report</h1><p>Report content...</p>",
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
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
| `report_id` | number | body | no | Report ID (0 for new report) |
| `project_id` | number | body | yes | Project ID (value >= 1) |
| `name` | string | body | yes | Report name (max 200 characters) |
| `type` | string | body | no | Report type: "Markdown" or "HTML" |
| `status` | string | body | no | Report status: "OK", "IN_PROGRESS", or "ERROR" |
| `content` | string | body | no | Report content |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{
      "report_id": 0,
      "project_id": 1001,
      "name": "Monthly Security Report",
      "type": "Markdown",
      "status": "OK",
      "content": "# Security Report\n\nThis is the report content..."
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
      "project_id": 1001,
      "name": "Monthly Security Report",
      "type": "Markdown",
      "status": "OK",
      "content": "# Security Report\n\nThis is the report content...",
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
        "report_finding_id": 1001,
        "report_date": "2023-01-01",
        "project_id": 1001,
        "project_name": "Example Project",
        "category": "Security",
        "data_source": "aws",
        "score": 0.8,
        "count": 5
      },
      {
        "report_finding_id": 2001,
        "report_date": "2023-01-01",
        "project_id": 1002,
        "project_name": "Another Project",
        "category": "Vulnerability",
        "data_source": "osint",
        "score": 0.9,
        "count": 3
      }
    ]
  }
}
```
