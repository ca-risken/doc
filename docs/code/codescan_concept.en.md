# CodeScan

You can continuously collect results analyzed with the open-source [Semgrep :octicons-link-external-24:](https://semgrep.dev/){ target="_blank" }.

???+ help "What is Semgrep?"
    - A tool designed for static analysis of source code.
    - It's particularly useful for detecting issues related to security, bugs, and code style violations.

## Format

When importing data into RISKEN, the following metadata is added:

| Field          | Description                                  |
| -------------- | -------------------------------------------- |
| `DataSource`   | code:codescan (fixed)                        |
| `ResourceName` | Repository name                              |
| `Description`  | Description                                  |
| `Score`        | Refer to [Scoring](/en/code/codescan_concept/#scoring) |
| `Tag`          | `code` `repository` `codescan` `{Repository Name}` |

---

## Scoring

Scores are set based on the results analyzed by CodeScan as follows:

```mermaid
graph TD
    A[Start] --> B{{Exists findings?}};
    B -->|NO| C[Findings will not be registered]:::low;
    B -->|YES| D{{What is finding severity?}};
    D -->|ERROR| E[Score: 0.6]:::high;
    D -->|WARNING| F[Score: 0.3]:::low;
    D -->|INFO| G[Score: 0.1]:::low;
    D -->|UNKNOWN| J[Score: 0.0]:::unknown;
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
    classDef unknown fill:#FFFFFF,stroke:#BDBDBD,stroke-width:4px;
```

## Detection Rules

Scans are conducted based on the contents of the [Default Rules :octicons-link-external-24:](https://semgrep.dev/p/default){ target="_blank" } found in the Semgrep Registry. You can check the specific items that are inspected and the severity of each rule on the aforementioned Registry website.

