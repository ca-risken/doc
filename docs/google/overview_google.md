# Google

RISKEN上にあなたのGoogle情報を登録することで、Google関連のセキュリティデータを収集することができます


- Googleの各種データソースを有効にすると自動収集プログラムがスケジュールされます
- どのようなデータが収集されるかは、データソースごとのドキュメントを参照してください
- 全てのデータソースを有効にすることを推奨しますが、一部のデータソースのみを有効化することもできます

???+ info "補足"
    RISKENでは現在GCP関連のみサポートしています


![GCPデータソース](/img/google/gcp_datasource_list.png)

---

## GCPプロジェクトの登録フロー

GCPのデータソース設定には以下の作業が必要です

1. RISKENに[GCPプロジェクトを登録](/google/overview_gcp/)する
2. RISKENの[サービスアカウントにアクセス許可](/google/overview_sa/)を設定するする
3. GCPの[各種データソースを有効](/google/overview_datasource/)にする

