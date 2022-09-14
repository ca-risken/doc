# スキャン

データソース設定が完了したら、実際にスキャンできるかを確認します

1. メニューより`Code > GitHub`をクリックします
2. GitHub Setting一覧をクリックし設定済みのデータソースダイアログを開きます
3. code:dependencyをクリックして、Dependencyの設定を開きます
4. 画面右下の`Scan`をクリックします
5. Statusが`OK`となればデータ連携成功です（※エラー表示時は`3. の設定画面`にエラーメッセージが表示されます）
    - ![GitHubリスト](/img/code/github_list.png){style="width:400px"}
    - データソースが収集したFindingデータは `Finding > Finding` で確認することができます
6. 上記のように手動スキャンの他に連携済みのDataSourceは定期的に（日次）スケジュール実行されます
