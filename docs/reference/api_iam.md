# IAM API

The IAM API provides management capabilities for users, roles, policies, and access tokens.

## Authentication

All IAM API endpoints require Bearer token authentication.

```bash
--header 'Authorization: Bearer xxx'
```

### Authorization Levels

The IAM API has the following authorization levels:

- **General Access**: Basic user information retrieval and updates
- **Project Authorization**: Management of project-related resources (`authzWithProject`)
- **Admin Only**: Accessible only to system administrators (`authzOnlyAdmin`)

---

## ListUser

Retrieve a list of users.

### Endpoint

```yaml
GET: /iam/list-user/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `user_id` | number | query | | User ID |
| `sub` | string | query | | User subject |

### Code Sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/list-user/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "user": [
      {
        "user_id": 1001,
        "sub": "user-sub-001",
        "name": "User Name",
        "user_idp_key": "idp-key-001",
        "activated": true,
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
  }
}
```

---

## GetUser

Retrieve detailed user information.

### Endpoint

```yaml
GET: /iam/get-user/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `user_id` | number | query | yes | User ID |

### Code Sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/get-user/?user_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "user": {
      "user_id": 1001,
      "sub": "user-sub-001",
      "name": "User Name",
      "user_idp_key": "idp-key-001",
      "activated": true,
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## IsAdmin

Check if a user has administrator privileges.

### Endpoint

```yaml
GET: /iam/is-admin/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `user_id` | number | query | yes | User ID |

### Code Sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/is-admin/?user_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "admin": true
  }
}
```

---

## PutUser

Create or update user information.

### Endpoint

```yaml
POST: /iam/put-user/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `user.name` | string | body | yes | User name |
| `user.activated` | boolean | body | | Activation status |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"user": {"name": "New User Name", "activated": true}}' \
    'https://{your-site}/api/v1/iam/put-user/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "user": {
      "user_id": 1001,
      "sub": "user-sub-001",
      "name": "New User Name",
      "user_idp_key": "idp-key-001",
      "activated": true,
      "created_at": 1629337534,
      "updated_at": 1629947204
    }
  }
}
```

---

## ListRole

Retrieve a list of roles. (Project authorization required)

### Endpoint

```yaml
GET: /iam/list-role/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |
| `role_id` | number | query | | Role ID |
| `name` | string | query | | Role name |

### Code Sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/list-role/?project_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "role": [
      {
        "role_id": 1001,
        "name": "admin",
        "project_id": 1001,
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
  }
}
```

---

## GetRole

Retrieve detailed role information. (Project authorization required)

### Endpoint

```yaml
GET: /iam/get-role/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |
| `role_id` | number | query | yes | Role ID |

### Code Sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/get-role/?project_id=1001&role_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "role": {
      "role_id": 1001,
      "name": "admin",
      "project_id": 1001,
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## PutRole

Create or update a role. (Project authorization required)

### Endpoint

```yaml
POST: /iam/put-role/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `role.name` | string | body | yes | Role name |
| `role.project_id` | number | body | yes | Project ID |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "role": {"name": "editor", "project_id": 1001}}' \
    'https://{your-site}/api/v1/iam/put-role/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "role": {
      "role_id": 1002,
      "name": "editor",
      "project_id": 1001,
      "created_at": 1629947204,
      "updated_at": 1629947204
    }
  }
}
```

---

## DeleteRole

Delete a role. (Project authorization required)

### Endpoint

```yaml
POST: /iam/delete-role/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `role_id` | number | body | yes | Role ID |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "role_id": 1002}' \
    'https://{your-site}/api/v1/iam/delete-role/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## AttachRole

Assign a role to a user. (Project authorization required)

### Endpoint

```yaml
POST: /iam/attach-role/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `user_id` | number | body | yes | User ID |
| `role_id` | number | body | yes | Role ID |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "user_id": 1001, "role_id": 1001}' \
    'https://{your-site}/api/v1/iam/attach-role/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "user_role": {
      "user_id": 1001,
      "role_id": 1001,
      "project_id": 1001,
      "created_at": 1629947204,
      "updated_at": 1629947204
    }
  }
}
```

---

## DetachRole

Remove a role from a user. (Project authorization required)

### Endpoint

```yaml
POST: /iam/detach-role/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `user_id` | number | body | yes | User ID |
| `role_id` | number | body | yes | Role ID |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "user_id": 1001, "role_id": 1001}' \
    'https://{your-site}/api/v1/iam/detach-role/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListPolicy

Retrieve a list of policies. (Project authorization required)

### Endpoint

```yaml
GET: /iam/list-policy/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |
| `policy_id` | number | query | | Policy ID |
| `name` | string | query | | Policy name |

### Code Sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/list-policy/?project_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "policy": [
      {
        "policy_id": 1001,
        "name": "ReadOnlyPolicy",
        "project_id": 1001,
        "action_ptn": "finding:ListFinding",
        "resource_ptn": "*",
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
  }
}
```

---

## GetPolicy

Retrieve detailed policy information. (Project authorization required)

### Endpoint

```yaml
GET: /iam/get-policy/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |
| `policy_id` | number | query | yes | Policy ID |

### Code Sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/get-policy/?project_id=1001&policy_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "policy": {
      "policy_id": 1001,
      "name": "ReadOnlyPolicy",
      "project_id": 1001,
      "action_ptn": "finding:ListFinding",
      "resource_ptn": "*",
      "created_at": 1629337534,
      "updated_at": 1629337534
    }
  }
}
```

---

## PutPolicy

Create or update a policy. (Project authorization required)

### Endpoint

```yaml
POST: /iam/put-policy/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `policy.name` | string | body | yes | Policy name |
| `policy.project_id` | number | body | yes | Project ID |
| `policy.action_ptn` | string | body | yes | Action pattern |
| `policy.resource_ptn` | string | body | yes | Resource pattern |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "policy": {"name": "WritePolicy", "project_id": 1001, "action_ptn": "finding:*", "resource_ptn": "*"}}' \
    'https://{your-site}/api/v1/iam/put-policy/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "policy": {
      "policy_id": 1002,
      "name": "WritePolicy",
      "project_id": 1001,
      "action_ptn": "finding:*",
      "resource_ptn": "*",
      "created_at": 1629947204,
      "updated_at": 1629947204
    }
  }
}
```

---

## DeletePolicy

Delete a policy. (Project authorization required)

### Endpoint

```yaml
POST: /iam/delete-policy/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `policy_id` | number | body | yes | Policy ID |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "policy_id": 1002}' \
    'https://{your-site}/api/v1/iam/delete-policy/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## AttachPolicy

Assign a policy to a role. (Project authorization required)

### Endpoint

```yaml
POST: /iam/attach-policy/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `role_id` | number | body | yes | Role ID |
| `policy_id` | number | body | yes | Policy ID |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "role_id": 1001, "policy_id": 1001}' \
    'https://{your-site}/api/v1/iam/attach-policy/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "role_policy": {
      "role_id": 1001,
      "policy_id": 1001,
      "project_id": 1001,
      "created_at": 1629947204,
      "updated_at": 1629947204
    }
  }
}
```

---

## DetachPolicy

Remove a policy from a role. (Project authorization required)

### Endpoint

```yaml
POST: /iam/detach-policy/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `role_id` | number | body | yes | Role ID |
| `policy_id` | number | body | yes | Policy ID |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "role_id": 1001, "policy_id": 1001}' \
    'https://{your-site}/api/v1/iam/detach-policy/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListAccessToken

Retrieve a list of access tokens. (Project authorization required)

### Endpoint

```yaml
GET: /iam/list-access-token/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |
| `access_token_id` | number | query | | Access token ID |
| `name` | string | query | | Token name |

### Code Sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/list-access-token/?project_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "access_token": [
      {
        "access_token_id": 1001,
        "name": "api-token-001",
        "description": "API token",
        "project_id": 1001,
        "expired_at": 1660873534,
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
  }
}
```

---

## GenerateAccessToken

Generate a new access token. (Project authorization required)

### Endpoint

```yaml
POST: /iam/generate-access-token/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `access_token.name` | string | body | yes | Token name |
| `access_token.description` | string | body | | Token description |
| `access_token.project_id` | number | body | yes | Project ID |
| `access_token.expired_at` | number | body | yes | Expiration time (Unix timestamp) |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "access_token": {"name": "new-api-token", "description": "New API token", "project_id": 1001, "expired_at": 1660873534}}' \
    'https://{your-site}/api/v1/iam/generate-access-token/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "access_token_id": 1002,
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }
}
```

---

## UpdateAccessToken

Update an access token. (Project authorization required)

### Endpoint

```yaml
POST: /iam/update-access-token/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `access_token.access_token_id` | number | body | yes | Access token ID |
| `access_token.name` | string | body | | Token name |
| `access_token.description` | string | body | | Token description |
| `access_token.expired_at` | number | body | | Expiration time (Unix timestamp) |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "access_token": {"access_token_id": 1002, "name": "updated-api-token", "description": "Updated API token"}}' \
    'https://{your-site}/api/v1/iam/update-access-token/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "access_token": {
      "access_token_id": 1002,
      "name": "updated-api-token",
      "description": "Updated API token",
      "project_id": 1001,
      "expired_at": 1660873534,
      "created_at": 1629337534,
      "updated_at": 1629947204
    }
  }
}
```

---

## DeleteAccessToken

Delete an access token. (Project authorization required)

### Endpoint

```yaml
POST: /iam/delete-access-token/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `access_token_id` | number | body | yes | Access token ID |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "access_token_id": 1002}' \
    'https://{your-site}/api/v1/iam/delete-access-token/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## AttachAccessToken

Assign a role to an access token. (Project authorization required)

### Endpoint

```yaml
POST: /iam/attach-access-token/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `access_token_id` | number | body | yes | Access token ID |
| `role_id` | number | body | yes | Role ID |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "access_token_id": 1001, "role_id": 1001}' \
    'https://{your-site}/api/v1/iam/attach-access-token/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "access_token_role": {
      "access_token_id": 1001,
      "role_id": 1001,
      "project_id": 1001,
      "created_at": 1629947204,
      "updated_at": 1629947204
    }
  }
}
```

---

## DetachAccessToken

Remove a role from an access token. (Project authorization required)

### Endpoint

```yaml
POST: /iam/detach-access-token/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `access_token_id` | number | body | yes | Access token ID |
| `role_id` | number | body | yes | Role ID |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "access_token_id": 1001, "role_id": 1001}' \
    'https://{your-site}/api/v1/iam/detach-access-token/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListUserReserved

Retrieve a list of reserved users. (Project authorization required)

### Endpoint

```yaml
GET: /iam/list-user-reserved/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | query | yes | Project ID |
| `reserved_id` | number | query | | Reserved ID |

### Code Sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/list-user-reserved/?project_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "user_reserved": [
      {
        "reserved_id": 1001,
        "user_idp_key": "reserved-user-001",
        "role_id": 1001,
        "project_id": 1001,
        "created_at": 1629337534,
        "updated_at": 1629337534
      }
    ]
  }
}
```

---

## PutUserReserved

Create or update a reserved user. (Project authorization required)

### Endpoint

```yaml
POST: /iam/put-user-reserved/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `user_reserved.user_idp_key` | string | body | yes | User IDP key |
| `user_reserved.role_id` | number | body | yes | Role ID |
| `user_reserved.project_id` | number | body | yes | Project ID |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "user_reserved": {"user_idp_key": "new-reserved-user", "role_id": 1001, "project_id": 1001}}' \
    'https://{your-site}/api/v1/iam/put-user-reserved/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "user_reserved": {
      "reserved_id": 1002,
      "user_idp_key": "new-reserved-user",
      "role_id": 1001,
      "project_id": 1001,
      "created_at": 1629947204,
      "updated_at": 1629947204
    }
  }
}
```

---

## DeleteUserReserved

Delete a reserved user. (Project authorization required)

### Endpoint

```yaml
POST: /iam/delete-user-reserved/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | Project ID |
| `reserved_id` | number | body | yes | Reserved ID |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "reserved_id": 1002}' \
    'https://{your-site}/api/v1/iam/delete-user-reserved/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## UpdateUserAdmin

Update user administrator privileges. (Admin only)

### Endpoint

```yaml
POST: /admin/update-user-admin/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `user_id` | number | body | yes | User ID |
| `admin` | boolean | body | yes | Administrator privilege status |

### Code Sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"user_id": 1001, "admin": true}' \
    'https://{your-site}/api/v1/admin/update-user-admin/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "user": {
      "user_id": 1001,
      "sub": "user-sub-001",
      "name": "User Name",
      "user_idp_key": "idp-key-001",
      "activated": true,
      "admin": true,
      "created_at": 1629337534,
      "updated_at": 1629947204
    }
  }
}
```
