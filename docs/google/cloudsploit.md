# CloudSploit


CloudSploitデータソースを有効にすると、オープンソースの[CloudSploit :octicons-link-external-24:](https://github.com/aquasecurity/cloudsploit){ target="_blank" } で解析された結果が収集されます

???+ help "CloudSploitとは？"
    - CloudSploitは[AquaSecurity :octicons-link-external-24:](https://www.aquasec.com/){ target="_blank" } が公開しているオープンソースの[CSPM :octicons-link-external-24:](https://www.checkpoint.com/cyber-hub/cloud-security/what-is-cspm-cloud-security-posture-management/){ target="_blank" } ツールです
    - CloudSploitでどのような項目が検知されるかは[GitHub :octicons-link-external-24:](https://github.com/aquasecurity/cloudsploit/tree/master/plugins/google){ target="_blank" }を参照してください

---

## フォーマット

RISKENへデータを取り込む際に、以下のメタデータを付加します

| 項目            | 説明                                                       |
| -------------- | --------------------------------------------------------- |
| `DataSource`   | google:cloudsploit (固定)                                  |
| `ResourceName` | 検出したアセット名                                           |
| `Description`  | 説明                                                       |
| `Score`        | [スコアリング](/google/cloudsploit/#_2)参照                   |
| `Tag`          | `google` `gcp` `cloudsploit` `{コンプライアンスマーク}` `{プロジェクトID}` `{プラグイン名}` `{Well-Architectedタグ}` |

＊ `Well-Architected` タグの詳しい使い方は[/risken/well_architected](/risken/well_architected/) ページを参照してください

---

## スコアリング

- CloudSploitの解析結果にはスコア情報に相当するデータは含まれていません
- 各種チェック項目（プラグイン）に対して`PASS`（リスクなし）、もしくは `FAIL` （問題あり）といった[ステータス情報 :octicons-link-external-24:](https://github.com/aquasecurity/cloudsploit/blob/master/docs/writing-plugins.md#result-codes){ target="_blank" }のみ確認できます

    ??? Info "CloudSploitのステータス"
        - 0: PASS: リスクなし
        - 1: WARN: 設定ミスの可能性があります。または、問題はありますが、すぐに対応が必要なものではありません。
        - 2: FAIL: リスクあり
        - 3: UNKNOWN: （IAMの権限不足などで）API実行に失敗し正常に終了しませんでした

- しかし、これでは各チェック項目がそれぞれどの程度のリスクなのか判断が難しく、全てを見ようとすると大量のアラートをチェックしていく必要が出てしまいます
- なのでRISKENに取り込む際に、以下のロジックによってスコアリングを行い、優先して確認すべき問題を精査しています（詳細は[プラグインごとのスコア判定](/google/cloudsploit/#_3)を確認してください）
    - ＊もちろん全ての `FAIL` を確認しても問題ありません

```mermaid
graph TD
    A[Start] --> B{{Status `OK`?}};
    B -->|YES| C[Score: 0.0]:::unknown;
    B -->|NO| D{{Status `UNKNOWN`?}};
    D -->|YES| E[Score: 0.1]:::low;
    D -->|NO| F{{Status `WARN`?}};
    F -->|YES| G[Score: 0.3]:::low;
    F -->|NO| H{{Status `FAIL`?}};
    H -->|YES| I[Score: <plugin score>]:::unknown;
    H -->|NO| J[Score: 0.0]:::unknown;
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
    classDef unknown fill:#FFFFFF,stroke:#BDBDBD,stroke-width:4px;
```

## プラグインごとのスコア判定

[CloudSploitの各種チェック項目（プラグイン） :octicons-link-external-24:](https://github.com/aquasecurity/cloudsploit/tree/master/plugins/google){ target="_blank" } で `FAIL` 判定された場合、どのプラグインかによってスコアが変わります

また、プラグインによってCISやPCIDSSなどのコンプライアンス基準のタグが付与されます

＊下記以外のプラグインはすべてスコア `0.3`が付与されます
＊最新バージョンのスコアになります

|Category|Plugin|Score|Compliance Tag|memo|
|---|---|---|---|---|
|BigQuery|datasetAllUsersPolicy|0.6||2022/12/19更新|
|CloudSQL|dbPubliclyAccessible|0.8|hipaa, pci||
|CloudSQL|dbAutomatedBackups|0.6||2021/11/01更新|
|CloudSQL|serverCertificateRotation|0.6||2022/12/19更新|
|CloudSQL|storageAutoIncreaseEnabled|0.6||2022/12/19更新|
|GCE|connectSerialPortsDisabled|0.6||2021/11/01更新|
|GCE|deprecatedImages|0.6||2022/12/19更新|
|GCE|instanceLeastPrivilege|0.6|pci||
|GCE|instancePublicAccess|0.6||2022/12/19更新|
|GCE|publicDiskImages|0.8||2022/12/19更新|
|GCS|bucketAllUsersPolicy|0.6||2021/08/04更新|
|GKE|loggingEnabled|0.6|hipaa|2021/06/17更新|
|GKE|clusterLeastPrivilege|0.6||2021/11/01更新|
|KMS|kmsPublicAccess|0.8||2022/12/19更新|
|IAM|corporateEmailsOnly|0.8|||
|IAM|serviceAccountAdmin|0.6|||
|IAM|serviceAccountUser|0.6||2021/06/17更新|
|VPC Network|openAllPorts|0.8|hipaa, pci||
|VPC Network|openCassandra|0.6||2022/12/19更新|
|VPC Network|openCassandraClient|0.6||2022/12/19更新|
|VPC Network|openCassandraInternode|0.6||2022/12/19更新|
|VPC Network|openCassandraMonitoring|0.6||2022/12/19更新|
|VPC Network|openCassandraThrift|0.6||2022/12/19更新|
|VPC Network|openCustomPorts|0.6||2022/12/19更新|
|VPC Network|openCIFS|0.6||2022/12/19更新|
|VPC Network|openDNS|0.6||2022/12/19更新|
|VPC Network|openDocker|0.6||2022/12/19更新|
|VPC Network|openElasticsearch|0.6||2022/12/19更新|
|VPC Network|openFTP|0.6||2022/12/19更新|
|VPC Network|openHadoopNameNode|0.6||2022/12/19更新|
|VPC Network|openHadoopNameNodeWebUI|0.6||2022/12/19更新|
|VPC Network|openInternalWeb|0.6||2022/12/19更新|
|VPC Network|openKibana|0.6||2022/12/19更新|
|VPC Network|openLDAP|0.6||2022/12/19更新|
|VPC Network|openLDAPS|0.6||2022/12/19更新|
|VPC Network|openMemcached|0.6||2022/12/19更新|
|VPC Network|openMongo|0.6||2022/12/19更新|
|VPC Network|openMsSQL|0.6||2022/12/19更新|
|VPC Network|openMySQL|0.6||2022/12/19更新|
|VPC Network|openNetBIOS|0.6||2022/12/19更新|
|VPC Network|openOracle|0.6||2022/12/19更新|
|VPC Network|openOracleAutoDataWarehouse|0.6||2022/12/19更新|
|VPC Network|openPostgreSQL|0.6||2022/12/19更新|
|VPC Network|openRedis|0.6||2022/12/19更新|
|VPC Network|openRDP|0.6||2022/12/19更新|
|VPC Network|openRPC|0.6||2022/12/19更新|
|VPC Network|openSalt|0.6||2022/12/19更新|
|VPC Network|openSMBoTCP|0.6||2022/12/19更新|
|VPC Network|openSMTP|0.6||2022/12/19更新|
|VPC Network|openSQLServer|0.6||2022/12/19更新|
|VPC Network|openSSH|0.6|||
|VPC Network|openTelnet|0.6||2022/12/19更新|
|VPC Network|openVNCClient|0.6||2022/12/19更新|
|VPC Network|openVNCServer|0.6||2022/12/19更新|
