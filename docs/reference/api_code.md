# Code API

The Code API allows to manage and control code scanning settings and data sources for security analysis.

---

## ListDataSource

List available code data sources.

### Endpoint

```yaml
GET: /code/list-datasource/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | no | Project ID filter |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/code/list-datasource/?project_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "code_data_source": [
      {
        "id": 1,
        "name": "gitleaks",
        "description": "Secret detection"
      }
    ]
  }
}
```

---

## ListGitHubSetting

List GitHub repository settings for code scanning.

### Endpoint

```yaml
GET: /code/list-github-setting/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/code/list-github-setting/?project_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "github_setting": [
      {
        "github_setting_id": 1001,
        "name": "test-github-setting",
        "project_id": 1001,
        "type": 2,
        "target_resource": "githubsettingtest",
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
  }
}
```

---

## PutGitHubSetting

Insert or update GitHub repository settings.

### Endpoint

```yaml
POST: /code/put-github-setting/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `github_setting.name` | string | body | yes | Setting name |
| `github_setting.project_id` | number | body | yes | Project ID |
| `github_setting.type` | number | body | yes | Repository type |
| `github_setting.target_resource` | string | body | yes | Target repository resource |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "github_setting": {"name":"test-github-setting", "project_id":1001, "type":2, "target_resource":"githubsettingtest"}}' \
    'https://{your-site}/api/v1/code/put-github-setting/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "github_setting": {
      "github_setting_id": 1001,
      "name": "test-github-setting",
      "project_id": 1001,
      "type": 2,
      "target_resource": "githubsettingtest",
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## DeleteGitHubSetting

Delete GitHub repository settings.

### Endpoint

```yaml
POST: /code/delete-github-setting/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `github_setting_id` | number | body | yes | GitHub setting ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "github_setting_id":1001}' \
    'https://{your-site}/api/v1/code/delete-github-setting/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListGitleaksCache

List Gitleaks scan cache data.

### Endpoint

```yaml
GET: /code/list-gitleaks-cache/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |
| `github_setting_id` | number | query | no | GitHub setting ID filter |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/code/list-gitleaks-cache/?project_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "gitleaks_cache": [
      {
        "gitleaks_cache_id": 1001,
        "github_setting_id": 1001,
        "repository_pattern": "example/*",
        "scan_at": 1629337534,
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
  }
}
```

---

## PutGitleaksSetting

Insert or update Gitleaks scan settings.

### Endpoint

```yaml
POST: /code/put-gitleaks-setting/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `gitleaks_setting.github_setting_id` | number | body | yes | GitHub setting ID |
| `gitleaks_setting.code_data_source_id` | number | body | yes | Code data source ID |
| `gitleaks_setting.project_id` | number | body | yes | Project ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "gitleaks_setting": {"github_setting_id":1001,"code_data_source_id":1001, "project_id":1001}}' \
    'https://{your-site}/api/v1/code/put-gitleaks-setting/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "gitleaks_setting": {
      "gitleaks_setting_id": 1001,
      "github_setting_id": 1001,
      "code_data_source_id": 1001,
      "project_id": 1001,
      "status": 1,
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## DeleteGitleaksSetting

Delete Gitleaks scan settings.

### Endpoint

```yaml
POST: /code/delete-gitleaks-setting/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `github_setting_id` | number | body | yes | GitHub setting ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "github_setting_id":1001}' \
    'https://{your-site}/api/v1/code/delete-gitleaks-setting/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## PutDependencySetting

Insert or update dependency scan settings.

### Endpoint

```yaml
POST: /code/put-dependency-setting/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `dependency_setting.github_setting_id` | number | body | yes | GitHub setting ID |
| `dependency_setting.code_data_source_id` | number | body | yes | Code data source ID |
| `dependency_setting.project_id` | number | body | yes | Project ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "dependency_setting": {"github_setting_id":1001,"code_data_source_id":1001, "project_id":1001}}' \
    'https://{your-site}/api/v1/code/put-dependency-setting/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "dependency_setting": {
      "dependency_setting_id": 1001,
      "github_setting_id": 1001,
      "code_data_source_id": 1001,
      "project_id": 1001,
      "status": 1,
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## DeleteDependencySetting

Delete dependency scan settings.

### Endpoint

```yaml
POST: /code/delete-dependency-setting/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `github_setting_id` | number | body | yes | GitHub setting ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "github_setting_id":1001}' \
    'https://{your-site}/api/v1/code/delete-dependency-setting/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## PutCodeScanSetting

Insert or update code scan settings.

### Endpoint

```yaml
POST: /code/put-code-scan-setting/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `code_scan_setting.github_setting_id` | number | body | yes | GitHub setting ID |
| `code_scan_setting.code_data_source_id` | number | body | yes | Code data source ID |
| `code_scan_setting.project_id` | number | body | yes | Project ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "code_scan_setting": {"github_setting_id":1001,"code_data_source_id":1001, "project_id":1001}}' \
    'https://{your-site}/api/v1/code/put-code-scan-setting/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "code_scan_setting": {
      "code_scan_setting_id": 1001,
      "github_setting_id": 1001,
      "code_data_source_id": 1001,
      "project_id": 1001,
      "status": 1,
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## DeleteCodeScanSetting

Delete code scan settings.

### Endpoint

```yaml
POST: /code/delete-code-scan-setting/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `github_setting_id` | number | body | yes | GitHub setting ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "github_setting_id":1001}' \
    'https://{your-site}/api/v1/code/delete-code-scan-setting/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## InvokeScanGitleaks

Invoke Gitleaks security scan.

### Endpoint

```yaml
POST: /code/invoke-scan-gitleaks/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `github_setting_id` | number | body | yes | GitHub setting ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "github_setting_id":1001}' \
    'https://{your-site}/api/v1/code/invoke-scan-gitleaks/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "message": "Gitleaks scan invoked successfully"
  }
}
```

---

## InvokeScanDependency

Invoke dependency vulnerability scan.

### Endpoint

```yaml
POST: /code/invoke-scan-dependency/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `github_setting_id` | number | body | yes | GitHub setting ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "github_setting_id":1001}' \
    'https://{your-site}/api/v1/code/invoke-scan-dependency/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "message": "Dependency scan invoked successfully"
  }
}
```

---

## InvokeScanCodeScan

Invoke general code security scan.

### Endpoint

```yaml
POST: /code/invoke-scan-code-scan/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `github_setting_id` | number | body | yes | GitHub setting ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "github_setting_id":1001}' \
    'https://{your-site}/api/v1/code/invoke-scan-code-scan/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "message": "Code scan invoked successfully"
  }
}
```
