# OSINT API

The OSINT (Open Source Intelligence) API provides endpoints for collecting and managing open source intelligence information.

## Authentication

All API endpoints require Bearer authentication.

```
Authorization: Bearer {your-token}
```

## Endpoints

### ListOsint

Retrieves a list of OSINT configurations.

**Endpoint**

```
GET https://{your-site}/api/v1/osint/list-osint/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | query | Yes | Project ID |

**Code sample**

```bash
curl -X GET \
  'https://{your-site}/api/v1/osint/list-osint/?project_id=1001' \
  -H 'Authorization: Bearer {your-token}'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {
    "osint": [
      {
        "osint_id": 1001,
        "project_id": 1001,
        "resource_type": "Domain",
        "resource_name": "example.com",
        "created_at": 1640995200,
        "updated_at": 1640995200
      }
    ]
  }
}
```

### GetOsint

Retrieves details of a specific OSINT configuration.

**Endpoint**

```
GET https://{your-site}/api/v1/osint/get-osint/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | query | Yes | Project ID |
| osint_id | integer | query | Yes | OSINT configuration ID |

**Code sample**

```bash
curl -X GET \
  'https://{your-site}/api/v1/osint/get-osint/?project_id=1001&osint_id=1001' \
  -H 'Authorization: Bearer {your-token}'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {
    "osint": {
      "osint_id": 1001,
      "project_id": 1001,
      "resource_type": "Domain",
      "resource_name": "example.com",
      "created_at": 1640995200,
      "updated_at": 1640995200
    }
  }
}
```

### PutOsint

Creates or updates an OSINT configuration.

**Endpoint**

```
POST https://{your-site}/api/v1/osint/put-osint/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | Project ID |
| osint | object | body | Yes | OSINT configuration object |
| osint.osint_id | integer | body | No | OSINT configuration ID (for updates) |
| osint.project_id | integer | body | Yes | Project ID |
| osint.resource_type | string | body | Yes | Resource type |
| osint.resource_name | string | body | Yes | Resource name |

**Code sample**

```bash
curl -X POST \
  'https://{your-site}/api/v1/osint/put-osint/' \
  -H 'Authorization: Bearer {your-token}' \
  -H 'Content-Type: application/json' \
  -d '{
    "project_id": 1001,
    "osint": {
      "project_id": 1001,
      "resource_type": "Domain",
      "resource_name": "example.com"
    }
  }'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {
    "osint": {
      "osint_id": 1001,
      "project_id": 1001,
      "resource_type": "Domain",
      "resource_name": "example.com",
      "created_at": 1640995200,
      "updated_at": 1640995200
    }
  }
}
```

### DeleteOsint

Deletes a specific OSINT configuration.

**Endpoint**

```
POST https://{your-site}/api/v1/osint/delete-osint/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | Project ID |
| osint_id | integer | body | Yes | OSINT configuration ID |

**Code sample**

```bash
curl -X POST \
  'https://{your-site}/api/v1/osint/delete-osint/' \
  -H 'Authorization: Bearer {your-token}' \
  -H 'Content-Type: application/json' \
  -d '{
    "project_id": 1001,
    "osint_id": 1003
  }'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {}
}
```

### ListOsintDataSource

Retrieves a list of OSINT data sources.

**Endpoint**

```
GET https://{your-site}/api/v1/osint/list-datasource/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | query | Yes | Project ID |
| name | string | query | No | Data source name (filter) |

**Code sample**

```bash
curl -X GET \
  'https://{your-site}/api/v1/osint/list-datasource/?project_id=1001' \
  -H 'Authorization: Bearer {your-token}'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {
    "osint_data_source": [
      {
        "osint_data_source_id": 1001,
        "name": "hoge-osint",
        "description": "osint-datasource",
        "max_score": 10.0,
        "created_at": 1640995200,
        "updated_at": 1640995200
      }
    ]
  }
}
```

### PutOsintDataSource

Creates or updates an OSINT data source.

**Endpoint**

```
POST https://{your-site}/api/v1/osint/put-datasource/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | Project ID |
| osint_data_source | object | body | Yes | OSINT data source object |
| osint_data_source.osint_data_source_id | integer | body | No | OSINT data source ID (for updates) |
| osint_data_source.name | string | body | Yes | Data source name |
| osint_data_source.description | string | body | Yes | Data source description |
| osint_data_source.max_score | float | body | Yes | Maximum score |

**Code sample**

```bash
curl -X POST \
  'https://{your-site}/api/v1/osint/put-datasource/' \
  -H 'Authorization: Bearer {your-token}' \
  -H 'Content-Type: application/json' \
  -d '{
    "project_id": 1001,
    "osint_data_source": {
      "name": "hoge-osint",
      "description": "osint-datasource",
      "max_score": 10.0
    }
  }'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {
    "osint_data_source": {
      "osint_data_source_id": 1001,
      "name": "hoge-osint",
      "description": "osint-datasource",
      "max_score": 10.0,
      "created_at": 1640995200,
      "updated_at": 1640995200
    }
  }
}
```

### DeleteOsintDataSource

Deletes a specific OSINT data source.

**Endpoint**

```
POST https://{your-site}/api/v1/osint/delete-datasource/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | Project ID |
| osint_data_source_id | integer | body | Yes | OSINT data source ID |

**Code sample**

```bash
curl -X POST \
  'https://{your-site}/api/v1/osint/delete-datasource/' \
  -H 'Authorization: Bearer {your-token}' \
  -H 'Content-Type: application/json' \
  -d '{
    "project_id": 1001,
    "osint_data_source_id": 1002
  }'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {}
}
```

### ListRelOsintDataSource

Retrieves a list of OSINT related data sources.

**Endpoint**

```
GET https://{your-site}/api/v1/osint/list-rel-datasource/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | query | Yes | Project ID |
| osint_id | integer | query | No | OSINT configuration ID (filter) |
| osint_data_source_id | integer | query | No | OSINT data source ID (filter) |

**Code sample**

```bash
curl -X GET \
  'https://{your-site}/api/v1/osint/list-rel-datasource/?project_id=1001' \
  -H 'Authorization: Bearer {your-token}'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {
    "rel_osint_data_source": [
      {
        "rel_osint_data_source_id": 1001,
        "osint_data_source_id": 1001,
        "osint_id": 1001,
        "project_id": 1001,
        "status": 1,
        "status_detail": "",
        "scan_at": 1640995200,
        "created_at": 1640995200,
        "updated_at": 1640995200
      }
    ]
  }
}
```

### PutRelOsintDataSource

Creates or updates an OSINT related data source.

**Endpoint**

```
POST https://{your-site}/api/v1/osint/put-rel-datasource/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | Project ID |
| rel_osint_data_source | object | body | Yes | OSINT related data source object |
| rel_osint_data_source.rel_osint_data_source_id | integer | body | No | OSINT related data source ID (for updates) |
| rel_osint_data_source.osint_data_source_id | integer | body | Yes | OSINT data source ID |
| rel_osint_data_source.osint_id | integer | body | Yes | OSINT configuration ID |
| rel_osint_data_source.project_id | integer | body | Yes | Project ID |
| rel_osint_data_source.status | integer | body | Yes | Status (0:UNKNOWN, 1:OK, 2:CONFIGURED, 3:IN_PROGRESS, 4:ERROR) |
| rel_osint_data_source.status_detail | string | body | No | Status detail |
| rel_osint_data_source.scan_at | integer | body | No | Scan execution time |

**Code sample**

```bash
curl -X POST \
  'https://{your-site}/api/v1/osint/put-rel-datasource/' \
  -H 'Authorization: Bearer {your-token}' \
  -H 'Content-Type: application/json' \
  -d '{
    "project_id": 1001,
    "rel_osint_data_source": {
      "osint_id": 1001,
      "osint_data_source_id": 1001,
      "project_id": 1001,
      "status": 1
    }
  }'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {
    "rel_osint_data_source": {
      "rel_osint_data_source_id": 1001,
      "osint_data_source_id": 1001,
      "osint_id": 1001,
      "project_id": 1001,
      "status": 1,
      "status_detail": "",
      "scan_at": 1640995200,
      "created_at": 1640995200,
      "updated_at": 1640995200
    }
  }
}
```

### DeleteRelOsintDataSource

Deletes a specific OSINT related data source.

**Endpoint**

```
POST https://{your-site}/api/v1/osint/delete-rel-datasource/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | Project ID |
| rel_osint_data_source_id | integer | body | Yes | OSINT related data source ID |

**Code sample**

```bash
curl -X POST \
  'https://{your-site}/api/v1/osint/delete-rel-datasource/' \
  -H 'Authorization: Bearer {your-token}' \
  -H 'Content-Type: application/json' \
  -d '{
    "project_id": 1001,
    "rel_osint_data_source_id": 1003
  }'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {}
}
```

### ListOsintDetectWord

Retrieves a list of OSINT detect words.

**Endpoint**

```
GET https://{your-site}/api/v1/osint/list-word/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | query | Yes | Project ID |
| rel_osint_data_source_id | integer | query | No | OSINT related data source ID (filter) |

**Code sample**

```bash
curl -X GET \
  'https://{your-site}/api/v1/osint/list-word/?project_id=1001' \
  -H 'Authorization: Bearer {your-token}'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {
    "osint_detect_word": [
      {
        "osint_detect_word_id": 1001,
        "rel_osint_data_source_id": 1001,
        "word": "hoge",
        "project_id": 1001,
        "created_at": 1640995200,
        "updated_at": 1640995200
      }
    ]
  }
}
```

### PutOsintDetectWord

Creates or updates an OSINT detect word.

**Endpoint**

```
POST https://{your-site}/api/v1/osint/put-word/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | Project ID |
| osint_detect_word | object | body | Yes | OSINT detect word object |
| osint_detect_word.osint_detect_word_id | integer | body | No | OSINT detect word ID (for updates) |
| osint_detect_word.rel_osint_data_source_id | integer | body | Yes | OSINT related data source ID |
| osint_detect_word.word | string | body | Yes | Detect word |
| osint_detect_word.project_id | integer | body | Yes | Project ID |

**Code sample**

```bash
curl -X POST \
  'https://{your-site}/api/v1/osint/put-word/' \
  -H 'Authorization: Bearer {your-token}' \
  -H 'Content-Type: application/json' \
  -d '{
    "project_id": 1001,
    "osint_detect_word": {
      "rel_osint_data_source_id": 1001,
      "word": "hoge",
      "project_id": 1001
    }
  }'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {
    "osint_detect_word": {
      "osint_detect_word_id": 1001,
      "rel_osint_data_source_id": 1001,
      "word": "hoge",
      "project_id": 1001,
      "created_at": 1640995200,
      "updated_at": 1640995200
    }
  }
}
```

### DeleteOsintDetectWord

Deletes a specific OSINT detect word.

**Endpoint**

```
POST https://{your-site}/api/v1/osint/delete-word/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | Project ID |
| osint_detect_word_id | integer | body | Yes | OSINT detect word ID |

**Code sample**

```bash
curl -X POST \
  'https://{your-site}/api/v1/osint/delete-word/' \
  -H 'Authorization: Bearer {your-token}' \
  -H 'Content-Type: application/json' \
  -d '{
    "project_id": 1001,
    "osint_detect_word_id": 1003
  }'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {}
}
```

### InvokeScan

Executes an OSINT scan.

**Endpoint**

```
POST https://{your-site}/api/v1/osint/invoke-scan/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | Project ID |
| rel_osint_data_source_id | integer | body | Yes | OSINT related data source ID |
| scan_only | boolean | body | No | Whether to execute scan only |

**Code sample**

```bash
curl -X POST \
  'https://{your-site}/api/v1/osint/invoke-scan/' \
  -H 'Authorization: Bearer {your-token}' \
  -H 'Content-Type: application/json' \
  -d '{
    "project_id": 1001,
    "rel_osint_data_source_id": 1001
  }'
```

**Response**

```
Status: 200 OK
```

```json
{
  "data": {
    "message": "Success: Invoke OSINT scan"
  }
}
```
