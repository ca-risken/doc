# データソース

Gitleaksのデータソース設定について説明します

## Gitleaksスキャン設定

1. [GitHub設定](github_setting.md#githubリポジトリの設定)を完了した後に設定画面が表示されます
2. 以下の項目を入力し`EDIT`をクリックしてください
    - **Enable Gitleaks**: ONにすることで、Gitleaksスキャンが設定できる様になります (新規登録時はデフォルトでON)
        - OFFにして`EDIT`をクリックすることで、既存の設定が削除されます
    - **RepositoryPattern**: 上記のTargetResource配下でスキャンしたいリポジトリ名を指定します。（部分一致）
        - 空欄の場合は、TargetResource配下のリポジトリすべてが対象になります。
    - **リポジトリの可視性**: スキャン対象にする[可視性 :octicons-link-external-24:](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-repository-visibility){ target="_blank" } を選択してください（Internal／Privateを対象にする場合はPATの登録が必要です）
        - `Public`: インターネットに公開されているリポジトリをスキャンします
        - `Internal`: Enterprise内のリポジトリをスキャンします
        - `Private`: プライベートリポジトリをスキャンします

    ![Gitleaks設定](/img/code/gitleaks_setting.png){style="width:500px"}

3. `EDIT`をクリックした後、[Dependency設定](dependency_datasource.md)に遷移します

既にGitHub設定を登録済みの場合、以下の手順でGitleaks設定画面へ移動します

1. メニューより`Code > GitHub`をクリックします
2. GitHub設定一覧から変更したい列の`Action -> Edit Item`をクリックします
3. ダイアログにてcode:gitleaksをクリックして、Gitleaksの設定を開きます

