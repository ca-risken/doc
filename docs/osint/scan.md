# スキャン

データソース設定が完了したら、実際にスキャンできるかを確認します

1. メニューより`OSINT > OSINT DataSource`をクリックします
2. ATTACH済みのデータソースをクリックし、ダイアログを開きます
3. ダイアログ左下の`Scan`をクリックします
4. Statusが`OK`となればデータ連携成功です（※エラー表示時はダイアログにエラーメッセージが表示されます）
    - ![OSINTスキャン](/img/osint/osint_scan.png){style="width:450px"}
    - データソースが収集したFindingデータは`Finding > Finding`画面で確認することができます
5. 上記のように手動スキャンの他に連携済みのDataSourceは定期的に（日次）スケジュール実行されます
