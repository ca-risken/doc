# Organization API

The Organization API provides management capabilities for organizations, organization projects, and organization invitations.

---

## ListOrganization

Retrieve a list of organizations.

### Endpoint

```yaml
GET: /organization/list-organization/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `organization_id` | number | query | | Organization ID |
| `name` | string | query | | Organization name (max 64 characters) |
| `user_id` | number | query | | User ID |
| `project_id` | number | query | | Project ID |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/organization/list-organization/?user_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "organization": [
            {
                "organization_id": 1001,
                "name": "sample-organization",
                "description": "Sample organization",
                "created_at": 1629337534,
                "updated_at": 1629337534
            }
        ]
    }
}
```

---

## CreateOrganization

Create a new organization.

### Endpoint

```yaml
POST: /organization/create-organization/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `name` | string | body | yes | Organization name (1-64 characters) |
| `description` | string | body | | Organization description (0-255 characters) |
| `user_id` | number | body | yes | Organization owner's user ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"name":"sample-organization", "description":"Sample organization", "user_id":1001}' \
    'https://{your-site}/api/v1/organization/create-organization/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "organization": {
            "organization_id": 1001,
            "name": "sample-organization",
            "description": "Sample organization",
            "created_at": 1629337534,
            "updated_at": 1629337534
        }
    }
}
```

---

## UpdateOrganization

Update an existing organization. Requires organization-level authorization.

### Endpoint

```yaml
POST: /organization/update-organization/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `organization_id` | number | body | yes | Organization ID |
| `name` | string | body | yes | Organization name (1-64 characters) |
| `description` | string | body | | Organization description (0-255 characters) |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"organization_id":1001, "name":"updated-organization", "description":"Updated description"}' \
    'https://{your-site}/api/v1/organization/update-organization/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "organization": {
            "organization_id": 1001,
            "name": "updated-organization",
            "description": "Updated description",
            "created_at": 1629337534,
            "updated_at": 1629974029
        }
    }
}
```

---

## DeleteOrganization

Delete an organization. Requires organization-level authorization.

### Endpoint

```yaml
POST: /organization/delete-organization/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `organization_id` | number | body | yes | Organization ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"organization_id":1001}' \
    'https://{your-site}/api/v1/organization/delete-organization/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```

---

## CreateProjectWithOrganization

Create a new project under an organization. Requires organization-level authorization.

### Endpoint

```yaml
POST: /organization/create-project-with-organization/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `user_id` | number | body | yes | Project owner's user ID |
| `name` | string | body | yes | Project name (1-64 characters) |
| `organization_id` | number | body | yes | Organization ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"user_id":1001, "name":"new-project", "organization_id":1001}' \
    'https://{your-site}/api/v1/organization/create-project-with-organization/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "project": {
            "project_id": 2001,
            "name": "new-project",
            "created_at": 1629337534,
            "updated_at": 1629337534
        }
    }
}
```

---

## ListOrganizationInvitation

Retrieve a list of organization invitations. Requires organization-level authorization.

### Endpoint

```yaml
GET: /organization/list-organization-invitation/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `organization_id` | number | query | | Organization ID |
| `project_id` | number | query | | Project ID |

### Code sample

```bash
curl -XGET \
    --header 'Authorization: Bearer xxx' \
    'https://{your-site}/api/v1/organization/list-organization-invitation/?organization_id=1001'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "organization_invitations": [
            {
                "organization_id": 1001,
                "project_id": 2001,
                "status": 1,
                "created_at": 1629337534,
                "updated_at": 1629337534
            }
        ]
    }
}
```

???+ info "OrganizationInvitationStatus"
    - `0`: UNKNOWN
    - `1`: PENDING
    - `2`: ACCEPTED
    - `3`: REJECTED

---

## PutOrganizationInvitation

Create or update an organization invitation. Requires organization-level authorization.

### Endpoint

```yaml
POST: /organization/put-organization-invitation/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `organization_id` | number | body | yes | Organization ID |
| `project_id` | number | body | yes | Project ID |
| `status` | number | body | yes | Invitation status for the invitation record. Use `1` (`PENDING`) when sending an organization-side invitation. |

???+ warning "Behavior note"
    `PutOrganizationInvitation` only creates or updates the invitation record.
    Setting `status` to `2` (`ACCEPTED`) or `3` (`REJECTED`) here does not create or remove the organization-project association.
    Association changes are handled by the project-side reply flow or by `CreateProjectWithOrganization`.

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"organization_id":1001, "project_id":2001, "status":1}' \
    'https://{your-site}/api/v1/organization/put-organization-invitation/'
```

### Response

```yaml
Status: 200 OK
```

```json
{
    "data": {
        "organization_invitation": {
            "organization_id": 1001,
            "project_id": 2001,
            "status": 1,
            "created_at": 1629337534,
            "updated_at": 1629337534
        }
    }
}
```

---

## DeleteOrganizationInvitation

Delete an organization invitation. Requires organization-level authorization.

???+ warning "Behavior note"
    If the project is already associated with the organization, this endpoint also removes that organization-project association.
    Use this endpoint only when you intend to delete the invitation and detach the project from the organization, not for invitation metadata cleanup alone.

### Endpoint

```yaml
POST: /organization/delete-organization-invitation/
```

### Parameters

| Name | Type | In | Required | Description |
| ---- | ---- | -- | -------- | ----------- |
| `organization_id` | number | body | yes | Organization ID |
| `project_id` | number | body | yes | Project ID |

### Code sample

```bash
curl -XPOST \
    --header 'Authorization: Bearer xxx' \
    --header 'Content-Type: application/json' \
    --data '{"organization_id":1001, "project_id":2001}' \
    'https://{your-site}/api/v1/organization/delete-organization-invitation/'
```

### Response

```yaml
Status: 200 OK
```

```json
{"data":{}}
```
