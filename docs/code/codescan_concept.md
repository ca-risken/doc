# CodeScan

オープンソースの[Semgrep :octicons-link-external-24:](https://semgrep.dev/){ target="_blank" }で分析した結果を継続的に収集することができます

???+ help "Semgrep とは？"
    - ソースコードの静的解析を行うためのツールです
    - 特に、セキュリティの問題やバグ、コードスタイルの違反などを検出するのに役立ちます

## フォーマット

RISKEN へデータを取り込む際に、以下のメタデータを付加します

| 項目           | 説明                                            |
| -------------- | ----------------------------------------------- |
| `DataSource`   | code:codescan (固定)                            |
| `ResourceName` | リポジトリ名                                    |
| `Description`  | 説明                                            |
| `Score`        | [スコアリング](/code/codescan_concept/#_2)参照  |
| `Tag`          | `code` `repository` `codescan` `{リポジトリ名}` |

---

## スコアリング

CodeScan で解析された結果をもとに以下の通りにスコアを設定します

```mermaid
flowchart TD
    A[Start] --> B{{Severity?}}
    %% Other severity levels
    B -->|INFO| C[Score: 0.1]:::low
    B -->|WARNING| D[Score: 0.3]:::low
    
    %% ERROR branch with detailed logic
    B -->|ERROR| F{{Impact/Likelihood?}}
    F -->|Impact=HIGH & Likelihood=HIGH| G[Score: 0.8]:::high
    F -->|Impact=HIGH & Likelihood!=HIGH| H[Score: 0.6]:::mid
    F -->|Impact=MEDIUM| I[Score: 0.5]:::mid
    F -->|Impact=LOW| J[Score: 0.4]:::low
    F -->|default| K[Score: 0.6]:::mid

    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px
    classDef unknown fill:#FFFFFF,stroke:#BDBDBD,stroke-width:4px
```

- `Severity` はSemgrepのルールの重大度を表します。（ERRORの場合は重大度=高）
- `Impact` は脆弱性が引き起こすダメージの程度を表します。
- `Likelihood` は発見された問題を攻撃者が悪用する可能性を表します。

## 検知ルール

Semgrep Registryにある [Default ルール :octicons-link-external-24:](https://semgrep.dev/p/default){ target="_blank" } の内容でスキャンが行われます。
どのような項目がチェックされるのかや各ルールの重大度の確認は上記のRegistryサイトで確認できます。
