# Infrastructure(Local) Option

Describes details about fine tuning, etc. in a local environment.

---

## Scan AWS from local environment

AWS requires authentication information (*) to be scanned.
Scanning can be done by passing an AWS IAM user or STS temporary key through environment variables to RISKEN.

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_ACCESS_KEY_ID** | AWS access key ID | | |
| **AWS_SECRET_ACCESS_KEY** | AWS secret key | | |
| **AWS_SESSION_TOKEN** | AWS session token (if using STS temporary key) | | |

(*) Prior access permission from the scanned AWS is required.

---

## Scan GCP from local environment

GCP requires authentication information (*) to be scanned.
Scanning can be done by passing GCP service account key information through environment variables to RISKEN.

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **GOOGLE_SERVICE_ACCOUNT_JSON** | GCP service account credential (JSON) | yes | |
| **GOOGLE_SERVICE_ACCOUNT_EMAIL** | GCP service account email | yes | |
| **GOOGLE_SERVICE_ACCOUNT_PRIVATE_KEY** | RSA private key for GCP service account | yes | |

(*) Prior access permission from the scanned GCP is required.