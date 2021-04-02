# データソース

??? warning "現在、GCPの新規プロジェクト登録は管理者のみ操作可能となっています"
    設定が必要な方は以下の情報を添えて[Contact us](/contact/contact/)までご連絡ください

    1. RISKENのプロジェクト
    2. GCPのプロジェクトID
    3. GCPの組織IDの
        - 組織IDの確認方法は [Googleのドキュメント :octicons-link-external-24:](https://cloud.google.com/resource-manager/docs/creating-managing-organization){ target="_blank" } を参照してください
    4. 申請者の方がそのGCPのプロジェクト（または、組織）の所有者だと分かる情報
        - セキュリティ上の理由により、プロジェクトの所有確認をさせて頂く必要があります
        - [マネージメントコンソールのIAM画面 :octicons-link-external-24:](https://console.cloud.google.com/iam-admin/iam){ target="_blank" } のキャプチャなどをご提示ください



1. メニューより`Google > GCP`をクリックしGCPの設定画面に遷移します
2. 画面右側の`NEW`をクリックします
3. 新規追加ダイアログで以下の項目を入力し`REGIST`をクリックします
    - **Name ＊**: GCP名（任意のもの）
    - **GCP Organization ID**: GCP 組織IDです（SecurityCommandCenterのスキャン時に必要になります）
        - 組織IDの確認方法は [Googleのドキュメント :octicons-link-external-24:](https://cloud.google.com/resource-manager/docs/creating-managing-organization){ target="_blank" } を参照してください
    - **GCP Project ID ＊**: GCP プロジェクト
        - プロジェクトの確認方法は [Googleのドキュメント :octicons-link-external-24:](https://cloud.google.com/resource-manager/docs/creating-managing-projects?hl=ja#identifying_projects){ target="_blank" } を参照してください
    - ![GCP登録](/img/google/gcp_regist.png){style="width:350px"}
4. GCPプロジェクト登録後、一覧クリックしGoogleのGCP DataSource画面を開きます
5. 各種スキャナーの一覧右側のアクションより`SETUP ALL`をクリックします
    - ![SETUP ALL](/img/google/gcp_setup_all.png){style="width:150px"}
6. DataSourceダイアログで`ATTACH`をクリックします
    - ![ATTACH ALL](/img/google/gcp_attach_all.png){style="width:300px"}

