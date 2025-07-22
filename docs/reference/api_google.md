# Google API

The Google API allows to manage and control the Google Cloud Platform (GCP) resources and data sources.

---

## ListGoogleDataSource

List available Google data sources.

### Endpoint

```yaml
GET: /google/list-google-datasource/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | | |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/google/list-google-datasource/?project_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "google_data_source": [
      {
        "google_data_source_id": 1001,
        "name": "asset",
        "description": "Google Cloud Asset Inventory",
        "max_score": 10.0,
        "created_at": 1629337534,
        "updated_at": 1629337534
      },
      {
        "google_data_source_id": 1002,
        "name": "cloudsploit",
        "description": "CloudSploit security scanner",
        "max_score": 10.0,
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
  }
}
```

---

## ListGCP

List GCP projects configured in RISKEN.

### Endpoint

```yaml
GET: /google/list-gcp/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/google/list-gcp/?project_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "gcp": [
      {
        "gcp_id": 1001,
        "name": "test-project",
        "project_id": 1001,
        "gcp_project_id": "my-gcp-project-123",
        "verification_code": "abc123def456",
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
  }
}
```

---

## GetGCPDataSource

Get GCP data source configuration.

### Endpoint

```yaml
GET: /google/get-gcp-datasource/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | |
| `gcp_id` | number | query | yes | |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/google/get-gcp-datasource/?project_id=1001&gcp_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "gcp_data_source": [
      {
        "gcp_id": 1001,
        "google_data_source_id": 1001,
        "project_id": 1001,
        "status": 1,
        "status_detail": "OK",
        "scan_at": 1629337534,
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
  }
}
```

---

## PutGCP

Insert or update GCP project configuration.

### Endpoint

```yaml
POST: /google/put-gcp/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `gcp.gcp_id` | number | body | | |
| `gcp.name` | string | body | yes | |
| `gcp.project_id` | number | body | yes | |
| `gcp.gcp_project_id` | string | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "gcp": {"gcp_id":1002, "name":"test", "project_id":1001, "gcp_project_id":"test"}}' \
    'https://{your-site}/api/v1/google/put-gcp/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "gcp": {
      "gcp_id": 1002,
      "name": "test",
      "project_id": 1001,
      "gcp_project_id": "test",
      "verification_code": "xyz789abc123",
      "created_at": 1629947204,
      "updated_at": 1629947204
    }
  }
}
```

---

## DeleteGCP

Delete GCP project configuration.

### Endpoint

```yaml
POST: /google/delete-gcp/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `gcp_id` | number | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "gcp_id":1002}' \
    'https://{your-site}/api/v1/google/delete-gcp/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## AttachGCPDataSource

Attach a data source to GCP project.

### Endpoint

```yaml
POST: /google/attach-gcp-datasource/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `gcp_data_source.gcp_id` | number | body | yes | |
| `gcp_data_source.google_data_source_id` | number | body | yes | |
| `gcp_data_source.project_id` | number | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "gcp_data_source": {"gcp_id":1001, "google_data_source_id":1001, "project_id":1001}}' \
    'https://{your-site}/api/v1/google/attach-gcp-datasource/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "gcp_data_source": {
      "gcp_id": 1001,
      "google_data_source_id": 1001,
      "project_id": 1001,
      "status": 1,
      "status_detail": "OK",
      "scan_at": 0,
      "created_at": 1629947204,
      "updated_at": 1629947204
    }
  }
}
```

---

## DetachGCPDataSource

Detach a data source from GCP project.

### Endpoint

```yaml
POST: /google/detach-gcp-datasource/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `gcp_id` | number | body | yes | |
| `google_data_source_id` | number | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "gcp_id":1001, "google_data_source_id":1001}' \
    'https://{your-site}/api/v1/google/detach-gcp-datasource/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## InvokeScanGCP

Invoke security scan for GCP project.

### Endpoint

```yaml
POST: /google/invoke-scan-gcp/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `gcp_id` | number | body | yes | |
| `google_data_source_id` | number | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "gcp_id":1001, "google_data_source_id":1001}' \
    'https://{your-site}/api/v1/google/invoke-scan-gcp/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
