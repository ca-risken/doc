# AI API

AIサービスのAPIエンドポイントについて説明します。

## 認証

すべてのAPIエンドポイントはBearer認証が必要です。

```bash
curl -H "Authorization: Bearer YOUR_ACCESS_TOKEN" \
     -H "Content-Type: application/json" \
     https://{your-site}/api/v1/ai/chat-ai
```

## エンドポイント

### POST /api/v1/ai/chat-ai

AIとのチャット機能を提供します。

#### パラメータ

| 名前 | 型 | 場所 | 必須 | 説明 |
|------|----|----|------|------|
| Authorization | string | header | ✓ | Bearer認証トークン |
| Content-Type | string | header | ✓ | application/json |

#### リクエストボディ

```json
{
  "message": "string",
  "project_id": 1
}
```

#### コードサンプル

```bash
curl -X POST https://{your-site}/api/v1/ai/chat-ai \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "セキュリティに関する質問です",
    "project_id": 1
  }'
```

#### レスポンス

**ステータスコード: 200**

```json
{
  "success": {
    "response": "string",
    "created_at": "2024-01-01T00:00:00Z"
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

**ステータスコード: 500**

```json
{
  "error": "InternalServerError"
}
```
