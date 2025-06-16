# Report API

The Report API allows to manage and control report data.

---

## GetReport

Get report data for a specific project.

### Endpoint

```yaml
GET: /report/get-report/
```

### Parameters

| Name | Type | In | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |

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
          "description": "Security finding description",
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

Get report data for all projects (Admin only).

### Endpoint

```yaml
GET: /report/get-report-all/
```

### Parameters

| Name | Type | In | Required | Description |
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
            "description": "Security finding description",
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
