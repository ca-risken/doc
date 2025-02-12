# Dependency

You can continuously collect the results analyzed by the open-source [Trivy :octicons-link-external-24:](https://github.com/aquasecurity/trivy){ target="_blank" } for various targets including container images, file systems, and Git repositories.

???+ help "What is Trivy?"
    - Trivy is a comprehensive security scanner for various targets including container images, file systems, and Git repositories.
    - The Dependency data source targets repositories on GitHub and investigates known vulnerabilities.

## Format

The following metadata is added when importing data to RISKEN:

| Field           | Description                                      |
| --------------- | ---------------------------------------------- |
| `DataSource`   | code:dependency (fixed)                            |
| `ResourceName` | The name of the package where the vulnerability was detected |
| `Description`  | Description                                      |
| `Score`        | Refer to [Scoring](/code/dependency_concept/#_2)             |
| `Tag`          | `code` `dependency` `repository_id:{RepositoryID}` |

* The `RepositoryID` in `Tag` should contain the ID of the repository that contains the package using the detected vulnerability.

---

## Scoring

Scoring is performed based on the severity of vulnerabilities in the result data analyzed by Trivy.

```mermaid
graph TD
    A[Start] --> B{{Can triage?}};

    %% Triageable %%
    B -->|YES| D{{Severity?}};
    D -->|CRITICAL| E[Score: 0.8]:::high;
    D -->|HIGH| F[Score: 0.6]:::mid;
    D -->|MEDIUM| G[Score: 0.4]:::mid;
    D -->|LOW| H[Score: 0.1]:::low;

    %% Default %%
    B -->|NO| J{{Severity?}};
    J -->|CRITICAL| K[Score: 0.6]:::mid;
    J -->|HIGH| L[Score: 0.5]:::mid;
    J -->|MEDIUM| M[Score: 0.3]:::low;
    J -->|LOW| N[Score: 0.1]:::low;

    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
    classDef unknown fill:#FFFFFF,stroke:#BDBDBD,stroke-width:4px;
```

The scoring is based on the CVSS score.

## Triage

The [Auto-Triage](/en/risken/triage/) function of RISKEN may re-evaluate the score of the finding.

The process of automatic triage determines whether the detected vulnerability is exploitable and whether automation is present.
"Triageable" refers to a state where there is sufficient material for the process.

See [Auto-Triage](/en/risken/triage/) for details.
