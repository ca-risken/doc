# スキャン

データソース設定が完了したら、実際にスキャンできるかを確認します

1. `Azure > Azure DataSource`画面に遷移します
2. データソースの一覧をクリックし左下にある`SCAN`をクリックします
3. Status欄が`OK`になれば連携成功です（※エラー表示時はダイアログにエラーメッセージが表示されます）
    - ![scan](/img/azure/scan.png){style="width:400px"}
    - データソースが収集したFindingデータは`Finding > Finding`画面で確認することができます
4. 上記のように手動スキャンの他に連携済みのDataSourceは定期的にスケジュール実行されます

