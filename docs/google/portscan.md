# PortScan

GCPのインスタンス、ファイアウォールルール等から外部に公開されているポートに向けて[Nmap :octicons-link-external-24:](https://nmap.org/man/ja/index.html){ target="_blank" } によるポートスキャンを行い、その結果をRISKENのFindingへ取り込むことが可能です

## フォーマット

RISKENへデータを取り込む際に、以下のメタデータを付加します

| 項目            | 説明                                        |
| -------------- | -------------------------------------------|
| `DataSource`   | aws:portscan (固定)                         |
| `ResourceName` | スキャン対象のリソースのARN                    |
| `Description`  | 説明                                        |
| `Score`        | [スコアリング](/google/portscan/#_2)参照       |
| `Tag`          | `google` `gcp` `portscan` `{プロジェクトID}`   |

## スコアリング

スコアリングの内容はAWSのPortscanと同様です。
[AWSのPortscanスコアリング](/aws/portscan/#_2)を参照してください。
