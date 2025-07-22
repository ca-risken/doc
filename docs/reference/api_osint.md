# OSINT API

OSINT（Open Source Intelligence）APIは、オープンソースインテリジェンス情報の収集と管理を行うためのAPIです。

## 認証

すべてのAPIエンドポイントはBearer認証が必要です。

```
Authorization: Bearer {your-token}
```

## エンドポイント

### ListOsint

OSINT設定の一覧を取得します。

**Endpoint**

```
GET https://{your-site}/api/v1/osint/list-osint/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | query | Yes | プロジェクトID |

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

指定されたOSINT設定の詳細を取得します。

**Endpoint**

```
GET https://{your-site}/api/v1/osint/get-osint/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | query | Yes | プロジェクトID |
| osint_id | integer | query | Yes | OSINT設定ID |

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

OSINT設定を登録または更新します。

**Endpoint**

```
POST https://{your-site}/api/v1/osint/put-osint/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | プロジェクトID |
| osint | object | body | Yes | OSINT設定オブジェクト |
| osint.osint_id | integer | body | No | OSINT設定ID（更新時） |
| osint.project_id | integer | body | Yes | プロジェクトID |
| osint.resource_type | string | body | Yes | リソースタイプ |
| osint.resource_name | string | body | Yes | リソース名 |

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

指定されたOSINT設定を削除します。

**Endpoint**

```
POST https://{your-site}/api/v1/osint/delete-osint/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | プロジェクトID |
| osint_id | integer | body | Yes | OSINT設定ID |

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

OSINTデータソースの一覧を取得します。

**Endpoint**

```
GET https://{your-site}/api/v1/osint/list-datasource/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | query | Yes | プロジェクトID |
| name | string | query | No | データソース名（フィルタ） |

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

OSINTデータソースを登録または更新します。

**Endpoint**

```
POST https://{your-site}/api/v1/osint/put-datasource/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | プロジェクトID |
| osint_data_source | object | body | Yes | OSINTデータソースオブジェクト |
| osint_data_source.osint_data_source_id | integer | body | No | OSINTデータソースID（更新時） |
| osint_data_source.name | string | body | Yes | データソース名 |
| osint_data_source.description | string | body | Yes | データソース説明 |
| osint_data_source.max_score | float | body | Yes | 最大スコア |

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

指定されたOSINTデータソースを削除します。

**Endpoint**

```
POST https://{your-site}/api/v1/osint/delete-datasource/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | プロジェクトID |
| osint_data_source_id | integer | body | Yes | OSINTデータソースID |

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

OSINT関連データソースの一覧を取得します。

**Endpoint**

```
GET https://{your-site}/api/v1/osint/list-rel-datasource/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | query | Yes | プロジェクトID |
| osint_id | integer | query | No | OSINT設定ID（フィルタ） |
| osint_data_source_id | integer | query | No | OSINTデータソースID（フィルタ） |

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

OSINT関連データソースを登録または更新します。

**Endpoint**

```
POST https://{your-site}/api/v1/osint/put-rel-datasource/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | プロジェクトID |
| rel_osint_data_source | object | body | Yes | OSINT関連データソースオブジェクト |
| rel_osint_data_source.rel_osint_data_source_id | integer | body | No | OSINT関連データソースID（更新時） |
| rel_osint_data_source.osint_data_source_id | integer | body | Yes | OSINTデータソースID |
| rel_osint_data_source.osint_id | integer | body | Yes | OSINT設定ID |
| rel_osint_data_source.project_id | integer | body | Yes | プロジェクトID |
| rel_osint_data_source.status | integer | body | Yes | ステータス（0:UNKNOWN, 1:OK, 2:CONFIGURED, 3:IN_PROGRESS, 4:ERROR） |
| rel_osint_data_source.status_detail | string | body | No | ステータス詳細 |
| rel_osint_data_source.scan_at | integer | body | No | スキャン実行時刻 |

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

指定されたOSINT関連データソースを削除します。

**Endpoint**

```
POST https://{your-site}/api/v1/osint/delete-rel-datasource/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | プロジェクトID |
| rel_osint_data_source_id | integer | body | Yes | OSINT関連データソースID |

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

OSINT検知ワードの一覧を取得します。

**Endpoint**

```
GET https://{your-site}/api/v1/osint/list-word/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | query | Yes | プロジェクトID |
| rel_osint_data_source_id | integer | query | No | OSINT関連データソースID（フィルタ） |

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

OSINT検知ワードを登録または更新します。

**Endpoint**

```
POST https://{your-site}/api/v1/osint/put-word/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | プロジェクトID |
| osint_detect_word | object | body | Yes | OSINT検知ワードオブジェクト |
| osint_detect_word.osint_detect_word_id | integer | body | No | OSINT検知ワードID（更新時） |
| osint_detect_word.rel_osint_data_source_id | integer | body | Yes | OSINT関連データソースID |
| osint_detect_word.word | string | body | Yes | 検知ワード |
| osint_detect_word.project_id | integer | body | Yes | プロジェクトID |

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

指定されたOSINT検知ワードを削除します。

**Endpoint**

```
POST https://{your-site}/api/v1/osint/delete-word/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | プロジェクトID |
| osint_detect_word_id | integer | body | Yes | OSINT検知ワードID |

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

OSINTスキャンを実行します。

**Endpoint**

```
POST https://{your-site}/api/v1/osint/invoke-scan/
```

**Parameters**

| Name | Type | In | Required | Description |
|------|------|----|---------|-----------| 
| project_id | integer | body | Yes | プロジェクトID |
| rel_osint_data_source_id | integer | body | Yes | OSINT関連データソースID |
| scan_only | boolean | body | No | スキャンのみ実行するかどうか |

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
