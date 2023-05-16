# Asset

Enabling the Asset data source collects results analyzed by the [Cloud Asset Inventory service :octicons-link-external-24:](https://cloud.google.com/asset-inventory/docs/overview){ target="_blank" } in GCP.

???+ help "What is Cloud Asset Inventory?"
    - Cloud Asset Inventory is a service that allows you to understand the asset information you have in your GCP project.
        - The assets you are using are stored as resource information in Cloud Asset Inventory.
    - In particular, the analysis results of the IAM policies used in GCP are used to detect privileged service accounts.
        - Data detected by this data source may not conform to [minimal best practices :octicons-link-external-24:](https://cloud.google.com/iam/docs/using-iam-securely){ target="_blank" }.

---

## Format

When importing data into RISKEN, the following metadata is added:

| Field          | Description                                |
| -------------- | ------------------------------------------ |
| `DataSource`   | google:asset (fixed)                       |
| `ResourceName` | Detected asset name                        |
| `Description`  | Description                                |
| `Score`        | See [Scoring](/google/asset/#_2)            |
| `Tag`          | `google` `gcp` `asset` `{type}` `{project ID}` |

---

## Scoring

Cloud Asset Inventory in GCP does not have scoring information.

Therefore, when importing data into RISKEN, the following logic is used to determine the severity and score the risk.

### Service Accounts

Service accounts with user-managed keys pose security risks such as leakage.
In addition, the logic has been implemented to increase the score as the bound roles become stronger.

```mermaid
graph TD
    A[Start] --> B{{Service Account?}};
    B -->|NO| C[Score: 0.0]:::low;
    B -->|YES| D{{Also has user-managed keys?}};
    D -->|NO| E[Score: 0.1]:::low;
    D -->|YES| F{{editor or owner?}};
    F -->|NO| G[Score: 0.1]:::low;
    F -->|YES| H[Score: 0.8]:::high;
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
```

### Cloud Storage

The score is calculated based on whether the storage bucket is publicly exposed and whether it allows not only read-only but also write access.

However, the following cases are not supported:

- Judgment of public status at the object level and policy analysis
- Policy analysis of custom roles.

```mermaid
graph TD
    A[Start] --> B{{isPublic?}};
    B -->|NO| C[Score: 0.1]:::low;
    B -->|YES| D{{Read Only?}};
    D -->|YES| E[Score: 0.7]:::mid;
    D -->|NO| F{{Write Only?}};
    F -->|YES| G[Score: 0.9]:::high;
    F -->|NO| H[Score: 1.0]:::high;
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
```
