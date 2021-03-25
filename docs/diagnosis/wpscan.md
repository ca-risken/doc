# Wordpress

[wpscan](https://wordpress.org/plugins/wpscan/)でスキャンした結果をRISKEN上へ取り込むことが可能です

???+ help "wpscanとは？"
    `wpscan` を使うとWordpressで構築されたWEBサイトに対して、以下のような問題がないかを確認することができます

    - 設定の問題
    - 古いバージョンのプラグインを利用している


## データソース

WPScanのデータソース設定について説明します

???+ warning "他者の環境に対してスキャンはNGです"
    発見した場合、強制的にデータ削除する可能性があります

1. メニューより`Diagnosis > WPScan`をクリックします
2. 画面右側の`NEW`をクリックします
3. 以下の項目を入力し`EDIT`をクリックしてください
    - **Target URL**: 診断対象のWordPressのトップページのURL
    - ![新規wpscan](/img/diagnosis/wpscan_new.png){style="width:400px"}

## スキャン

データソース設定が完了したら、実際にスキャンできるかを確認します

1. メニューより`Diagnosis > WPScan`をクリックします
2. WPScan一覧をクリックし設定済みのデータソースダイアログを開きます
    - ![wpscanスキャン](/img/diagnosis/wpscan_scan.png){style="width:400px"}
3. 画面左下の`Scan`をクリックします
4. Statusが`OK`となればデータ連携成功です（※エラー表示時はダイアログにエラーメッセージが表示されます）
    - データソースが収集したFindingデータは`Finding > Finding`画面で確認することができます
5. 上記のように手動スキャンの他に連携済みのDataSourceは定期的に（日次）スケジュール実行されます

## フォーマット

## スコアリング

