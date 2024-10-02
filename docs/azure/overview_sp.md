# Azure SubscriptionへのService Principalの権限割り当て

Azureマネージメントコンソールからの設定例を記載します  

- 管理グループにロールを割り当てる方法
- Subscriptionにロールを割り当てる方法

について紹介します

## 管理グループにロールを割り当てる
管理グループにロールを割り当てることにより、その管理グループに所属するSubscriptionにも権限が割り当てられます

1. AzureのPortal画面で `管理グループ` サービスに遷移します
2. 対象の管理グループにて、`アクセス制御(IAM)` をクリックします
    - `追加 > ロールの割り当ての追加`をクリックします
        - ![ロールの割り当て](/img/azure/management_group_role.png){style="width:300px"}
    - 職務ロールにて、`閲覧者`のアクセス権を選択して`次へ`をクリックします
    - アクセスの割り当てにて、権限を割り当てるサービスプリンシパルを選択します
        - ![メンバー追加](/img/azure/role_allocation.png){style="width:400px"}

## Subscriptionにロールを割り当てる
1. AzureのPortal画面で `サブスクリプション` サービスに遷移します
2. 対象のSubscriptionにて、`アクセス制御(IAM)` をクリックします
    - `追加 > ロールの割り当ての追加`をクリックします
        - ![ロールの割り当て](/img/azure/subscription_role.png){style="width:300px"}
    - 職務ロールにて、`閲覧者`のアクセス権を選択して`次へ`をクリックします
    - アクセスの割り当てにて、権限を割り当てるサービスプリンシパルを選択します
        - ![メンバー追加](/img/azure/role_allocation.png){style="width:400px"}

3. Subscriptionに`risken`タグを設定する
    - [検証コードを登録する](/azure/overview_subscription/#1)を参照してください