# データソース

Codeサービスのデータソース設定について説明します

???+ warning "他者の環境に対してのスキャンはNGです"
    発見した場合、強制的にデータ削除する可能性があります

## GitHubリポジトリの設定
1. メニューより`Code > GitHub`をクリックします
2. 画面右側の`NEW`をクリックします
3. 以下の項目を入力し`EDIT`をクリックしてください

    ![GitHubSetting](/img/code/github_setting.png){style="width:500px"}    

    - **Name＊**: GitHub設定名
    - **Base URL**: GHESを利用する場合は設定する必要があります。詳細は[下記](#github-enterprise-server)を参照してください
    - **Type＊**: GitHubの種類 `Organization`または`User`を指定します
    - **TargetResouce＊**: GitHubのOrganization名またはUser名を入力します
    - **GitHubUser**: スキャンする際の認証情報（ユーザ名）を登録します
    - **PersonalAccessToken（PAT）**: スキャンする際の認証情報（Token）を登録します
        - 認証情報を登録しない場合はInternal／Privateリポジトリのスキャンはできません。
        - 認証情報はRISKEN上で暗号化して保存されます
        - 認証情報登録後に設定済みのTokenは閲覧できません（xxxxのようなマスク値で表示されます）
        - OAuthのスコープは `repo` と `read:org` （Organizationのスキャン時）を指定してください
        - 設定を変更する場合、再度PersonalAccessTokenを入力する必要があります
        ![Scope](/img/code/gitleaks_pat_scope.png){style="width:500px"}

4. 引き続き、データソースの設定を行います。詳細は[Gitleaks](gitleaks_datasource.md)、[Dependency](dependency_datasource.md)のデータソース設定を参照してください

## GitHub Enterprise Serverをスキャンする

オプションでGitHub Enterprise Server（GHES）をサポートしています

ただし、GHES上のリポジトリをスキャンする場合は以下のステップが必要です

1. 利用中のGEHS環境にて、GitHub v3 APIアクセスに対してIP制限をしている場合はRISKEN環境のIPを許可する必要があります（IPアドレスはRISKEN管理者にお問い合わせください）
2. GitHubのスキャン設定で `Base URL` を設定してください（e.g. http(s)://hostname/api/v3/）

