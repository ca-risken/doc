# Domain

あなたが所有しているドメイン情報を登録することで、リスクの高いサブドメインを検出することができます

RISKENではOSINTツールのなかでドメイン情報に関するものを複数組み合わせて分析します

???+ tip "リスクの高いドメインとは？"
    RISKENでは以下の観点でドメインを解析します
    
    - 一般的に公開してはいけないプロダクション環境以外のURLがインターネット上にオープンになっていないか
    - [サブドメインテイクオーバー](https://developer.mozilla.org/en-US/docs/Web/Security/Subdomain_takeovers)の可能性のあるドメインがないか

## データソース

???+ warning "他者の環境に対してスキャンはNGです"
    発見した場合、強制的にデータ削除する可能性があります

1. メニューより`OSINT > OSINT`をクリックします
2. 画面右側の`NEW`をクリックします
3. 以下の項目を入力し`EDIT`をクリックしてください
    - **ResourceType**: Domainを指定（※現状Domain検索のOSINTのみサポート）
    - **ResourceName**: OSINTでモニタリングしたいDomain名を入力します
    - ![新規OSINT](/img/osint/osint_new.png){style="width:500px"}
4. OSINTリソースを登録後、一覧クリックしDataSource画面を開きます
5. DataSource一覧中のをクリックしダイアログを開き`ATTACH`をクリックします
    - ![OSINTアタッチ](/img/osint/osint_attach.png){style="width:400px"}
6. `osint:subdomain`の場合はDetectWordを登録することで、通常インターネット公開されてはいけないWEBサイトをモニタリングすることができます
    - 初期状態では以下のキーワードが登録されています
        - `jenkins`
        - `stg`
        - `dev`
        - `admin`
    - `NEW WORD`をクリックし、キーワードを追加することも可能です


## スキャン

データソース設定が完了したら、実際にスキャンできるかを確認します

1. メニューより`OSINT > OSINT`をクリックします
2. ATTACH済みのデータソースをクリックし、ダイアログを開きます
3. ダイアログ左下の`Scan`をクリックします
4. Statusが`OK`となればデータ連携成功です（※エラー表示時はダイアログにエラーメッセージが表示されます）
    - ![OSINTスキャン](/img/osint/osint_scan.png){style="width:450px"}
    - データソースが収集したFindingデータは`Finding > Finding`画面で確認することができます
5. 上記のように手動スキャンの他に連携済みのDataSourceは定期的に（日次）スケジュール実行されます


## フォーマット

## スコアリング

