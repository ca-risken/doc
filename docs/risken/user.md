# ユーザ

RISKENにログインすると自動でユーザ登録されます。
しかし、登録されたばかりのユーザはプロジェクトに参加していないため何も表示されません。

[新たにプロジェクトを作成](/risken/project/#_2)するか、すでに存在するプロジェクトに招待->参加する必要があります。
ここではRISKEN上でログイン済みのユーザを既存プロジェクトに招待するフローを説明します。

RISKENへログインしたことのないユーザへ権限を割り当てる方法については[ユーザ予約](/risken/user_reservation/#_2)を参照してください。

---

## ユーザをプロジェクトに招待する

1. 画面上メニューの`P`ボタンより対象のプロジェクトを選択します
2. 左メニューより`IAM > User`をクリックします
    - ![ユーザリスト](/img/risken/user_list.png){style="width:300px"}
3. 画面右側にある`NEW`ボタンをクリックします
4. ユーザダイアログが開かれるので右上の`INVITE NEW USER`をクリックします
    - ![ユーザ招待](/img/risken/user_invite.png){style="width:300px"}
5. 招待したい人を検索・クリックします
6. ユーザダイアログに戻ったら、付与したいロールにチェックをして`EDIT`ボタンをクリックします
    - ![ユーザダイアログ](/img/risken/user_dialog.png){style="width:300px"}

???+ note
    招待したいユーザが存在しない場合は、対象のユーザがまだログインしていないかもしれません。
    ログインをしてもらってからユーザダイアログで再度検索してください。

---

## ユーザにロールを付与する

1. 左メニューより`IAM > User`をクリックします
2. ユーザ画面では、プロジェクト参加済みのユーザが表示されます
    - ロールを付与したいユーザを選択してください
    - 対象のユーザが存在しない場合は、[ユーザ追加](/risken/user/#_2)で招待してください
3. 作成済みのロールが表示されるので、付与したいロールを設定してください
    - ![ユーザダイアログ](/img/risken/user_dialog.png){style="width:350px"}

???+ note
    プロジェクト作成時にデフォルトで `project_admin` 用のロール／ポリシーが作成されます
    ReadOnly権限や部分的な機能を細かく許可／制御したい場合は次の[きめ細かなロールの設定](/risken/user/#_4)ステップを確認してください

---

## きめ細かなロールの設定

プロジェクト内で特定の機能だけを許可するなど、きめ細かなロールを設定することができます。
ロールを作成する前にロールに紐付ける **ポリシー** を設定します

- **ポリシー** とはデータ（リソース）に対して、どんな操作（アクション）を許可するかを定義したものです
- １つのロールに対して複数のポリシーを設定することが可能です
- ポリシーの記述には[正規表現  :octicons-link-external-24:](https://github.com/google/re2/wiki/Syntax)を使用しています

### ポリシー設定

1. 左メニューより`IAM > Policy`をクリックします
2. 画面右側にある`NEW`をクリックします
    - ![ポリシー](/img/risken/user_policy.png){style="width:350px"}
3. ポリシーダイアログで以下を入力し`REGIST`をクリックします
    - **Name**: ポリシー名
    - **Action Pattern**: Action名のパターン
        - 　例えばReadOnly用のActionは`(get|list|is-admin|put-alert-first-viewed-at)`を設定します
    - **Resource Pattern**: Resource名のパターン
        - ※ 現在細かいResourceパターンでの制御は未サポートです。そのため、Resource欄は`.*`で指定してください。（一律プロジェクト単位での制御となります）

### ロール設定
1. 左メニューより`IAM > Role`をクリックします
2. 画面右側の`NEW`をクリックします
3. ロールダイアログで以下を入力し`REGIST`をクリックします
    - **Name**: ロール名
    - **Policy**: ロールに紐付けたいポリシーを選択します
    - ![ロールダイアログ](/img/risken/user_role_dialog.png){style="width:350px"}

## ユーザーにOrganizationのロールを付与する {#_7}

Organizationの権限は前述のプロジェクトとのIAMとは異なるOrganization IAMによって管理されます。

![Organization IAM](/img/risken/organization_iam.png){style="width:400px"}

操作方法はプロジェクトのIAMと同じであるため、詳細については前述のものを参照してください。

### Organization IAMをプロジェクトへ継承する {#_8}

Organizationに権限を持つユーザーは、そのOrganizationに所属するプロジェクトに対して同じ権限を持ちます（**継承**）。

具体的には、Organizationのロールを持つユーザーはそのOrganizationに所属するプロジェクトにアクセスした時、Organizationのロールポリシーが適用されます。

???+ note
    Organizationのロールは、プロジェクトのロールの権限チェックの後に評価されます。
