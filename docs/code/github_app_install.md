# GitHub Appのインストール

GitHub App認証でソースコードのスキャンを行う場合、スキャン対象のGitHub OrganizationまたはUserにRISKENのGitHub Appをインストールし、スキャン対象Repositoryへのアクセスを許可する必要があります。

RISKENのGitHub設定を作成する前に、GitHub側でAppのインストールとRepository accessの設定を完了してください。

インストール後のRISKEN側の操作は、[GitHub Appを使ったスキャン設定](github_app_scan_setting.md)を参照してください。

## インストールURL

RISKEN Code用のGitHub Appは、以下のURLからインストールできます。

[https://github.com/apps/risken-code-app/installations/select_target](https://github.com/apps/risken-code-app/installations/select_target){ target="_blank" }

## 実施者

GitHub Organizationにインストールする場合は、Organization ownerが実施してください。

個人アカウントのRepositoryをスキャンする場合は、そのGitHub Userが自身のアカウントにGitHub Appをインストールしてください。

## インストール手順

1. GitHubにログインします。

    Organizationにインストールする場合は、対象OrganizationのOwner権限を持つユーザーでログインしてください。

2. [インストールURL](#インストールurl)または、`設定 > GitHub App`を開き、インストール先のOrganizationまたはUserを選択します。

    RISKENのGitHub設定で指定する`TargetResource`と同じOrganizationまたはUserを選択してください。

    選択後の画面上部に、インストール先として対象OrganizationまたはUserが表示されていることを確認してください。

    ![GitHub Appインストール先選択](/img/code/github_app_install_select_target.png){style="width:600px"}

3. Repository accessを選択します。

    スキャン対象にしたいRepositoryだけを許可する場合は、`Only select repositories`を選択し、対象Repositoryを選択してください。

    Organization配下の全Repositoryをスキャン対象にする場合は、`All repositories`を選択してください。

    !!! warning "注意"
        `All repositories`を選択すると、将来作成されるRepositoryもGitHub Appのアクセス対象になります。
        最小権限で運用したい場合は、`Only select repositories`を選択してください。

    ![GitHub App Repository access](/img/code/github_app_install_repository_access.png){style="width:600px"}

4. GitHub Appに付与される権限を確認します。

    表示される権限が、スキャン対象Repositoryの読み取りに必要な範囲であることを確認してください。

    ![GitHub App Permissions](/img/code/github_app_install_permissions.png){style="width:600px"}

5. `Install`をクリックします。

    既にGitHub Appがインストール済みの場合は、Repository accessの更新画面として表示されることがあります。

    インストールを完了する前に、インストール先、Repository access、権限を確認し、画面に表示されるインストールボタンをクリックします。

    ![GitHub Appのインストール確認](/img/code/github_app_install_complete.png){style="width:600px"}

## Repository accessを変更する

スキャン対象Repositoryを追加または削除したい場合は、GitHub側でGitHub AppのRepository accessを変更してください。

1. GitHubで対象OrganizationまたはUserの`Settings`を開きます。
2. `GitHub Apps`または`Installed GitHub Apps`から`RISKEN Code App`を開きます。
3. `Repository access`で`All repositories`または`Only select repositories`を選択します。
4. `Only select repositories`の場合は、スキャン対象Repositoryを追加または削除します。
5. RISKENのGitHub設定画面でRepository一覧を再同期します。

![GitHub App Repository access](/img/code/github_app_install_repository_access.png){style="width:600px"}

## トラブルシュート

### インストール先Organizationが表示されない

ログイン中のGitHubユーザーが、対象Organizationのメンバーではない可能性があります。
Organization ownerに確認してください。

### Installボタンが表示されない、またはインストール申請になる

ログイン中のGitHubユーザーに、対象OrganizationへGitHub Appをインストールする権限がない可能性があります。
Organization ownerにインストールを依頼してください。
