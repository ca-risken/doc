# データソース

???+ warning "他者の環境に対してのスキャンはNGです"
    発見した場合、強制的にデータ削除する可能性があります

1. メニューより`OSINT > OSINT`をクリックします
2. 画面右側の`NEW`をクリックします
3. 以下の項目を入力し`EDIT`をクリックしてください
    - **ResourceType**: Domain,Websiteから指定してください
    - **ResourceName**: OSINTでモニタリングしたいDomain名またはウェブサイトのURLを入力します
    - **Activate DataSource**: チェックを入れることで、登録時にそのリソースタイプで利用可能なデータソースが有効化されます
    - ![新規OSINT](/img/osint/osint_new.png){style="width:500px"}
4. OSINTリソースを登録後、一覧クリックしDataSource画面を開きます
5. DataSource一覧中のをクリックしダイアログを開き`ATTACH`をクリックします
    - DataSource一覧には、設定したリソースタイプで有効なもののみ表示されます
    - ![OSINTアタッチ](/img/osint/osint_attach.png){style="width:400px"}
6. `osint:subdomain`の場合はDetectWordを登録することで、通常インターネット公開されてはいけないWEBサイトをモニタリングすることができます
    - 初期状態では以下のキーワードが登録されています
        - `jenkins`
        - `stg`
        - `dev`
        - `admin`
    - `NEW WORD`をクリックし、キーワードを追加することも可能です

