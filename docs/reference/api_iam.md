# IAM API

IAM APIは、ユーザー、ロール、ポリシー、アクセストークンの管理を行うためのAPIです。

## 認証

すべてのIAM APIエンドポイントは、Bearerトークンによる認証が必要です。

```bash
--header 'Authorization: Bearer xxx'
```

### 認可レベル

IAM APIには以下の認可レベルがあります：

- **一般アクセス**: 基本的なユーザー情報の取得・更新
- **プロジェクト認可**: プロジェクトに関連するリソースの管理（`authzWithProject`）
- **管理者専用**: システム管理者のみがアクセス可能（`authzOnlyAdmin`）

---

## ListUser

ユーザー一覧を取得します。

### エンドポイント

```yaml
GET: /iam/list-user/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `user_id` | number | query | | ユーザーID |
| `sub` | string | query | | ユーザーのサブジェクト |

### コードサンプル

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/list-user/'
```

### レスポンス

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
        "name": "ユーザー名",
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

ユーザー詳細情報を取得します。

### エンドポイント

```yaml
GET: /iam/get-user/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `user_id` | number | query | yes | ユーザーID |

### コードサンプル

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/get-user/?user_id=1001'
```

### レスポンス

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "user": {
      "user_id": 1001,
      "sub": "user-sub-001",
      "name": "ユーザー名",
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

ユーザーが管理者権限を持っているかを確認します。

### エンドポイント

```yaml
GET: /iam/is-admin/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `user_id` | number | query | yes | ユーザーID |

### コードサンプル

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/is-admin/?user_id=1001'
```

### レスポンス

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

ユーザー情報を作成または更新します。

### エンドポイント

```yaml
POST: /iam/put-user/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `user.name` | string | body | yes | ユーザー名 |
| `user.activated` | boolean | body | | アクティベーション状態 |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"user": {"name": "新しいユーザー名", "activated": true}}' \
    'https://{your-site}/api/v1/iam/put-user/'
```

### レスポンス

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "user": {
      "user_id": 1001,
      "sub": "user-sub-001",
      "name": "新しいユーザー名",
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

ロール一覧を取得します。（プロジェクト認可が必要）

### エンドポイント

```yaml
GET: /iam/list-role/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | query | yes | プロジェクトID |
| `role_id` | number | query | | ロールID |
| `name` | string | query | | ロール名 |

### コードサンプル

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/list-role/?project_id=1001'
```

### レスポンス

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

ロール詳細情報を取得します。（プロジェクト認可が必要）

### エンドポイント

```yaml
GET: /iam/get-role/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | query | yes | プロジェクトID |
| `role_id` | number | query | yes | ロールID |

### コードサンプル

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/get-role/?project_id=1001&role_id=1001'
```

### レスポンス

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

ロールを作成または更新します。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/put-role/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `role.name` | string | body | yes | ロール名 |
| `role.project_id` | number | body | yes | プロジェクトID |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "role": {"name": "editor", "project_id": 1001}}' \
    'https://{your-site}/api/v1/iam/put-role/'
```

### レスポンス

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

ロールを削除します。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/delete-role/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `role_id` | number | body | yes | ロールID |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "role_id": 1002}' \
    'https://{your-site}/api/v1/iam/delete-role/'
```

### レスポンス

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## AttachRole

ユーザーにロールを割り当てます。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/attach-role/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `user_id` | number | body | yes | ユーザーID |
| `role_id` | number | body | yes | ロールID |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "user_id": 1001, "role_id": 1001}' \
    'https://{your-site}/api/v1/iam/attach-role/'
```

### レスポンス

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

ユーザーからロールを削除します。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/detach-role/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `user_id` | number | body | yes | ユーザーID |
| `role_id` | number | body | yes | ロールID |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "user_id": 1001, "role_id": 1001}' \
    'https://{your-site}/api/v1/iam/detach-role/'
```

### レスポンス

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListPolicy

ポリシー一覧を取得します。（プロジェクト認可が必要）

### エンドポイント

```yaml
GET: /iam/list-policy/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | query | yes | プロジェクトID |
| `policy_id` | number | query | | ポリシーID |
| `name` | string | query | | ポリシー名 |

### コードサンプル

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/list-policy/?project_id=1001'
```

### レスポンス

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

ポリシー詳細情報を取得します。（プロジェクト認可が必要）

### エンドポイント

```yaml
GET: /iam/get-policy/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | query | yes | プロジェクトID |
| `policy_id` | number | query | yes | ポリシーID |

### コードサンプル

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/get-policy/?project_id=1001&policy_id=1001'
```

### レスポンス

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

ポリシーを作成または更新します。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/put-policy/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `policy.name` | string | body | yes | ポリシー名 |
| `policy.project_id` | number | body | yes | プロジェクトID |
| `policy.action_ptn` | string | body | yes | アクションパターン |
| `policy.resource_ptn` | string | body | yes | リソースパターン |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "policy": {"name": "WritePolicy", "project_id": 1001, "action_ptn": "finding:*", "resource_ptn": "*"}}' \
    'https://{your-site}/api/v1/iam/put-policy/'
```

### レスポンス

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

ポリシーを削除します。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/delete-policy/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `policy_id` | number | body | yes | ポリシーID |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "policy_id": 1002}' \
    'https://{your-site}/api/v1/iam/delete-policy/'
```

### レスポンス

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## AttachPolicy

ロールにポリシーを割り当てます。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/attach-policy/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `role_id` | number | body | yes | ロールID |
| `policy_id` | number | body | yes | ポリシーID |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "role_id": 1001, "policy_id": 1001}' \
    'https://{your-site}/api/v1/iam/attach-policy/'
```

### レスポンス

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

ロールからポリシーを削除します。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/detach-policy/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `role_id` | number | body | yes | ロールID |
| `policy_id` | number | body | yes | ポリシーID |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "role_id": 1001, "policy_id": 1001}' \
    'https://{your-site}/api/v1/iam/detach-policy/'
```

### レスポンス

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListAccessToken

アクセストークン一覧を取得します。（プロジェクト認可が必要）

### エンドポイント

```yaml
GET: /iam/list-access-token/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | query | yes | プロジェクトID |
| `access_token_id` | number | query | | アクセストークンID |
| `name` | string | query | | トークン名 |

### コードサンプル

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/list-access-token/?project_id=1001'
```

### レスポンス

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
        "description": "API用トークン",
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

新しいアクセストークンを生成します。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/generate-access-token/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `access_token.name` | string | body | yes | トークン名 |
| `access_token.description` | string | body | | トークンの説明 |
| `access_token.project_id` | number | body | yes | プロジェクトID |
| `access_token.expired_at` | number | body | yes | 有効期限（Unix timestamp） |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "access_token": {"name": "new-api-token", "description": "新しいAPIトークン", "project_id": 1001, "expired_at": 1660873534}}' \
    'https://{your-site}/api/v1/iam/generate-access-token/'
```

### レスポンス

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

アクセストークンを更新します。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/update-access-token/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `access_token.access_token_id` | number | body | yes | アクセストークンID |
| `access_token.name` | string | body | | トークン名 |
| `access_token.description` | string | body | | トークンの説明 |
| `access_token.expired_at` | number | body | | 有効期限（Unix timestamp） |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "access_token": {"access_token_id": 1002, "name": "updated-api-token", "description": "更新されたAPIトークン"}}' \
    'https://{your-site}/api/v1/iam/update-access-token/'
```

### レスポンス

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "access_token": {
      "access_token_id": 1002,
      "name": "updated-api-token",
      "description": "更新されたAPIトークン",
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

アクセストークンを削除します。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/delete-access-token/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `access_token_id` | number | body | yes | アクセストークンID |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "access_token_id": 1002}' \
    'https://{your-site}/api/v1/iam/delete-access-token/'
```

### レスポンス

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## AttachAccessToken

アクセストークンにロールを割り当てます。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/attach-access-token/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `access_token_id` | number | body | yes | アクセストークンID |
| `role_id` | number | body | yes | ロールID |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "access_token_id": 1001, "role_id": 1001}' \
    'https://{your-site}/api/v1/iam/attach-access-token/'
```

### レスポンス

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

アクセストークンからロールを削除します。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/detach-access-token/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `access_token_id` | number | body | yes | アクセストークンID |
| `role_id` | number | body | yes | ロールID |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "access_token_id": 1001, "role_id": 1001}' \
    'https://{your-site}/api/v1/iam/detach-access-token/'
```

### レスポンス

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## ListUserReserved

予約ユーザー一覧を取得します。（プロジェクト認可が必要）

### エンドポイント

```yaml
GET: /iam/list-user-reserved/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | query | yes | プロジェクトID |
| `reserved_id` | number | query | | 予約ID |

### コードサンプル

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/iam/list-user-reserved/?project_id=1001'
```

### レスポンス

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

予約ユーザーを作成または更新します。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/put-user-reserved/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `user_reserved.user_idp_key` | string | body | yes | ユーザーIDPキー |
| `user_reserved.role_id` | number | body | yes | ロールID |
| `user_reserved.project_id` | number | body | yes | プロジェクトID |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "user_reserved": {"user_idp_key": "new-reserved-user", "role_id": 1001, "project_id": 1001}}' \
    'https://{your-site}/api/v1/iam/put-user-reserved/'
```

### レスポンス

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

予約ユーザーを削除します。（プロジェクト認可が必要）

### エンドポイント

```yaml
POST: /iam/delete-user-reserved/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `project_id` | number | body | yes | プロジェクトID |
| `reserved_id` | number | body | yes | 予約ID |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"project_id": 1001, "reserved_id": 1002}' \
    'https://{your-site}/api/v1/iam/delete-user-reserved/'
```

### レスポンス

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## UpdateUserAdmin

ユーザーの管理者権限を更新します。（管理者専用）

### エンドポイント

```yaml
POST: /admin/update-user-admin/
```

### パラメータ

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `user_id` | number | body | yes | ユーザーID |
| `admin` | boolean | body | yes | 管理者権限の有無 |

### コードサンプル

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"user_id": 1001, "admin": true}' \
    'https://{your-site}/api/v1/admin/update-user-admin/'
```

### レスポンス

```yaml
Status: 200 OK
```

```json
{
  "data": {
    "user": {
      "user_id": 1001,
      "sub": "user-sub-001",
      "name": "ユーザー名",
      "user_idp_key": "idp-key-001",
      "activated": true,
      "admin": true,
      "created_at": 1629337534,
      "updated_at": 1629947204
    }
  }
}
```
