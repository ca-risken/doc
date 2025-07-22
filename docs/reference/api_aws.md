# AWS API

The AWS API provides functionality to manage AWS data sources, configure AWS account connections, and retrieve AWS security findings.

RISKEN supports multiple AWS data sources including CloudSploit, GuardDuty, AccessAnalyzer, AdminChecker, and PortScan.

---

## ListAWSAccount

List AWS accounts registered in the project.

### Endpoint

```yaml
GET: /aws/list-aws-account/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |
| `aws_account_id` | string | query | | AWS account ID filter |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/aws/list-aws-account/?project_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "aws_account": [
      {
        "aws_id": 1001,
        "aws_account_id": "123456789012",
        "name": "production-account",
        "project_id": 1001,
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ],
    "count": 1,
    "total": 1
  }
}
```

---

## GetAWSAccount

Get AWS account details.

### Endpoint

```yaml
GET: /aws/get-aws-account/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |
| `aws_id` | number | query | yes | AWS account ID in RISKEN |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/aws/get-aws-account/?project_id=1001&aws_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "aws_account": {
      "aws_id": 1001,
      "aws_account_id": "123456789012",
      "name": "production-account",
      "project_id": 1001,
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## PutAWSAccount

Register or update AWS account.

### Endpoint

```yaml
POST: /aws/put-aws-account/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `aws_account.name` | string | body | yes | Account name |
| `aws_account.aws_account_id` | string | body | yes | AWS account ID (12 digits) |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "aws_account":{"name":"production-account", "aws_account_id":"123456789012"}}' \
    'https://{your-site}/api/v1/aws/put-aws-account/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "aws_account": {
      "aws_id": 1001,
      "aws_account_id": "123456789012",
      "name": "production-account",
      "project_id": 1001,
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## DeleteAWSAccount

Delete AWS account.

### Endpoint

```yaml
POST: /aws/delete-aws-account/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `aws_id` | number | body | yes | AWS account ID in RISKEN |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "aws_id":1001}' \
    'https://{your-site}/api/v1/aws/delete-aws-account/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListAWSDataSource

List AWS data sources (CloudSploit, GuardDuty, AccessAnalyzer, AdminChecker, PortScan).

### Endpoint

```yaml
GET: /aws/list-aws-data-source/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |
| `aws_id` | number | query | yes | AWS account ID in RISKEN |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/aws/list-aws-data-source/?project_id=1001&aws_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "aws_data_source": [
      {
        "aws_data_source_id": 1001,
        "aws_id": 1001,
        "project_id": 1001,
        "data_source": "aws:cloudsploit",
        "max_score": 10.0,
        "assume_role_arn": "arn:aws:iam::123456789012:role/RISKEN",
        "external_id": "external-id-string",
        "status": 1,
        "status_detail": "OK",
        "scan_at": 1629337534,
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ],
    "count": 1,
    "total": 1
  }
}
```

---

## AttachAWSDataSource

Attach AWS data source configuration.

### Endpoint

```yaml
POST: /aws/attach-aws-data-source/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `aws_data_source.aws_id` | number | body | yes | AWS account ID in RISKEN |
| `aws_data_source.data_source` | string | body | yes | Data source type (aws:cloudsploit, aws:guard-duty, etc.) |
| `aws_data_source.assume_role_arn` | string | body | yes | IAM role ARN for AssumeRole |
| `aws_data_source.external_id` | string | body | yes | External ID for AssumeRole |
| `aws_data_source.max_score` | number | body | | Maximum score threshold |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "aws_data_source":{"aws_id":1001, "data_source":"aws:cloudsploit", "assume_role_arn":"arn:aws:iam::123456789012:role/RISKEN", "external_id":"external-id-string", "max_score":10.0}}' \
    'https://{your-site}/api/v1/aws/attach-aws-data-source/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "aws_data_source": {
      "aws_data_source_id": 1001,
      "aws_id": 1001,
      "project_id": 1001,
      "data_source": "aws:cloudsploit",
      "max_score": 10.0,
      "assume_role_arn": "arn:aws:iam::123456789012:role/RISKEN",
      "external_id": "external-id-string",
      "status": 1,
      "status_detail": "OK",
      "scan_at": 1629337534,
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## DetachAWSDataSource

Detach AWS data source configuration.

### Endpoint

```yaml
POST: /aws/detach-aws-data-source/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `aws_data_source_id` | number | body | yes | AWS data source ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "aws_data_source_id":1001}' \
    'https://{your-site}/api/v1/aws/detach-aws-data-source/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## InvokeScanAWS

Trigger AWS security scan.

### Endpoint

```yaml
POST: /aws/invoke-scan-aws/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `aws_data_source_id` | number | body | yes | AWS data source ID |
| `scan_only` | boolean | body | | If true, only scan without storing results |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "aws_data_source_id":1001, "scan_only":false}' \
    'https://{your-site}/api/v1/aws/invoke-scan-aws/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListAWSRelDataSource

List AWS-related data sources (PortScan).

### Endpoint

```yaml
GET: /aws/list-aws-rel-data-source/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |
| `aws_id` | number | query | yes | AWS account ID in RISKEN |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/aws/list-aws-rel-data-source/?project_id=1001&aws_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "aws_rel_data_source": [
      {
        "rel_data_source_id": 1001,
        "aws_id": 1001,
        "project_id": 1001,
        "data_source": "diagnosis:portscan",
        "status": 1,
        "status_detail": "OK",
        "scan_at": 1629337534,
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ],
    "count": 1,
    "total": 1
  }
}
```

---

## AttachAWSRelDataSource

Attach AWS-related data source.

### Endpoint

```yaml
POST: /aws/attach-aws-rel-data-source/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `rel_data_source.aws_id` | number | body | yes | AWS account ID in RISKEN |
| `rel_data_source.data_source` | string | body | yes | Related data source type |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "rel_data_source":{"aws_id":1001, "data_source":"diagnosis:portscan"}}' \
    'https://{your-site}/api/v1/aws/attach-aws-rel-data-source/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "rel_data_source": {
      "rel_data_source_id": 1001,
      "aws_id": 1001,
      "project_id": 1001,
      "data_source": "diagnosis:portscan",
      "status": 1,
      "status_detail": "OK",
      "scan_at": 1629337534,
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## DetachAWSRelDataSource

Detach AWS-related data source.

### Endpoint

```yaml
POST: /aws/detach-aws-rel-data-source/
```

### Parameters

| Name           | Type   | In    | Required | Description |
| -------------- | ------ | ----- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `rel_data_source_id` | number | body | yes | Related data source ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id":1001, "rel_data_source_id":1001}' \
    'https://{your-site}/api/v1/aws/detach-aws-rel-data-source/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```