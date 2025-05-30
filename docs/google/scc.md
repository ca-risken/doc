# Security Command Center

SCCデータソースを有効にすると、GCPの[Security Command Centerサービス（SCC） :octicons-link-external-24:](https://cloud.google.com/security-command-center/docs/concepts-security-command-center-overview){ target="_blank" }で分析された結果が収集されます

???+ help "Security Command Centerとは？"
    - SCCは、Googleが提供する驚異検知のためのセキュリティサービスです
    - SCCでどのような項目が検知されるかは[公式ドキュメント :octicons-link-external-24:](https://cloud.google.com/security-command-center/docs/concepts-vulnerabilities-findings){ target="_blank" }を参照してください


???+ Warning "Security Command Centerは組織向けのソリューションです"
    SCCは[組織 :octicons-link-external-24:](https://cloud.google.com/resource-manager/docs/creating-managing-organization){ target="_blank" }向けのセキュリティサービスです
    
    - 設定を有効にするには何らかの組織に属する必要があります
    - 組織側のIAMにもサービスアカウントの登録が必要です
        - サービスアカウントに以下のロールを設定してください
            - Security Center Findings Viewer／セキュリティ センターの検出閲覧者 （ `roles/securitycenter.findingsViewer` ）
        - もしくは以下のパーミッション（SCCの参照権限）を含むカスタムロールを設定してください
        ```yaml
        - securitycenter.findings.group
        - securitycenter.findings.list
        - securitycenter.findings.listFindingPropertyNames
        - securitycenter.sources.get
        - securitycenter.sources.list
        ```
        - 詳細は [サービスアカウントを許可](/google/overview_sa/) を参照してください


---

## フォーマット

RISKENへデータを取り込む際に、以下のメタデータを付加します

| 項目            | 説明                             |
| -------------- | ------------------------------- |
| `DataSource`   | google:scc (固定)                |
| `ResourceName` | 検出したアセット名                 |
| `Description`  | 説明                             |
| `Score`        | [スコアリング](/google/scc/#_2)参照 |
| `Tag`          | `google` `gcp` `scc` `{プロジェクトID}` `{サービス名}` |

---

## スコアリング

Security Command Centerで解析された結果データには[Severity情報 :octicons-link-external-24:](https://cloud.google.com/security-command-center/docs/how-to-use-security-health-analytics#findings-by-severity){ target="_blank" } を持っています

RISKENに取り込む際に、以下のロジックによって`Severity`を基準にしたスコアリングを行います

```mermaid
graph TD
    A[Start] --> B{{Status Active?}};
    B -->|NO| C[Score: 0.1]:::low;
    B -->|YES| D{{Severity = LOW?}};
    D -->|YES| E[Score: 0.1]:::low;
    D -->|NO| F{{Severity = MEDIUM?}};
    F -->|YES| G[Score: 0.3]:::low;
    F -->|NO| H{{Severity = HIGH?}};
    H -->|YES| I[Score: 0.6]:::mid;
    H -->|NO| J{{Severity = CRITICAL?}};
    J -->|YES| K[Score: 0.9]:::high;
    J -->|NO| L[Score: 0.0]:::unknown;
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
    classDef unknown fill:#FFFFFF,stroke:#BDBDBD,stroke-width:4px;
```

## トリアージについて

RISKENの [Auto-Triage機能](/risken/triage/) によって、データソースで算出されたスコアが再評価される場合があります。

### CVE-IDを持つFinding

CVSSスコア以外に、PoCが公開されているか、実際に悪用された実績があるか等によってスコアが再評価されます。

### Enterprise または Premium Tierの場合

[Attack exposure scores :octicons-link-external-24:](https://cloud.google.com/security-command-center/docs/attack-exposure-learn) をもとに、システム露出とビジネス影響を算出します。

- `Attack Exposure` のスコアによってシステム露出の観点でトリアージされます
- `High/Medium Resources` の有無によってビジネス影響の観点でトリアージされます
