# Asset

Assetデータソースを有効にすると、GCPの[Cloud Asset Inventoryサービス :octicons-link-external-24:](https://cloud.google.com/asset-inventory/docs/overview){ target="_blank" } で分析された結果が収集されます

???+ help "Cloud Asset Inventoryとは？"
    - Cloud Asset Inventoryは、自身のGCPプロジェクトで保有しているアセット情報を把握するのに便利なサービスです
        - 利用中のアセットはRISKENのリソース情報に保存されます
    - 特にGCPで利用しているIAMポリシーの解析結果により、特権サービスアカウントを検出します
        - このデータソースで検出されたデータは [必要最小限のベストプラクティス :octicons-link-external-24:](https://cloud.google.com/iam/docs/using-iam-securely){ target="_blank" } に則っていない可能性があります

---

## フォーマット

RISKENへデータを取り込む際に、以下のメタデータを付加します

| 項目            | 説明                                      |
| -------------- | ---------------------------------------- |
| `DataSource`   | google:asset (固定)                       |
| `ResourceName` | 検出したアセット名                          |
| `Description`  | 説明                                      |
| `Score`        | [スコアリング](/google/asset/#_2)参照        |
| `Tag`          | `google` `gcp` `asset` `{タイプ}` `{プロジェクトID}` |

---

## スコアリング

GCPのCloud Asset Inventoryはスコア情報を持っていません。

なので、RISKENに取り込む際に、以下のロジックによって危険度を判定しスコアリングしています。

### サービスアカウント

ユーザ管理キーを持ったサービスアカウントは漏洩リスク等によるセキュリティリスクが存在します。
また、バインドされたロールが強ければ強いほど、スコアが高まるロジックが実装されています。

```mermaid
graph TD
    A[Start] --> B{{サービスアカウント?}};
    B -->|NO| C[Score: 0.0]:::low;
    B -->|YES| D{{ユーザ管理キーも持っている?}};
    D -->|NO| E[Score: 0.1]:::low;
    D -->|YES| F{{editor or owner?}};
    F -->|NO| G[Score: 0.1]:::low;
    F -->|YES| H[Score: 0.8]:::high;
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
```

### Cloud Storage

ストレージバケットが公開されているか、さらに読み取り専用だけでなく書き込みまで許可されているかによってスコアを算出します。

ただし以下のケースはサポートしていません。

- オブジェクトレベルでの公開状態判定およびポリシー解析
- カスタムロールのポリシー解析

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
