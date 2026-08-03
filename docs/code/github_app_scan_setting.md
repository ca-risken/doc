# GitHub Appを使ったスキャン設定

GitHub App認証でCodeスキャンを行うには、RISKENでGitHub設定を作成し、GitHub連携を実行します。

事前に、スキャン対象のGitHub OrganizationまたはUserへGitHub Appをインストールしてください。
インストール方法は、[GitHub Appのインストール](github_app_install.md)を参照してください。

## 設定手順

1. RISKENでGitHub設定を作成します。

    `データソース > ソースコード > GitHub`からGitHub設定を作成し、認証方式に`GitHub App`を選択してください。

    `Type`と`TargetResource`がGitHub Appのインストール先と一致していることを確認し、`保存`をクリックします。

    ![GitHub App認証方式のGitHub設定](/img/code/github_app_setting_github_app_mode.png){style="width:600px"}

2. RISKENでGitHub連携を実行します。

    設定保存後、GitHub Appステータスが`GitHub連携待ち`になります。
    GitHub設定を作成したユーザーが対象Repositoryを扱えるGitHubユーザーであることを確認するため、`GITHUB連携`をクリックしてください。

    ![GitHub AppのGitHub連携待ちステータス](/img/code/github_app_integration_status.png){style="width:600px"}

    GitHubでの認証が完了してRISKENへ戻ると、GitHub設定一覧に`GitHub連携が完了しました。`と表示されます。

    ![GitHub AppのGitHub連携完了](/img/code/github_app_integration_complete.png){style="width:600px"}

## トラブルシュート

### GitHub Appのインストール状態を確認できない

**GitHub Appのインストール状態を確認できませんでした。** と表示される場合、設定の入力値が不正である可能性があります。
ベースURLなどの値が正しいか確認してください。GHESを使用していない場合、ベースURLの入力欄は空にしてください。

### RISKENでGitHub Appの検証に失敗する

以下を確認してください。

- GitHub Appが対象OrganizationまたはUserにインストールされていること
- RISKENのGitHub設定の`Type`と`TargetResource`が、GitHub Appのインストール先と一致していること
- Repository accessにスキャン対象Repositoryが含まれていること
- GitHub AppのPrivate KeyやApp IDなど、RISKEN環境側のGitHub App設定値が正しいこと

### スキャン対象Repositoryが表示されない

GitHub AppのRepository accessに対象Repositoryが含まれていない可能性があります。
GitHub側でRepository accessを更新した後、RISKEN側でRepository一覧を再同期してください。
