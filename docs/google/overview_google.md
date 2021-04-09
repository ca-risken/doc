# Google

RISKEN上にあなたのGoogle情報を登録することで、Google関連のセキュリティデータを収集することができます


- Googleの各種データソースを有効にすると自動収集プログラムがスケジュールされます
- どのようなデータが収集されるかは、データソースごとのドキュメントを参照してください
- 全てのデータソースを有効にすることを推奨しますが、一部のデータソースのみを有効化することもできます

???+ info "補足"
    RISKENでは現在GCP関連のみサポートしています


![GCPデータソース](/img/google/gcp_datasource_list.png)

ここではGCP向けの各種データソース設定に関する説明をします。

---

## 事前準備

GCPのデータソース設定には以下の2つの作業が必要です

1. RISKENのサービスアカウントをアクセス許可する
2. GCPの各種データソースを有効にする
