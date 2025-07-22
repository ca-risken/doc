# Diagnosis API

The Diagnosis API provides endpoints for managing security scanning configurations and operations, including WPScan for WordPress vulnerability scanning, Portscan for network port scanning, and Application scanning for web application security assessment.

## Authentication

All API requests require authentication using a Bearer token in the Authorization header:

```
Authorization: Bearer {your-access-token}
```

## Base URL

```
https://{your-site}/api/v1/diagnosis/
```

## DataSource Management

### Get Diagnosis DataSource

Get details of a specific diagnosis data source.

**Endpoint:** `GET /get-datasource`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | query | Yes | Project ID |
| diagnosis_data_source_id | number | query | Yes | Diagnosis data source ID |

**Code Sample:**

```bash
curl -X GET "https://{your-site}/api/v1/diagnosis/get-datasource?project_id=1&diagnosis_data_source_id=1001" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json"
```

**Response:**

Status: `200 OK`

```json
{
  "success": {
    "diagnosis_data_source": {
      "diagnosis_data_source_id": 1001,
      "name": "WordPress Security Scanner",
      "description": "Automated WordPress vulnerability scanning",
      "max_score": 10.0,
      "created_at": 1640995200,
      "updated_at": 1640995200
    }
  }
}
```

## WPScan Settings

### List WPScan Settings

List all WPScan settings for a diagnosis data source.

**Endpoint:** `GET /list-wpscan-setting`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | query | Yes | Project ID |
| diagnosis_data_source_id | number | query | Yes | Diagnosis data source ID |

**Code Sample:**

```bash
curl -X GET "https://{your-site}/api/v1/diagnosis/list-wpscan-setting?project_id=1&diagnosis_data_source_id=1001" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json"
```

**Response:**

Status: `200 OK`

```json
{
  "success": {
    "wpscan_setting": [
      {
        "wpscan_setting_id": 1,
        "project_id": 1,
        "diagnosis_data_source_id": 1001,
        "target_url": "https://example.com",
        "status": 1,
        "status_detail": "Configured",
        "scan_at": 1640995200,
        "created_at": 1640995200,
        "updated_at": 1640995200,
        "options": "--enumerate u,p,t"
      }
    ]
  }
}
```

### Create/Update WPScan Setting

Create or update a WPScan setting configuration.

**Endpoint:** `POST /put-wpscan-setting`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | body | Yes | Project ID |
| wpscan_setting | object | body | Yes | WPScan setting configuration |
| wpscan_setting.wpscan_setting_id | number | body | No | WPScan setting ID (for updates) |
| wpscan_setting.project_id | number | body | Yes | Project ID |
| wpscan_setting.diagnosis_data_source_id | number | body | Yes | Diagnosis data source ID |
| wpscan_setting.target_url | string | body | Yes | Target WordPress URL |
| wpscan_setting.status | number | body | No | Status (0=UNKNOWN, 1=OK, 2=CONFIGURED, 3=IN_PROGRESS, 4=ERROR) |
| wpscan_setting.status_detail | string | body | No | Status detail message |
| wpscan_setting.scan_at | number | body | No | Unix timestamp of last scan |
| wpscan_setting.options | string | body | No | WPScan command options |

**Code Sample:**

```bash
curl -X POST "https://{your-site}/api/v1/diagnosis/put-wpscan-setting" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json" \
  -d '{
    "project_id": 1,
    "wpscan_setting": {
      "project_id": 1,
      "diagnosis_data_source_id": 1001,
      "target_url": "https://example.com",
      "status": 2,
      "options": "--enumerate u,p,t"
    }
  }'
```

**Response:**

Status: `200 OK`

```json
{
  "success": {
    "wpscan_setting": {
      "wpscan_setting_id": 1,
      "project_id": 1,
      "diagnosis_data_source_id": 1001,
      "target_url": "https://example.com",
      "status": 2,
      "status_detail": "Configured",
      "scan_at": 0,
      "created_at": 1640995200,
      "updated_at": 1640995200,
      "options": "--enumerate u,p,t"
    }
  }
}
```

### Delete WPScan Setting

Delete a WPScan setting configuration.

**Endpoint:** `POST /delete-wpscan-setting`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | body | Yes | Project ID |
| wpscan_setting_id | number | body | Yes | WPScan setting ID to delete |

**Code Sample:**

```bash
curl -X POST "https://{your-site}/api/v1/diagnosis/delete-wpscan-setting" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json" \
  -d '{
    "project_id": 1,
    "wpscan_setting_id": 1
  }'
```

**Response:**

Status: `200 OK`

```json
{
  "success": {}
}
```

## Portscan Settings

### List Portscan Settings

List all portscan settings for a diagnosis data source.

**Endpoint:** `GET /list-portscan-setting`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | query | Yes | Project ID |
| diagnosis_data_source_id | number | query | Yes | Diagnosis data source ID |

**Code Sample:**

```bash
curl -X GET "https://{your-site}/api/v1/diagnosis/list-portscan-setting?project_id=1&diagnosis_data_source_id=1001" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json"
```

**Response:**

Status: `200 OK`

```json
{
  "success": {
    "portscan_setting": [
      {
        "portscan_setting_id": 1,
        "project_id": 1,
        "diagnosis_data_source_id": 1001,
        "name": "Production Network Scan",
        "created_at": 1640995200,
        "updated_at": 1640995200
      }
    ]
  }
}
```

### Create/Update Portscan Setting

Create or update a portscan setting configuration.

**Endpoint:** `POST /put-portscan-setting`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | body | Yes | Project ID |
| portscan_setting | object | body | Yes | Portscan setting configuration |
| portscan_setting.portscan_setting_id | number | body | No | Portscan setting ID (for updates) |
| portscan_setting.project_id | number | body | Yes | Project ID |
| portscan_setting.diagnosis_data_source_id | number | body | Yes | Diagnosis data source ID |
| portscan_setting.name | string | body | Yes | Setting name |

**Code Sample:**

```bash
curl -X POST "https://{your-site}/api/v1/diagnosis/put-portscan-setting" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json" \
  -d '{
    "project_id": 1,
    "portscan_setting": {
      "project_id": 1,
      "diagnosis_data_source_id": 1001,
      "name": "Production Network Scan"
    }
  }'
```

**Response:**

Status: `200 OK`

```json
{
  "success": {
    "portscan_setting": {
      "portscan_setting_id": 1,
      "project_id": 1,
      "diagnosis_data_source_id": 1001,
      "name": "Production Network Scan",
      "created_at": 1640995200,
      "updated_at": 1640995200
    }
  }
}
```

### Delete Portscan Setting

Delete a portscan setting configuration.

**Endpoint:** `POST /delete-portscan-setting`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | body | Yes | Project ID |
| portscan_setting_id | number | body | Yes | Portscan setting ID to delete |

**Code Sample:**

```bash
curl -X POST "https://{your-site}/api/v1/diagnosis/delete-portscan-setting" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json" \
  -d '{
    "project_id": 1,
    "portscan_setting_id": 1
  }'
```

**Response:**

Status: `200 OK`

```json
{
  "success": {}
}
```

## Portscan Targets

### List Portscan Targets

List all portscan targets for a portscan setting.

**Endpoint:** `GET /list-portscan-target`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | query | Yes | Project ID |
| portscan_setting_id | number | query | Yes | Portscan setting ID |
| status | number | query | No | Filter by status (0=UNKNOWN, 1=OK, 2=CONFIGURED, 3=IN_PROGRESS, 4=ERROR) |

**Code Sample:**

```bash
curl -X GET "https://{your-site}/api/v1/diagnosis/list-portscan-target?project_id=1&portscan_setting_id=1" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json"
```

**Response:**

Status: `200 OK`

```json
{
  "success": {
    "portscan_target": [
      {
        "portscan_target_id": 1,
        "project_id": 1,
        "portscan_setting_id": 1,
        "target": "192.168.1.0/24",
        "status": 1,
        "status_detail": "Scan completed",
        "scan_at": 1640995200,
        "created_at": 1640995200,
        "updated_at": 1640995200
      }
    ]
  }
}
```

### Create/Update Portscan Target

Create or update a portscan target configuration.

**Endpoint:** `POST /put-portscan-target`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | body | Yes | Project ID |
| portscan_target | object | body | Yes | Portscan target configuration |
| portscan_target.portscan_target_id | number | body | No | Portscan target ID (for updates) |
| portscan_target.project_id | number | body | Yes | Project ID |
| portscan_target.portscan_setting_id | number | body | Yes | Portscan setting ID |
| portscan_target.target | string | body | Yes | Target IP address or CIDR range |
| portscan_target.status | number | body | No | Status (0=UNKNOWN, 1=OK, 2=CONFIGURED, 3=IN_PROGRESS, 4=ERROR) |
| portscan_target.status_detail | string | body | No | Status detail message |
| portscan_target.scan_at | number | body | No | Unix timestamp of last scan |

**Code Sample:**

```bash
curl -X POST "https://{your-site}/api/v1/diagnosis/put-portscan-target" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json" \
  -d '{
    "project_id": 1,
    "portscan_target": {
      "project_id": 1,
      "portscan_setting_id": 1,
      "target": "192.168.1.0/24",
      "status": 2
    }
  }'
```

**Response:**

Status: `200 OK`

```json
{
  "success": {
    "portscan_target": {
      "portscan_target_id": 1,
      "project_id": 1,
      "portscan_setting_id": 1,
      "target": "192.168.1.0/24",
      "status": 2,
      "status_detail": "Configured",
      "scan_at": 0,
      "created_at": 1640995200,
      "updated_at": 1640995200
    }
  }
}
```

### Delete Portscan Target

Delete a portscan target configuration.

**Endpoint:** `POST /delete-portscan-target`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | body | Yes | Project ID |
| portscan_target_id | number | body | Yes | Portscan target ID to delete |

**Code Sample:**

```bash
curl -X POST "https://{your-site}/api/v1/diagnosis/delete-portscan-target" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json" \
  -d '{
    "project_id": 1,
    "portscan_target_id": 1
  }'
```

**Response:**

Status: `200 OK`

```json
{
  "success": {}
}
```

## Application Scan

### List Application Scans

List all application scans for a diagnosis data source.

**Endpoint:** `GET /list-application-scan`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | query | Yes | Project ID |
| diagnosis_data_source_id | number | query | Yes | Diagnosis data source ID |

**Code Sample:**

```bash
curl -X GET "https://{your-site}/api/v1/diagnosis/list-application-scan?project_id=1&diagnosis_data_source_id=1001" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json"
```

**Response:**

Status: `200 OK`

```json
{
  "success": {
    "application_scan": [
      {
        "application_scan_id": 1,
        "project_id": 1,
        "diagnosis_data_source_id": 1001,
        "name": "Web Application Security Scan",
        "status": 1,
        "status_detail": "Scan completed",
        "scan_at": 1640995200,
        "created_at": 1640995200,
        "updated_at": 1640995200,
        "scan_type": 1
      }
    ]
  }
}
```

### Create/Update Application Scan

Create or update an application scan configuration.

**Endpoint:** `POST /put-application-scan`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | body | Yes | Project ID |
| application_scan | object | body | Yes | Application scan configuration |
| application_scan.application_scan_id | number | body | No | Application scan ID (for updates) |
| application_scan.project_id | number | body | Yes | Project ID |
| application_scan.diagnosis_data_source_id | number | body | Yes | Diagnosis data source ID |
| application_scan.name | string | body | Yes | Scan name |
| application_scan.status | number | body | No | Status (0=UNKNOWN, 1=OK, 2=CONFIGURED, 3=IN_PROGRESS, 4=ERROR) |
| application_scan.status_detail | string | body | No | Status detail message |
| application_scan.scan_at | number | body | No | Unix timestamp of last scan |
| application_scan.scan_type | number | body | Yes | Scan type (0=NOT_CONFIGURED, 1=BASIC) |

**Code Sample:**

```bash
curl -X POST "https://{your-site}/api/v1/diagnosis/put-application-scan" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json" \
  -d '{
    "project_id": 1,
    "application_scan": {
      "project_id": 1,
      "diagnosis_data_source_id": 1001,
      "name": "Web Application Security Scan",
      "status": 2,
      "scan_type": 1
    }
  }'
```

**Response:**

Status: `200 OK`

```json
{
  "success": {
    "application_scan": {
      "application_scan_id": 1,
      "project_id": 1,
      "diagnosis_data_source_id": 1001,
      "name": "Web Application Security Scan",
      "status": 2,
      "status_detail": "Configured",
      "scan_at": 0,
      "created_at": 1640995200,
      "updated_at": 1640995200,
      "scan_type": 1
    }
  }
}
```

### Delete Application Scan

Delete an application scan configuration.

**Endpoint:** `POST /delete-application-scan`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | body | Yes | Project ID |
| application_scan_id | number | body | Yes | Application scan ID to delete |

**Code Sample:**

```bash
curl -X POST "https://{your-site}/api/v1/diagnosis/delete-application-scan" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json" \
  -d '{
    "project_id": 1,
    "application_scan_id": 1
  }'
```

**Response:**

Status: `200 OK`

```json
{
  "success": {}
}
```

## Application Scan Basic Settings

### Get Application Scan Basic Setting

Get basic settings for an application scan.

**Endpoint:** `GET /get-application-scan-basic-setting`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | query | Yes | Project ID |
| application_scan_id | number | query | Yes | Application scan ID |

**Code Sample:**

```bash
curl -X GET "https://{your-site}/api/v1/diagnosis/get-application-scan-basic-setting?project_id=1&application_scan_id=1" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json"
```

**Response:**

Status: `200 OK`

```json
{
  "success": {
    "application_scan_basic_setting": {
      "application_scan_basic_setting_id": 1,
      "application_scan_id": 1,
      "project_id": 1,
      "target": "https://example.com",
      "max_depth": 3,
      "max_children": 10,
      "created_at": 1640995200,
      "updated_at": 1640995200
    }
  }
}
```

### Create/Update Application Scan Basic Setting

Create or update basic settings for an application scan.

**Endpoint:** `POST /put-application-scan-basic-setting`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | body | Yes | Project ID |
| application_scan_basic_setting | object | body | Yes | Application scan basic setting configuration |
| application_scan_basic_setting.application_scan_basic_setting_id | number | body | No | Setting ID (for updates) |
| application_scan_basic_setting.application_scan_id | number | body | Yes | Application scan ID |
| application_scan_basic_setting.project_id | number | body | Yes | Project ID |
| application_scan_basic_setting.target | string | body | Yes | Target URL |
| application_scan_basic_setting.max_depth | number | body | Yes | Maximum crawl depth |
| application_scan_basic_setting.max_children | number | body | Yes | Maximum child pages per level |

**Code Sample:**

```bash
curl -X POST "https://{your-site}/api/v1/diagnosis/put-application-scan-basic-setting" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json" \
  -d '{
    "project_id": 1,
    "application_scan_basic_setting": {
      "application_scan_id": 1,
      "project_id": 1,
      "target": "https://example.com",
      "max_depth": 3,
      "max_children": 10
    }
  }'
```

**Response:**

Status: `200 OK`

```json
{
  "success": {
    "application_scan_basic_setting": {
      "application_scan_basic_setting_id": 1,
      "application_scan_id": 1,
      "project_id": 1,
      "target": "https://example.com",
      "max_depth": 3,
      "max_children": 10,
      "created_at": 1640995200,
      "updated_at": 1640995200
    }
  }
}
```

### Delete Application Scan Basic Setting

Delete basic settings for an application scan.

**Endpoint:** `POST /delete-application-scan-basic-setting`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | body | Yes | Project ID |
| application_scan_basic_setting_id | number | body | Yes | Application scan basic setting ID to delete |

**Code Sample:**

```bash
curl -X POST "https://{your-site}/api/v1/diagnosis/delete-application-scan-basic-setting" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json" \
  -d '{
    "project_id": 1,
    "application_scan_basic_setting_id": 1
  }'
```

**Response:**

Status: `200 OK`

```json
{
  "success": {}
}
```

## Scan Operations

### Invoke Scan

Trigger a security scan for a specific setting.

**Endpoint:** `POST /invoke-scan`

**Parameters:**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | number | body | Yes | Project ID |
| setting_id | number | body | Yes | Setting ID (WPScan, Portscan, or Application scan setting ID) |
| diagnosis_data_source_id | number | body | Yes | Diagnosis data source ID |
| scan_only | boolean | body | No | If true, only perform scan without generating findings |

**Code Sample:**

```bash
curl -X POST "https://{your-site}/api/v1/diagnosis/invoke-scan" \
  -H "Authorization: Bearer {your-access-token}" \
  -H "Content-Type: application/json" \
  -d '{
    "project_id": 1,
    "setting_id": 1,
    "diagnosis_data_source_id": 1001,
    "scan_only": false
  }'
```

**Response:**

Status: `200 OK`

```json
{
  "success": {
    "message": "Scan initiated successfully"
  }
}
```

## Status Codes

The following status codes are used throughout the Diagnosis API:

| Code | Name | Description |
|------|------|-------------|
| 0 | UNKNOWN | Status is unknown |
| 1 | OK | Operation completed successfully |
| 2 | CONFIGURED | Resource is configured but not yet executed |
| 3 | IN_PROGRESS | Operation is currently in progress |
| 4 | ERROR | An error occurred during operation |

## Application Scan Types

The following scan types are available for application scans:

| Code | Name | Description |
|------|------|-------------|
| 0 | NOT_CONFIGURED | Scan type is not configured |
| 1 | BASIC | Basic application security scan |

## Error Responses

All endpoints may return the following error responses:

**Status: `400 Bad Request`**

```json
{
  "error": "Invalid request parameters"
}
```

**Status: `401 Unauthorized`**

```json
{
  "error": "Authentication required"
}
```

**Status: `403 Forbidden`**

```json
{
  "error": "Insufficient permissions"
}
```

**Status: `404 Not Found`**

```json
{
  "error": "Resource not found"
}
```

**Status: `500 Internal Server Error`**

```json
{
  "error": "InternalServerError"
}
```
