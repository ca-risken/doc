# Admin Checker

Enabling the AdminChecker data source extracts strong privileges or over-granted IAM resources in the AWS IAM service.

???+ tip "What is AdminChecker?"
    - AdminChecker is a check tool developed by the RISKEN team (not an AWS service)
    - The following scanners are implemented:
        - `Privilege user check`
        - `Minimum permission check`

## Privilege user check

- `Privilege user check` checks if a user or group has administrative rights or privileges.
- The privilege check becomes `true` in the following cases:
    - AdministratorAccess (managed policy) is granted
    - IAMFullAccess (managed policy) is granted
    - AdministratorAccess equivalent is granted in the inline policy
    - IAMFullAccess equivalent is granted in the inline policy
- Scoring is based on the assumption that highly misused credentials are evaluated as high scores for privileged users (the score may fluctuate depending on factors such as the presence or absence of MFA).

??? Warning "In privilege user determination, some setting items are ignored"
    - Deny rules
        - Although deny rules are given the highest priority in [IAM policy evaluation logic :octicons-link-external-24:](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html){ target="_blank" }, AdminChecker ignores them.
        - Therefore, there is a possibility that even if you do not actually have privileges due to deny rules, you may be determined as a privileged user.
    - Conditions rules
        - The conditions may cause low-risk users to be included in a high-scoring (privileged user) state.
    - PermissionBoundory rules
        - Although a reduction in risk is achieved through PermissionBoundary, AdminChecker does not look at the details of the settings (almost ignored).

## Minimum permission check

- `Minimum permission check` scans IAM users and IAM roles that have been granted more permissions than necessary based on the data of [AceessAdvisor :octicons-link-external-24:](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor-view-data.html){ target="_blank" }.
- This scanner is based on the philosophy of [best practices for minimum permissions :octicons-link-external-24:](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html){ target="_blank" }.
    - Calculates the ratio of the number of accessed services to the number of permitted AWS services.
    - The higher the above ratio, the higher the score.
    - Use cases include IAM user and IAM role inventories.

---

## Format

When importing data into RISKEN, the following metadata is added:

| Field         | Description                                                                                              |
| ------------- | -------------------------------------------------------------------------------------------------------- |
| `DataSource`  | aws:admin-checker (fixed)                                                                                |
| `ResourceName`| IAM user ARN                                                                                            |
| `Description` | Description                                                                                              |
| `Score`       | See [Scoring](/aws/adminchecker/#_4)                                                                      |
| `Tag`         | `aws` `admin-checker` `admin` (for privilege user check) `access-report` (for least privilege check) `{accountID}` |

---

## Scoring

When importing data into RISKEN, the following logic is used to determine the severity and score:

### Privilege User Check

```mermaid
graph TD
    A[Start] --> B{{No AccessKey & No Password?}};
    B -->|YEW| C[Score: 0.1]:::low;
    B -->|No| D{{Is Admin?}};
    D -->|NO| E[Score: 0.3]:::low;
    D -->|YES| F{{No AccessKey & Enable `MFA`?}};
    F -->|YES| G[Score: 0.5]:::mid;
    F -->|NO| H{{Enable `PermissionBoundary`?}};
    H -->|YES| I[Score: 0.7]:::mid;
    H -->|NO| J[Score: 0.9]:::high;
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
```

### Least Privilege Check

```mermaid
graph TD
    A[Start] --> B{{Has any roles?}};
    B -->|NO| C[Score: 0.1]:::low;
    B -->|YES| D{{AccessRate over 70%?}};
    D -->|YES| E[Score: 0.1]:::low;
    D -->|NO| F{{AccessRate over 50%?}};
    F -->|YES| G[Score: 0.3]:::low;
    F -->|NO| H{{AccessRate over 30%?}};
    H -->|YES| I[Score: 0.4]:::low;
    H -->|NO| J{{AccessRate over 10%?}};
    J -->|YES| K[Score: 0.5]:::low;
    J -->|NO| L[Score: 0.6]:::mid;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
```