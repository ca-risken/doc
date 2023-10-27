# データソース

CodeScan のデータソース設定について説明します

## CodeScan スキャン設定

1. [Dependency 設定](dependency_datasource.md#Dependencyスキャン設定)を完了した後に設定画面が表示されます
2. 以下の項目を入力し`EDIT`をクリックしてください

   - **Enable CodeScan**: ON にすることで、CodeScan スキャンが設定できる様になります (新規登録時はデフォルトで ON)
     - OFF にして`EDIT`をクリックすることで、既存の設定が削除されます
   - **RepositoryPattern**: 上記の TargetResource 配下でスキャンしたいリポジトリ名を指定します。（部分一致）
     - 空欄の場合は、TargetResource 配下のリポジトリすべてが対象になります。
   - **リポジトリの可視性**: スキャン対象にする[可視性 :octicons-link-external-24:](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-repository-visibility){ target="_blank" } を選択してください（Internal／Private を対象にする場合は PAT の登録が必要です）
     - `Public`: インターネットに公開されているリポジトリをスキャンします
     - `Internal`: Enterprise 内のリポジトリをスキャンします
     - `Private`: プライベートリポジトリをスキャンします

   ![CodeScan設定](/img/code/codescan_setting.png){style="width:500px"}

既に GitHub 設定を登録済みの場合、以下の手順で CodeScan 設定画面へ移動します

1. メニューより`Code > GitHub`をクリックします
2. GitHub 設定一覧から変更したい列の`Action -> Edit Item`をクリックします
3. ダイアログにて code:codescan をクリックして、CodeScan の設定を開きます
