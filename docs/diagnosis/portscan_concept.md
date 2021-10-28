# Portscan

設定したIP/FQDNに向けて[Nmap :octicons-link-external-24:](https://nmap.org/man/ja/index.html){ target="_blank" } によるポートスキャンを行い、その結果をRISKENのFindingへ取り込むことが可能です


---
## フォーマット

RISKENへデータを取り込む際に、以下のメタデータを付加します

| 項目            | 説明                                            |
| -------------- | ---------------------------------------------- |
| `DataSource`   | diagnosis:portscan (固定)                |
| `ResourceName` | スキャン対象のIP/FQDN                                         |
| `Description`  | 説明        　                |
| `Score`        | [スコアリング](/diagnosis/portscan_concept/#_2)参照            |
| `Tag`          | `diagnosis` `portscan` `vulnerability`  |

---
## スコアリング

スコアリングの内容はAWSのPortscanと同様です。
[AWSのPortscanスコアリング](/aws/portscan/#_2)を参照してください。