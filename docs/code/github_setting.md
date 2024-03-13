# データソース

Codeサービスのデータソース設定について説明します

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
        - [Fine-grained personal Access Token](#fine-grained-personal-access-token) または、[Personal Access Token (classic)](#personal-access-token-classic) のどちらかのPATを生成してください
        - 認証情報を登録しない場合はInternal／Privateリポジトリのスキャンはできません。
        - 認証情報はRISKEN上で暗号化して保存されます
        - 認証情報登録後に設定済みのTokenは閲覧できません（xxxxのようなマスク値で表示されます）
        - 設定を変更する場合、再度PersonalAccessTokenを入力する必要があります

4. 引き続き、データソースの設定を行います。詳細は[Gitleaks](gitleaks_datasource.md)、[Dependency](dependency_datasource.md)のデータソース設定を参照してください

### Fine-grained personal Access Token

Fine-grained personal Access Tokenはきめ細かなアクセス制御が可能な点で、従来のPAT(classic)よりもセキュリティ上の利点があります。

- **Resource owner** のプルダウンでスキャン対象のユーザ／Organizationを選択してください
- **Repository access** でスキャン対象のリポジトリを指定してください（全体をスキャンする場合は `All repository` を選択）

![setting1](/img/code/gitleaks_fgpat_setting1.png){style="width:800px"}

- **Permissions** では、`Repository permissions` 欄から `Contents(Read-only)` を選択してください
    - ただし、 **Repository access** で `Public Repositories (read-only)` を選択した場合は設定不要です

![setting2](/img/code/gitleaks_fgpat_setting2.png){style="width:600px"}

- `Generate token` でトークンを生成しRISKENのGitHub設定画面に登録してください

### Personal Access Token (classic)

Personal Access Token (classic)は、保持者がアクセス可能なすべてのリポジトリへの権限を持ちます。

- トークンを発行する際に指定するOAuthのスコープは `repo` と `read:org` （Organizationのスキャン時）を選択してください。

![Scope](/img/code/gitleaks_pat_scope.png){style="width:800px"}

- `Generate token` でトークンを生成しRISKENのGitHub設定画面に登録してください

## GitHub Enterprise Serverをスキャンする

オプションでGitHub Enterprise Server（GHES）をサポートしています

ただし、GHES上のリポジトリをスキャンする場合は以下のステップが必要です

1. 利用中のGEHS環境にて、GitHub v3 APIアクセスに対してIP制限をしている場合はRISKEN環境のIPを許可する必要があります（IPアドレスはRISKEN管理者にお問い合わせください）
2. GitHubのスキャン設定で `Base URL` を設定してください（e.g. http(s)://hostname/api/v3/）

???+ warning "Limitation"
    以下の条件に該当するリポジトリはスキャン対象外になります

    - リポジトリのステータスが以下のもの
        - `Archived` (Gitleaksのみ対象外になります)
        - `Disabled`
        - `Forkリポジトリ`
            - ＊[Forkリポジトリ :octicons-link-external-24:](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo){ target="_blank" } とは一般的にはオリジナルリポジトリへの貢献（修正の提案）のために作成されるリポジトリです
    - リポジトリのサイズによる制限があります（詳細はシステム管理者に問い合わせてください）
    - RISKEN環境からcloneできないもの