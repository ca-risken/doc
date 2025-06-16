# AI API

Use the AI service API to manage and control chat functionality.

---

## ChatAI

AI chat functionality for security-related questions and analysis.

### Endpoint

```yaml
POST: /ai/chat-ai/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `question` | string | body | yes | Question to send to AI (minimum length 1 character) |
| `chat_history` | array | body | no | Array of chat history |
| `chat_history[].role` | int | body | no | Chat role (1=User message, 2=AI assistant response, 3=System message) |
| `chat_history[].content` | string | body | no | Chat content |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{
      "question": "What are the security risks?",
      "chat_history": [
        {
          "role": 1,
          "content": "Please tell me about the previous vulnerability scan results"
        },
        {
          "role": 2, 
          "content": "The previous scan detected 3 medium-severity vulnerabilities"
        }
      ]
    }'\
    'https://{your-site}/api/v1/ai/chat-ai/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "answer": "Based on the detected security risks, SQL injection vulnerability is the most critical issue. We recommend implementing parameterized queries to prevent unauthorized database access."
  }
}
```
