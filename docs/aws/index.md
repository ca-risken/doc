# AWS

RISKEN上にあなたのAWSアカウントを登録することで、AWS関連のセキュリティデータを収集することができます

- AWSの各種データソースを有効にすると自動収集プログラムがスケジュールされます
- どのようなデータが収集されるかは、データソースごとのドキュメントを参照してください
- 全てのデータソースを有効にすることを推奨しますが、一部のデータソースのみを有効化することもできます

ここではAWS向けの各種データソース設定に関する説明をします。

---

## 事前準備

AWSのデータソース設定には以下の2つの作業が必要です

1. RISKEN上のAWS設定
2. AWS側のIAMロール作成

---
## RISKEN上のAWS設定

1. メニューより`AWS > AWS`をクリックしAWSの設定画面に遷移します
2. 画面右側の`NEW`をクリックします
3. AWSダイアログで以下の項目を入力し`REGIST`をクリックします
    - **Name**: あなたの(スキャン対象の)AWS名
    - **AWS Account ID**: あなたのAWSアカウントID（12桁）
    - ![新規AWS](/img/aws/aws_new_account.png){style="width:300px"}
4. AWSアカウント登録後に、一覧に表示されたデータ行をクリックしAWSのDataSource画面を開きます
5. 一覧右上側の`SETUP ALL`をクリックします
    - ![setup all](/img/aws/aws_setup_btn.png){style="width:300px"}
6. ダイアログに以下の項目を設定し、`ATTACH ALL`をクリックします
    - **AssumeRole**: このあと作成する予定のIAMロールのARNを入力します
```
arn:aws:iam::{AWSアカウントID}:role/RISKEN
```
        - ここではロール名を `RISKEN` としています
        - 任意のロール名でも問題ありません
    - **External ID**: `AUTO-GENERATE EXTERNAL ID`ボタンをクリックしランダムな文字列を設定してください

        ???+ inline end info "[補足]"
            - RISKENの環境は複数のAWSを監視しています
            - 他のプロジェクトがあなたのAWSを参照しないように区別する必要があります

        - RISKENの環境からあなたのAWSを参照する際にExternal ID（外部ID）で識別します


    - ![setupダイアログ](/img/aws/aws_setup_dialog.png){style="width:400px"}
7. ここで設定した`AssumeRole`と`ExternalID`は次のIAMロール作成時に必要です
    - 必要に応じて :material-content-copy: （コピーボタン）をご利用ください

---
## AWS側のIAMロール作成

AWSマネージメントコンソールからの設定例を記載します

1. AWSのマネージメントコンソールで `IAM` サービスに遷移します
2. 新規IAMポリシーを作成します
    - IAMのポリシーメニューから `ポリシーの作成`をクリックしてください
        - ![ポリシーボタン](/img/aws/aws_policy_btn.png){style="width:300px"}
    - `JSON` タブを開き以下を貼り付け、ポリシーの確認をクリックしてください
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ses:DescribeActiveReceiptRuleSet",
                "elastictranscoder:ListPipelines",
                "servicequotas:ListServiceQuotas"
            ],
            "Resource": "*"
        }
    ]
}
```
        - ![ポリシーエディタ](/img/aws/aws_policy_editor.png){style="width:400px"}
    - 名前欄に `RISKEN` と入力して`ポリシー作成`をクリックしてください
        - ![ポリシー作成](/img/aws/aws_policy_create.png){style="width:400px"}

3. 新規IAMロールを作成します
    - IAMのロールメニューから `ロールの作成` をクリックしてください
        - ![ロール作成](/img/aws/aws_role_btn.png){style="width:400px"}
    - `信頼されたエンティティの種類を選択` で`別のAWSアカウント`を選択し以下を入力してください
        - アカウントID: 以下、RISKENのAWSアカウントIDです.このアカウントを信頼済みに登録する必要があります
```
315855282677
```
        - 外部ID:
```
{先程、自動生成した外部ID}
```
        - ![プリンシパル](/img/aws/aws_role_principal.png){style="width:500px"}
        - `次のステップ` をクリックしてください
    - アクセス権限の画面で以下の２つのポリシーを検索しチェックしてから、`次のステップ` をクリックしてください
        - `RISKEN` （先程作ったポリシー）
        - `SecurityAudit` （マネージメントポリシー）
    - タグ設定の画面で `次のステップ` をクリックしてください
    - 確認画面でロール名に `RISKEN` と入力し `ロールの作成` をクリックしてください
        - ![ロール作成](/img/aws/aws_role_create.png){style="width:400px"}


---
## AWSのスキャン

AWSのデータソース設定が完了したら、実際にスキャンを実行し問題なく疎通するかを確認します。


1. 各種スキャナーの一覧をクリックし左下にある`SCAN`をクリックします
    - ![scan](/img/aws/aws_scan.png){style="width:400px"}
2. Status欄が`OK`になれば連携成功です（※エラー表示時はダイアログにエラーメッセージが表示されます）
    - データソースが収集したFindingデータは`Finding > Finding`画面で確認することができます
3. 上記のように手動スキャンの他に連携済みのDataSourceは定期的にスケジュール実行されます
