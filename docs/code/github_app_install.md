# GitHub Appのインストール

GitHub App認証でCodeスキャンを行う場合、スキャン対象のGitHub OrganizationまたはUserにRISKENのGitHub Appをインストールし、スキャン対象Repositoryへのアクセスを許可する必要があります。

RISKENのGitHub設定を作成する前に、GitHub側でAppのインストールとRepository accessの設定を完了してください。

## インストールURL

RISKEN Code用のGitHub Appは、以下のURLからインストールできます。

[https://github.com/apps/risken-code-app/installations/select_target](https://github.com/apps/risken-code-app/installations/select_target){ target="_blank" }

## 実施者

GitHub Organizationにインストールする場合は、Organization ownerが実施してください。

GitHubの仕様上、Repository adminがGitHub Appをインストールできるケースもありますが、Appが要求するOrganization権限やRepository administration権限によって制限されます。
RISKENでOrganization配下のRepositoryを安定してスキャンする場合は、Organization ownerによるインストールを推奨します。

個人アカウントのRepositoryをスキャンする場合は、そのGitHub Userが自身のアカウントにGitHub Appをインストールしてください。

## インストール手順

1. GitHubにログインします。

    Organizationにインストールする場合は、対象OrganizationのOwner権限を持つユーザーでログインしてください。

2. [インストールURL](#インストールurl)を開き、インストール先のOrganizationまたはUserを選択します。

    RISKENのGitHub設定で指定する`TargetResource`と同じOrganizationまたはUserを選択してください。

    !!! note "スクリーンショット差し込み位置"
        GitHub Appのインストール開始画面、またはインストール先のOrganization/Userを選択する画面のスクリーンショットを貼り付けてください。

3. Repository accessを選択します。

    スキャン対象にしたいRepositoryだけを許可する場合は、`Only select repositories`を選択し、対象Repositoryを選択してください。

    Organization配下の全Repositoryをスキャン対象にする場合は、`All repositories`を選択してください。

    !!! warning "注意"
        `All repositories`を選択すると、将来作成されるRepositoryもGitHub Appのアクセス対象になります。
        最小権限で運用したい場合は、`Only select repositories`を選択してください。

    !!! note "スクリーンショット差し込み位置"
        Repository accessで`All repositories`または`Only select repositories`を選択する画面のスクリーンショットを貼り付けてください。

4. GitHub Appに付与される権限を確認します。

    表示される権限が、スキャン対象Repositoryの読み取りに必要な範囲であることを確認してください。

    !!! note "スクリーンショット差し込み位置"
        GitHub AppのPermissions確認画面のスクリーンショットを貼り付けてください。

5. `Install`または`Update`をクリックします。

    既にGitHub Appがインストール済みの場合は、Repository accessの更新画面として表示されることがあります。

    !!! note "スクリーンショット差し込み位置"
        `Install`または`Update`をクリックする直前の画面のスクリーンショットを貼り付けてください。

6. RISKENでGitHub設定を作成します。

    `Code > GitHub`からGitHub設定を作成し、認証方式に`GitHub App`を選択してください。

    設定保存後、GitHub Appのインストール状態とRepository accessが確認されます。

    !!! note "スクリーンショット差し込み位置"
        RISKENのGitHub設定画面で、認証方式に`GitHub App`を選択している画面のスクリーンショットを貼り付けてください。

7. RISKENでGitHub連携を実行します。

    GitHub設定を作成したユーザーが、対象Repositoryを扱えるGitHubユーザーであることを確認するため、RISKEN画面上の`GitHub連携`を実行してください。

    !!! note "スクリーンショット差し込み位置"
        RISKENのGitHub設定画面で、`GitHub連携`を実行する画面と、連携完了後のステータス画面のスクリーンショットを貼り付けてください。

## Repository accessを変更する

スキャン対象Repositoryを追加または削除したい場合は、GitHub側でGitHub AppのRepository accessを変更してください。

1. GitHubで対象OrganizationまたはUserの`Settings`を開きます。
2. `GitHub Apps`または`Installed GitHub Apps`から`RISKEN Code App`を開きます。
3. `Repository access`で`All repositories`または`Only select repositories`を選択します。
4. `Only select repositories`の場合は、スキャン対象Repositoryを追加または削除します。
5. RISKENのGitHub設定画面でRepository一覧を再同期します。

!!! note "スクリーンショット差し込み位置"
    GitHub側でInstalled GitHub Appsを開き、Repository accessを変更する画面のスクリーンショットを貼り付けてください。

## トラブルシュート

### インストール先Organizationが表示されない

ログイン中のGitHubユーザーが、対象Organizationのメンバーではない可能性があります。
Organization ownerに確認してください。

### Installボタンが表示されない、またはインストール申請になる

ログイン中のGitHubユーザーに、対象OrganizationへGitHub Appをインストールする権限がない可能性があります。
Organization ownerにインストールを依頼してください。

### RISKENでGitHub Appの検証に失敗する

以下を確認してください。

- GitHub Appが対象OrganizationまたはUserにインストールされていること
- RISKENのGitHub設定の`Type`と`TargetResource`が、GitHub Appのインストール先と一致していること
- Repository accessにスキャン対象Repositoryが含まれていること
- GitHub AppのPrivate KeyやApp IDなど、RISKEN環境側のGitHub App設定値が正しいこと

### スキャン対象Repositoryが表示されない

GitHub AppのRepository accessに対象Repositoryが含まれていない可能性があります。
GitHub側でRepository accessを更新した後、RISKEN側でRepository一覧を再同期してください。
