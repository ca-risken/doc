# データソース

Gitleaksのデータソース設定について説明します

???+ warning "他者の環境に対してのスキャンはNGです"
    発見した場合、強制的にデータ削除する可能性があります

1. メニューより`Code > Gitleaks`をクリックします
2. 画面右側の`NEW`をクリックします
3. 以下の項目を入力し`EDIT`をクリックしてください
    - **Name ＊**: Gitleaks設定名
    - **Type ＊**: GitHubの種類 `Organization`または`User`を指定します
    - **TargetResouce ＊**: GitHubのOrganization名またはUser名を入力します
    - **RepositoryPattern**: 上記のTargetResource配下でスキャンしたいリポジトリ名を指定します。（部分一致）
        - 空欄の場合は、TargetResource配下のリポジトリすべてが対象になります。
    - **GitHubUser**: スキャンする際の認証情報（ユーザ名）を登録します
    - **PersonalAccessToken（PAT）**: スキャンする際の認証情報（Token）を登録します
        - 認証情報を登録しない場合はInternal／Privateリポジトリのスキャンはできません。
        - 認証情報はRISKEN上で暗号化して保存されます
        - 認証情報登録後に設定済みのTokenは閲覧できません（xxxxのようなマスク値で表示されます）
    - **リポジトリの可視性**: スキャン対象にする[可視性 :octicons-link-external-24:](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-repository-visibility){ target="_blank" } を選択してください（Internal／Privateを対象にする場合はPATの登録が必要です）
        - `Public`: インターネットに公開されているリポジトリをスキャンします
        - `Internal`: Enterpris内のリポジトリをスキャンします
        - `Private`: プライベートリポジトリをスキャンします
    - ![Gitleask設定](/img/code/gitleaks_setting.png){style="width:500px"}

???+ warning "Limitation"
    以下の条件に該当するリポジトリはスキャン対象外になります

    - リポジトリのステータスが以下のもの
        - `Archived`
        - `Disabled`
        - `Forkリポジトリ`
            - ＊[Forkリポジトリ :octicons-link-external-24:](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo){ target="_blank" } とは一般的にはオリジナルリポジトリへの貢献（修正の提案）のために作成されるリポジトリです
    - リポジトリのサイズが350MB以上のもの
    - RISKEN環境からcloneできないもの
