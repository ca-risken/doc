# RISKEN上のAWSデータソースの設定

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
