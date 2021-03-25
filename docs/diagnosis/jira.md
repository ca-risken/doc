# JIRA

脆弱性診断のチケット管理を[JIRA](https://www.atlassian.com/ja/software/jira)上で行っている場合に、RISKENのFindingへ取り込むことが可能です

## データソース

**※ JIRAデータソース設定は現状管理者のみ可能となっています。**

設定が必要な方は[Contact us](/contact/contact/)までご連絡ください

1. メニューより`Diagnosis > JIRA`をクリックします
2. 画面右側の`NEW`をクリックします
    - ![新規JIRA](/img/diagnosis/jira_new.png){style="width:400px"}
3. 以下の項目を入力し`EDIT`をクリックしてください
    - **Name**: JIRA名
    - フィルタ設定（以下のJIRA IDまたはKeyを指定）
        - **JIRA Key**: JIRA プロジェクトキー（JIRA画面上のプロジェクト一覧で表示される赤い囲み部分のキー）
        - ![JIRAプロジェクトキー](/img/diagnosis/jira_project_key.png){style="width:500px"}

## スキャン

データソース設定が完了したら、実際にスキャンできるかを確認します

1. メニューより`Diagnosis > JIRA`をクリックします
2. JIRA一覧をクリックし設定済みのデータソースダイアログを開きます
    - ![JIRAスキャン](/img/diagnosis/jira_scan.png){style="width:400px"}
3. 画面左下の`Scan`をクリックします
4. Statusが`OK`となればデータ連携成功です（※エラー表示時はダイアログにエラーメッセージが表示されます）
    - データソースが収集したFindingデータは`Finding > Findign`画面で確認することができます
5. 上記のように手動スキャンの他に連携済みのDataSourceは定期的に（日次）スケジュール実行されます

## フォーマット

## スコアリング

