# データソース

Dependencyのデータソース設定について説明します

???+ warning "他者の環境に対してのスキャンはNGです"
    発見した場合、強制的にデータ削除する可能性があります

## Dependencyスキャン設定

1. [Gitleaks設定](gitleaks_datasource.md#gitleaksスキャン設定)を完了した後に設定画面が表示されます
2. 以下の項目を入力し`EDIT`をクリックしてください
    - **Enable Dependency**: ONにすることで、Dependencyスキャンが設定できる様になります (新規登録時はデフォルトでON)
        - OFFにして`EDIT`をクリックすることで、既存の設定が削除されます
    ![Dependency設定](/img/code/dependency_setting.png){style="width:500px"}

既にGitHub設定を登録済みの場合、以下の手順でDependency設定画面へ移動します

1. メニューより`Code > GitHub`をクリックします
2. GitHub設定一覧から変更したい列の`Action -> Edit Item`をクリックします
3. ダイアログにてcode:dependencyをクリックして、Dependencyの設定を開きます

???+ warning "Limitation"
    以下の条件に該当するリポジトリはスキャン対象外になります

    - リポジトリのステータスが以下のもの
        - `Disabled`
        - `Forkリポジトリ`
            - ＊[Forkリポジトリ :octicons-link-external-24:](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo){ target="_blank" } とは一般的にはオリジナルリポジトリへの貢献（修正の提案）のために作成されるリポジトリです
    - リポジトリのサイズによる制限があります（詳細はシステム管理者に問い合わせてください）
    - RISKEN環境からcloneできないもの

