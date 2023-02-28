# Domain

あなたが所有しているドメイン情報を登録することで、リスクの高いサブドメインを検出することができます

RISKENではOSINTツールのなかでドメイン情報に関するものを複数組み合わせて分析します

???+ tip "リスクの高いドメインとは？"
    RISKENでは以下の観点でドメインを解析します

    - 一般的に公開してはいけないプロダクション環境以外のURLがインターネット上にオープンになっていないか
    - [サブドメインテイクオーバー :octicons-link-external-24:](https://developer.mozilla.org/en-US/docs/Web/Security/Subdomain_takeovers){ target="_blank" } の可能性のあるドメインがないか
    - SSLサーバー証明書が有効期限切れ間近になっていないか

## フォーマット

RISKENへデータを取り込む際に、以下のメタデータを付加します

| 項目            | 説明                                            |
| -------------- | ---------------------------------------------- |
| `DataSource`   | osint:subdomain (固定)                          |
| `ResourceName` | スキャン対象のドメイン                             |
| `Description`  | 説明                                            |
| `Score`        | [スコアリング](/osint/domain_concept/#_2)参照      |
| `Tag`          | `osint` `domain` `{リスクの種別}` `{スキャン対象のドメイン名}`  |

## スコアリング

上述したとおり、RISKENでは3つの観点にてドメインのリスクを判定します

スコアリングは観点ごとに以下の通りとなります

### 一般的に公開してはいけない環境が外部公開されている

```mermaid
graph TD
    A[Start] --> B{{Does subdomain match DetectWord?}};
    B -->|YES| C[Score: 0.3]:::low;
    B -->|NO| D[Finding isn't registered.];
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
```

### SSLサーバー証明書が有効期限切れ間近になっている

```mermaid
graph TD
    A[Start] --> B{{Is number of days left until certificate expiration?}};
    B -->|More than 30 days| C[Score: 0.1]:::low;
    B -->|Less than 30 days| D[Score: 0.6]:::mid;
    B -->|Less than 14 days| E[Score: 0.8]:::high;
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
```

### サブドメインテイクオーバーの可能性のあるドメイン

サブドメインがCNAMEレコードを持っているか、サーバー／サイトがダウンしているかによってスコアを算出します

サーバーがダウンしていて、かつ後述のサブドメインテイクオーバーのリスクが高いドメインの場合にはさらにスコアが高くなります

```mermaid
graph TD
    A[Start] --> B{{Does subdomain has CNAME record?}};
    B -->|NO| C[Finding isn't registered.]:::low;
    B -->|YES| D{{Is subdomain seemed down?}};
    D -->|NO| E[Score: 0.1]:::low;
    D -->|YES| F[Does CNAME match high lisk list?];
    F -->|NO| G[Score: 0.6]:::mid;
    F -->|YES| H[Score: 0.8]:::high;
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
```

## サブドメインテイクオーバーのリスクが高いドメイン

下記のリストは第三者がCNAMEを容易に取得できることが考えられるリストです

設定されているCNAMEがリストに該当する場合、サブドメインにアクセスした結果サーバー／サイトがダウンしている場合にはスコアが高くなります

- us-east-1.elasticbeanstalk.com
- s3.amazonaws.com
- s3-website-{region}.amazonaws.com
- s3-website.{region}.amazonaws.com
- animaapp.io
- bitbucket.io
- furyns.com
- ghost.io
- hatenablog.com
- helpjuice.com
- helpscoutdocs.com
