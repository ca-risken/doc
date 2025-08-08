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

---

## GenerateReport

Generate AI-powered security reports based on findings data.

### Endpoint

```yaml
POST: /ai/generate-report/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID (value >= 1) |
| `from_date` | string | body | no | Start date (YYYY-MM-DD format, e.g., 2023-01-01) |
| `to_date` | string | body | no | End date (YYYY-MM-DD format, e.g., 2023-12-31) |
| `data_source` | array | body | no | Array of data sources to include in report |
| `report_type` | string | body | no | Type of report to generate (e.g., "summary", "detailed") |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{
      "project_id": 1001,
      "from_date": "2023-01-01",
      "to_date": "2023-01-31",
      "data_source": ["aws", "gcp"],
      "report_type": "summary"
    }' \
    'https://{your-site}/api/v1/ai/generate-report/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "report": {
      "summary": "This month's security analysis reveals 15 findings across AWS and GCP environments. Critical vulnerabilities include 3 high-severity issues requiring immediate attention.",
      "recommendations": [
        "Implement multi-factor authentication for all admin accounts",
        "Update security groups to restrict unnecessary access",
        "Enable CloudTrail logging for audit compliance"
      ],
      "finding_count": 15,
      "critical_count": 3,
      "high_count": 5,
      "medium_count": 4,
      "low_count": 3
    }
  }
}
```
