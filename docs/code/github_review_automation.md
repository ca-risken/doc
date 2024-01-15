# セキュリティレビューを自動化する

RISKENではソースコードレビューの自動化のためのツール `RISKEN Security Review` を提供しています。

GitHubのプルリクエストをトリガーにして実行され、シークレットのコミットや、インジェクションなどのサイバー攻撃になりうる危険なコードを検知し、プルリクエストのコメントでレビュー指摘をするツールになります。

![RISKEN Security Review](https://github.com/ca-risken/security-review/raw/main/image/pullrequest-review.png){style="width:700px"}

???+ info "仕組み"
    RISKEN Security ReviewはGitHub Actions（カスタムアクション）として実行されます。
    以下のMarketPlaceにも公開しています。

    - [RISKEN Security Review :octicons-link-external-24:](https://github.com/marketplace/actions/risken-security-review){ target="_blank" }

## 特徴

RISKEN Security Reviewの主な特徴は以下になります。

- PRコメントで指摘する
    - シークレットのコミット
    - セキュリティ上問題のあるコード
- 高速に動作する
    - 類似のコードレビュー関連のツールと比べて高速に動作
    - ビルド済みの軽量なコンテナを実行
    - コード全体ではなく変更箇所のみスキャン
    - HEADのみをチェックアウトするので大きなリポジトリでも動作可能
    - 小さな変更であれば10秒〜60秒程度で完了

## 個別のリポジトリに設定する

GitHub Actionsのワークフローファイルを作成することで動作します。

1. 対象リポジトリにて `.github/workflows/security-review.yaml` ファイルを作成します
2. 作成したファイルに以下のコードをコピー＆ペーストします

```yaml
name: Security Code Review on PR
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  review:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pull-requests: write

    steps:
      - uses: actions/checkout@v4
      - uses: ca-risken/security-review@v1
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

### RISKEN環境へ統合

上記まででも動作しますが、オプションとして既存のRISKEN環境へ統合することができます

- RISKENへ統合することで以下のメリットがあります
    - 生成AIの解説や推奨コメントが確認できる
    - 重大度やスコア、関連リンクなど、スキャン結果の詳細が確認できる
    - セキュリティチームへ共有し専門家のアドバイスを受けられる
- RISKENへの統合を有効化するには以下のオプションを追記してください
    - `risken_console_url`
    - `risken_api_endpoint`
    - `risken_api_token`
- 最終的なワークフローファイルは[以下（サンプル）](#_4)のようになります

このJOBを実行するにはGitHub Actionsが参照できる`secrets`を事前に登録する必要があります。


| Pameter | Key | Description | Required | Default | Examples |
| ---- | ---- | ---- | ---- | ---- | ---- |
| `risken_console_url` | `RISKEN_CONSOLE_URL` | RISKEN Console URL | `no` | | https://console.your-env.com |
| `risken_api_endpoint` | `RISKEN_API_ENDPOINT` | RISKEN API Endpoint | `no` | | https://api.your-env.com |
| `risken_api_token` | `RISKEN_API_TOKEN` | RISKEN API Token | `no` | | xxxxx |


???+ info "事前にアクセストークンの発行が必要になります"
    RISKENの対象プロジェクトでアクセストークンを発行する必要があります。

    - [RISKENのアクセストークンを発行する :octicons-link-external-24:](/risken/access_token/){ target="_blank" }
    - [GitHub Actions用のSecretsを登録する :octicons-link-external-24:](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions){ target="_blank" }

## Organization全体に適用する

Organization管理者の場合は個別のリポジトリに設定する以外に、Organization全体でコードレビューを有効化することが可能です。

1. Organization内に `.github` リポジトリを作成します（作成済みの場合はそのまま利用します）
    - `.github` リポジトリとは、共通のテンプレートやワークフローを保存するための特別なリポジトリです
    - ただし、他のリポジトリでも問題ありません
2. Organizationの設定でRISKEN情報を登録する(`optional`)
    - Organization secretsに `RISKEN_CONSOLE_URL` を保存します（VisibilityはAll repositories）
    - Organization secretsに `RISKEN_API_ENDPOINT` を保存します（VisibilityはAll repositories）
    - Organization secretsに `RISKEN_API_TOKEN` を保存します（VisibilityはAll repositories）
        - 事前にRISKEN環境で[アクセストークン :octicons-link-external-24:](/risken/access_token/){ target="_blank" } を発行する必要があります
3. `.github` リポジトリに以下の[ワークフローファイル](#_4)を作成します
4. Organization設定で `rulesets` を作成します
    - [rulesetsとは？ :octicons-link-external-24:](https://docs.github.com/en/enterprise-cloud@latest/organizations/managing-organization-settings/managing-rulesets-for-repositories-in-your-organization){ target="_blank" }
    - rulesetsで `New branch ruleset` を新規作成します
    - 対象のリポジトリとブランチを指定します（以下は全てのリポジトリのデフォルトブランチをターゲットに設定します）
        - `All Repositories` を指定します
        - ブランチは `Include default branches` を指定します
    - `Require workflows to pass before merging` にチェックを入れ、上記で作成したワークフローファイルを指定します
        - リポジトリは `.github` を指定します
        - バージョンはマスターブランチ（`master`や`main`など）指定してください
            - 特定のバージョンの指定（ブランチ、タグ、コミットSHA）も可能です
        - ワークフローファイルは `.github/workflows/security-review.yaml` を指定します

![GitHubSetting](/img/code/github_rulesets_workflow.png){style="width:800px"}

???+ tip "リポジトリの可視性について"
    - 今回の手順では `.github` リポジトリを利用しましたが、Organization内にPublicなリポジトリがある場合には、ワークフローファイルが参照できない可能性があります
        - 原因はパブリックリポジトリはパブリックなワークフローファイルしか参照できないためです
        - `.github` リポジトリをpublicにすることでこの問題は解決しますが、公開できないテンプレートやワークフロー、プロファイルデータがある場合には、別のリポジトリを用意してください
    - 詳細は [workflow設定 :octicons-link-external-24:](https://docs.github.com/en/enterprise-cloud@latest/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/available-rules-for-rulesets#require-workflows-to-pass-before-merging) を参照してください

## ワークフローファイル（サンプル）

以下を `.github/workflows/security-review.yaml` というファイル名で保存してください（yamlファイル名は任意です）

```yaml
name: Security Code Review on PR
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  review:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pull-requests: write

    steps:
      - uses: actions/checkout@v4
      - uses: ca-risken/security-review@v1
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          risken_console_url: ${{ secrets.RISKEN_CONSOLE_URL }}
          risken_api_endpoint: ${{ secrets.RISKEN_API_ENDPOINT }}
          risken_api_token: ${{ secrets.RISKEN_API_TOKEN }}
```
