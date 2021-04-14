# GCP

あなたのGCPプロジェクトの登録方法について説明します

## GCPプロジェクトを追加する

1. メニューより`Google > GCP`画面に遷移します
2. 画面右側の`NEW`をクリックします
3. 新規追加ダイアログで以下の項目を入力し`REGIST`をクリックします
    - **Name ＊**: GCP名（任意のもの）
    - **GCP Organization ID**: GCP 組織IDです（SecurityCommandCenterのスキャン時に必要になります）
        - 組織IDの確認方法は [Googleのドキュメント :octicons-link-external-24:](https://cloud.google.com/resource-manager/docs/creating-managing-organization){ target="_blank" } を参照してください
    - **GCP Project ID ＊**: GCP プロジェクトID
        - プロジェクトIDの確認方法は [Googleのドキュメント :octicons-link-external-24:](https://cloud.google.com/resource-manager/docs/creating-managing-projects?hl=ja#identifying_projects){ target="_blank" } を参照してください
    - **Verification Code ＊**: 検証コード
        - 新規作成の場合は`自動生成ボタン`でランダムな値を設定してください
    - ![GCP登録](/img/google/gcp_regist.png){style="width:350px"}

4. 検証コードは後ほどあなたのGCPプロジェクトに登録する必要があります
    - 必要に応じて :material-content-copy: （コピーボタン）をご利用ください

    ???+ info "GCPの所有者確認フロー"
        - ここで設定されたコードが、あなたのGCP内にも登録されているかを検証することで、あなたがGCPプロジェクトの所有者であることを確認します
        - RISKENは複数のGCPを監視しているため、この検証フローを挟むことによって他者があなたのGCPを登録できないようにするという意図があります


## 検証コードを登録する

1. [GCPマネージメントコンソール :octicons-link-external-24:](https://console.cloud.google.com/)を開きます
2. RISKENに登録したGCPプロジェクトに切り替えます
3. [IAMメニューのラベル :octicons-link-external-24:](https://console.cloud.google.com/iam-admin/labels)を開きます
4. 新たに以下のラベルを追加してください
    - キー: `risken`
    - 値: `{RISKENで設定した検証コード}`

??? warning "ラベル設定にはプロジェクト権限が必要です"
    - ラベル設定にはプロジェクトの[ResourceManager API :octicons-link-external-24:](https://cloud.google.com/resource-manager/docs/creating-managing-labels)の権限が必要です。
        - `resourcemanager.projects.get`
        - `resourcemanager.projects.update`
    - 詳細はGCPのクラウド管理者にお問い合わせください

