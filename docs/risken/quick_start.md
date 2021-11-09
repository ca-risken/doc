# Quick Start

このページでは、RISKENを使用してあなたのシステム環境のセキュリティモニタリングを設定する方法について説明します


## 始める前に

1. [プロジェクトを作成します :octicons-link-external-24:](/risken/project/#_2){ target="_blank" }
    - すでに作成済みの場合はスキップしてください

2. [SlackのWebhook URLを準備する :octicons-link-external-24:](https://api.slack.com/messaging/webhooks){ target="_blank" }
    - 現在Slackのみサポートしています


## データソースを設定する

1. まずはあなたの環境のセキュリティ情報を収集します

???+ tip "RISKENではさまざまデータソースをサポートしています"
    あなたの環境に応じていずれか一つ以上を設定してください

- [AWS :octicons-link-external-24:](/aws/overview_datasource/){ target="_blank" }
- [GCP :octicons-link-external-24:](/google/overview_datasource/){ target="_blank" }
- [WordPress :octicons-link-external-24:](/diagnosis/wpscan_datasource/){ target="_blank" }
- [ドメイン :octicons-link-external-24:](/osint/domain_datasource/){ target="_blank" }
- [ソースコード :octicons-link-external-24:](/code/gitleaks_datasource/){ target="_blank" }

## スキャンする

1. データソースが登録できたら各データソースのダイアログを開き `SCAN` ボタンをクリックしてください
    - ![GCPデータソース](/img/google/gcp_datasource_list.png){ style="width: 460px;"}
2. ステータスが `OK` になったらスキャン完了です
3. `Finding > Finding`画面に遷移して収集したデータを確認してください
    - ![Finding](/img/risken/finding_list.png){ style="width: 400px;"}

## アラートを設定する

1. スコア0.8以上の`ルール`を作成する
    - `over 0.8` という名前の[アラートルールを作成 :octicons-link-external-24:](/risken/alert/#_4){ target="_blank" } してください
2. Slackの`通知`設定を行う
    - チャンネル名で[通知先を作成 :octicons-link-external-24:](/risken/alert/#_5){ target="_blank" } してください
3. `アラート条件`を作成し、ルールと通知先を指定してください
    - `over 0.8` という名前の[アラート条件を作成 :octicons-link-external-24:](/risken/alert/#_6){ target="_blank" } してください

## 次のステップ

1. あなたが保有しているシステム環境に応じて、必要なデータソースを設定してください
2. プロジェクトに関係者を招待してください
    - ただし、招待するまえにRISKENにログインしておく必要があります
