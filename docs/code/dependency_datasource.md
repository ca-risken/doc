# データソース

Dependencyのデータソース設定について説明します

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

