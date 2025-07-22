# AWS API

The AWS API allows to manage and control AWS account configurations and data source attachments for security scanning.

---

## ListAWS

List AWS accounts registered in the project.

### Endpoint

```yaml
GET: /aws/list-aws/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |
| `aws_id` | number | query | | AWS account ID for filtering |
| `aws_account_id` | string | query | | 12-digit AWS account ID for filtering |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/aws/list-aws/?project_id=1001&aws_account_id=123456789012'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "aws": [
      {
        "aws_id": 1001,
        "name": "Production AWS Account",
        "project_id": 1001,
        "aws_account_id": "123456789012",
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
  }
}
```

---

## PutAWS

Insert or update AWS account configuration.

### Endpoint

```yaml
POST: /aws/put-aws/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `aws.name` | string | body | yes | AWS account name |
| `aws.project_id` | number | body | yes | Project ID |
| `aws.aws_account_id` | string | body | yes | 12-digit AWS account ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "aws":{"name":"Production AWS Account", "project_id":1001, "aws_account_id":"123456789012"}}' \
    'https://{your-site}/api/v1/aws/put-aws/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "aws": {
      "aws_id": 1001,
      "name": "Production AWS Account",
      "project_id": 1001,
      "aws_account_id": "123456789012",
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## DeleteAWS

Delete AWS account configuration.

### Endpoint

```yaml
POST: /aws/delete-aws/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `aws_id` | number | body | yes | AWS account ID to delete |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "aws_id":1001}' \
    'https://{your-site}/api/v1/aws/delete-aws/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListDataSource

List available data sources for AWS scanning.

### Endpoint

```yaml
GET: /aws/list-datasource/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |
| `aws_id` | number | query | | AWS account ID for filtering |
| `data_source` | string | query | | Data source name for filtering |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/aws/list-datasource/?project_id=1001&aws_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "data_source": [
      {
        "aws_data_source_id": 1001,
        "data_source": "aws:guard-duty",
        "max_score": 10.0,
        "aws_id": 1001,
        "project_id": 1001,
        "assume_role_arn": "arn:aws:iam::123456789012:role/RiskenRole",
        "external_id": "unique-external-id",
        "status": 1,
        "status_detail": "OK",
        "scan_at": 1629337534,
        "specific_version": "v1.0.0"
      }
    ]
  }
}
```

---

## AttachDataSource

Attach a data source to AWS account for scanning.

### Endpoint

```yaml
POST: /aws/attach-datasource/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `attach_data_source.aws_id` | number | body | yes | AWS account ID |
| `attach_data_source.aws_data_source_id` | number | body | yes | AWS data source ID |
| `attach_data_source.project_id` | number | body | yes | Project ID |
| `attach_data_source.assume_role_arn` | string | body | yes | IAM role ARN for assume role |
| `attach_data_source.external_id` | string | body | yes | External ID for assume role |
| `attach_data_source.status` | number | body | | Status (1: OK, 2: CONFIGURED, 3: IN_PROGRESS, 4: ERROR) |
| `attach_data_source.status_detail` | string | body | | Status detail message |
| `attach_data_source.scan_at` | number | body | | Last scan timestamp |
| `attach_data_source.specific_version` | string | body | | Specific version |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "attach_data_source":{"aws_id":1001, "aws_data_source_id":1001, "project_id":1001, "assume_role_arn":"arn:aws:iam::123456789012:role/RiskenRole", "external_id":"unique-external-id", "status":1, "status_detail":"OK"}}' \
    'https://{your-site}/api/v1/aws/attach-datasource/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "data_source": {
      "aws_id": 1001,
      "aws_data_source_id": 1001,
      "project_id": 1001,
      "assume_role_arn": "arn:aws:iam::123456789012:role/RiskenRole",
      "external_id": "unique-external-id",
      "status": 1,
      "status_detail": "OK",
      "scan_at": 1629337534,
      "created_at": 1629337534,
      "updated_at": 1629337534,
      "specific_version": "v1.0.0"
    }
  }
}
```

---

## DetachDataSource

Detach a data source from AWS account.

### Endpoint

```yaml
POST: /aws/detach-datasource/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `aws_id` | number | body | yes | AWS account ID |
| `aws_data_source_id` | number | body | yes | AWS data source ID to detach |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "aws_id":1001, "aws_data_source_id":1001}' \
    'https://{your-site}/api/v1/aws/detach-datasource/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## InvokeScan

Trigger security scan for AWS data source.

### Endpoint

```yaml
POST: /aws/invoke-scan/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `aws_id` | number | body | yes | AWS account ID |
| `aws_data_source_id` | number | body | yes | AWS data source ID to scan |
| `scan_only` | boolean | body | | If true, only scan without storing results |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "aws_id":1001, "aws_data_source_id":1001, "scan_only":false}' \
    'https://{your-site}/api/v1/aws/invoke-scan/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
