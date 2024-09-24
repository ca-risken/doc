# Subscription

あなたのAzure Subscriptionの登録方法について説明します

## Azure Subscriptionを追加する

1. メニューより`Azure > Azure`画面に遷移します
2. 画面右側の`NEW`をクリックします
3. 新規追加ダイアログで以下の項目を入力し`REGIST`をクリックします
    - **Name ＊**: 登録名（任意のもの）
    - **Subscription ID ＊**: サブスクリプションID
        - サブスクリプションIDの確認方法は [Microsoft Azureのドキュメント :octicons-link-external-24:](https://learn.microsoft.com/ja-jp/azure/azure-portal/get-subscription-tenant-id){ target="_blank" } を参照してください
    - **Verification Code ＊**: 検証コード
        - 新規作成の場合は`自動生成ボタン`でランダムな値を設定してください
    - ![Subscription登録](/img/azure/role_allocation.png){style="width:350px"}

4. 検証コードは後ほどあなたのSubscriptionに登録する必要があります
    - 必要に応じて :material-content-copy: （コピーボタン）をご利用ください

    ???+ info "Subscriptionの所有者確認フロー"
        - ここで設定されたコードが、あなたのSubscription内にも登録されているかを検証することで、所有者であることを確認します
        - RISKENは複数のSubscriptionを監視しているため、この検証フローを挟むことによって他者があなたのSubscriptionを登録できないようにするという意図があります


## 検証コードを登録する

1. [Azureのホーム :octicons-link-external-24:](https://portal.azure.com/#home)を開きます
2. Subsciptionのメニューを開き、登録したいSubscriptionを選択します
3. タグを開きます
4. 新たに以下のラベルを追加してください
    - キー: `risken`
    - 値: `{RISKENで設定した検証コード}`
    - ![Azure Subscriptionタグ](/img/azure/subscription_tag.png){style="width:580px"}
