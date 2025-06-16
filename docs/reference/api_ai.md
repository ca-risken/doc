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
| `question` | string | body | yes | AIに送信する質問（最小長1文字） |
| `chat_history` | array | body | no | チャット履歴の配列 |
| `chat_history[].role` | string | body | no | チャットの役割（CHAT_ROLE_USER, CHAT_ROLE_ASSISTANT, CHAT_ROLE_SYSTEM, CHAT_ROLE_UNSPECIFIED） |
| `chat_history[].content` | string | body | no | チャットの内容 |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{
      "question": "セキュリティリスクは何ですか？",
      "chat_history": [
        {
          "role": "CHAT_ROLE_USER",
          "content": "前回の脆弱性スキャン結果について教えてください"
        },
        {
          "role": "CHAT_ROLE_ASSISTANT", 
          "content": "前回のスキャンでは3つの中程度の脆弱性が検出されました"
        }
      ]
    }' \
    'https://{your-site}/api/v1/ai/chat-ai/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "answer": "検出されたセキュリティリスクに基づくと、SQLインジェクションの脆弱性が最も重要な問題です。データベースへの不正アクセスを防ぐため、パラメータ化クエリの実装を推奨します。"
  }
}
```
