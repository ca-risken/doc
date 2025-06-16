# AI API

AIサービスのAPIを使用してチャット機能を管理および制御できます。

---

## ChatAI

セキュリティ関連の質問と分析のためのAIチャット機能。

### Endpoint

```yaml
POST: /ai/chat-ai/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `message` | string | body | yes | AIに送信するメッセージ |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "message":"セキュリティリスクは何ですか？"}' \
    'https://{your-site}/api/v1/ai/chat-ai/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "response": "分析に基づくと...",
    "created_at": 1629337534
  }
}
```
