# AI API

The AI API allows to manage and control AI chat functionality.

---

## ChatAI

Chat with AI for security-related questions and analysis.

### Endpoint

```yaml
POST: /ai/chat-ai/
```

### Parameters

| Name | Type | In | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | |
| `message` | string | body | yes | |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "message":"What are the security risks?"}' \
    'https://{your-site}/api/v1/ai/chat-ai/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "response": "Based on the analysis...",
    "created_at": 1629337534
  }
}
```
