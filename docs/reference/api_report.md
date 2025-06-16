# Report API

レポートサービスのAPIエンドポイントについて説明します。

## 認証

すべてのAPIエンドポイントはBearer認証が必要です。

```bash
curl -H "Authorization: Bearer YOUR_ACCESS_TOKEN" \
     https://{your-site}/api/v1/report/get-report
```

## エンドポイント

### GET /api/v1/report/get-report

プロジェクトのレポートを取得します。プロジェクトの認可が必要です。

#### パラメータ

| 名前 | 型 | 場所 | 必須 | 説明 |
|------|----|----|------|------|
| Authorization | string | header | ✓ | Bearer認証トークン |
| project_id | integer | query | ✓ | プロジェクトID |

#### コードサンプル

```bash
curl -X GET "https://{your-site}/api/v1/report/get-report?project_id=1" \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN"
```

#### レスポンス

**ステータスコード: 200**

```json
{
  "success": {
    "report": {
      "project_id": 1,
      "findings": [],
      "created_at": "2024-01-01T00:00:00Z"
    }
  }
}
```

**ステータスコード: 400**

```json
{
  "error": "Bad Request"
}
```

**ステータスコード: 401**

```json
{
  "error": "Unauthorized"
}
```

**ステータスコード: 403**

```json
{
  "error": "Forbidden"
}
```

**ステータスコード: 500**

```json
{
  "error": "InternalServerError"
}
```

### GET /api/v1/report/get-report-all

全プロジェクトのレポートを取得します。管理者権限が必要です。

#### パラメータ

| 名前 | 型 | 場所 | 必須 | 説明 |
|------|----|----|------|------|
| Authorization | string | header | ✓ | Bearer認証トークン（管理者権限） |

#### コードサンプル

```bash
curl -X GET "https://{your-site}/api/v1/report/get-report-all" \
  -H "Authorization: Bearer YOUR_ADMIN_ACCESS_TOKEN"
```

#### レスポンス

**ステータスコード: 200**

```json
{
  "success": {
    "reports": [
      {
        "project_id": 1,
        "findings": [],
        "created_at": "2024-01-01T00:00:00Z"
      }
    ]
  }
}
```

**ステータスコード: 400**

```json
{
  "error": "Bad Request"
}
```

**ステータスコード: 401**

```json
{
  "error": "Unauthorized"
}
```

**ステータスコード: 403**

```json
{
  "error": "Forbidden"
}
```

**ステータスコード: 500**

```json
{
  "error": "InternalServerError"
}
```
