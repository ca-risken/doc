# Azure SubscriptionへのService Principalの権限割り当て

Azureマネージメントコンソールからの設定例を記載します

1. AzureのPortal画面で `サブスクリプション` サービスに遷移します
2. 対象のSubscriptionにて、`アクセス制御(IAM)` をクリックします
    - `追加 > ロールの割り当ての追加`をクリックします
        - ![ロールの割り当て](/img/azure/subscription_role.png){style="width:300px"}
    - 職務ロールにて、`閲覧者`のアクセス権を選択して`次へ`をクリックします
    - アクセスの割り当てにて、権限を割り当てるサービスプリンシパルを選択します
        - ![メンバー追加](/img/azure/role_allocation.png){style="width:400px"}

3. Subscriptionに`risken`タグを設定する
    - [検証コードを登録する](/azure/overview_subscription/#1)を参照してください