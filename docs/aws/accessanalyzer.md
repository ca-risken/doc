# AccessAnalyzer

AccessAnalyzerデータソースを有効にすると、AWSの[AccessAnalyzerサービス :octicons-link-external-24:](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html){ target="_blank" } で分析された結果を収集します

???+ tip "AccessAnalyzerとは？"
    - AWS AccessAnalyzerとは、自身のAWSアカウント外へ共有しているリソースを発見するのに便利なサービスです
    - AccessAnalyzerでサポートされているサービス等については[公式ドキュメント :octicons-link-external-24:](https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-resources.html){ target="_blank" }を参照してください
    - AccessAnalyzerの解析結果は数十分~24時間遅延することがあります。通常、アクセスポリシー変更のイベントを検知してスキャンが実施されますが特定の条件下では数時間〜最大24時間遅延する可能性があります。詳細は[公式ドキュメント :octicons-link-external-24:](https://docs.aws.amazon.com/ja_jp/IAM/latest/UserGuide/what-is-access-analyzer.html){ target="_blank" }を参照してください

---

## フォーマット

RISKENへデータを取り込む際に、以下のメタデータを付加します

| 項目            | 説明                                    　　　　　  |
| -------------- | ------------------------------------------------- |
| `DataSource`   | aws:access-analyzer (固定)               　　　　　 |
| `ResourceName` | AccessAnalyzerで検知したリソースのARN                |
| `Description`  | 説明                                              |
| `Score`        | [スコアリング](/aws/accessanalyzer/#_2)参照         |
| `Tag`          | `aws` `access-analyzer` `{タイプ}` `{アカウントID}` |


---

## スコアリング

AWSのAccessAnalyzerはスコア情報を持っていません

なので、RISKENに取り込む際に、以下のロジックによって危険度を判定しスコアリングしています

```mermaid
graph TD
    A[Start] --> B{{Active status?}};
    B -->|NO| C[Score: 0.1]:::low;
    B -->|YES| D{{isPublic?}};
    D -->|NO| E[Score: 0.3]:::low;
    D -->|YES| F{{Has permissions?}};
    F -->|ControlledAction| G[Score: 0.7]:::mid;
    F -->|UnsafeAction| H[Score: 0.9]:::high;
    F -->|ControlledAction & UnsafeAction| I[Score: 1.0]:::high;
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
```

- *ControlledAction* : `Get*`, `List*`, `Describe*` などの参照系のアクション、その他リソースへの影響が小さい権限
- *UnsafeAction* : `Delete*`, `Update*` などの更新系のアクション、その他リソースへの影響が大きい権限
