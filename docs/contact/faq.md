# FAQ

WPScanのスキャン実行時にエラーが発生する
-------------------
`Failed exec WPScan Ask the system administrator.`というエラーが表示されている場合、以下をご確認ください  

1. スキャン対象のサイトがWordPressで作成されていることを確認する
2. RISKENからスキャン対象のサイトへの通信が許可されていることを確認する
    - RISKENのIPアドレスからの通信を許可する必要があります
    - BASIC認証などの制御が行われている場合、現状スキャンができません
3. スキャン対象への通信がWAF(Web Application Firewall)などによりフィルタリングされている
    - `Setting Detail`から以下の設定を有効にすることでスキャンが可能になる場合があります
        - `Use a random user-agent for each scan` にチェックを入れる
4. WordPressインストール時に`wp-content`ディレクトリをデフォルトのディレクトリから変更している
    - `Setting Detail`から以下の設定を有効にすることでスキャンが可能になる場合があります
        - `The wp-content dirctory`のテキストボックスに変更後のディレクトリを入力する
5. その他の場合
    - `Setting Detail`から以下の設定を有効にすることでスキャンが可能になる場合があります
        - `Do not check if the target is running WordPress or returns a 403` にチェックを入れる
        - 加えて インストール時の`wp-content`ディレクトリを変更していない場合でも、3. の設定にて`wp-content`と入力することで解決する場合があります
6. それでも解決しない、または異なるエラーが表示されている場合
    - システム管理者へお問い合わせください