# アラート
RISKENでは問題のあるデータを発見しときにアラートを生成し通知を行う機能を実装しています。ここではアラートに関する操作方法を説明します。

---

## アラート確認
1. 事前に[アラート条件を設定](#_3)しておくことで、問題の箇所をアラート画面で確認することができます
2. 生成されたアラートを確認するには左メニューより`Alert > Alert`をクリックします
3. 現在有効なアラートが表示されます
    - ![alert_list.png](/img/risken/alert_list.png){style="width:600px"}
    - テキストボックスでアラートをフィルタすることができます
    - `Active Only`のチェック外すと過去のアラートを確認することができます
4. アラートの詳細をみるには一覧のデータをクリックします
    - ![alert_dialog.png](/img/risken/alert_dialog.png){style="width:600px"}
    - アラート条件に合致するFindingのリンクが表示されます
    - 画面下側にはアラートの更新履歴を確認することができます

---


## アラート設定
1. 事前に **アラート条件** を設定しておくことで、データ収集時に自動でアラート判定・通知を行うことが可能です
2. アラート条件には複数のアラートルールと通知先を登録することができます
    - アラート条件を作成する前に、まずルールと通知の設定を行います

### アラートルールの設定
1. 左メニューの`Alert > Rule`をクリックしてください
2. 画面右側の`NEW`をクリックします
3. 以下の項目を入力し`REGIST`をクリックします
    - **Name** : アラート名
    - [Findingのフィルタ条件]
        - **ResourceName** : リソース名（部分一致）
        - **Tag** : タグ名
    - **FindingCount**: 上記のフィルタ条件に合致するFinding数
    - **Score**: Findingのスコア（何pt以上かを指定）
    - ![alert_rule.png](/img/risken/alert_rule.png){style="width:600px"}

### 通知先の設定
1. 左メニューの`Alert > Notification`をクリックしてください
2. 画面右側の`NEW`をクリックします
3. 以下の項目を入力し`REGIST`をクリックします
    - **Name** : 通知名
    - **Type** : 現状`Slack`のみサポート
    - **Webhook URL** : [Incomming Webhook](https://api.slack.com/messaging/webhooks)で作成されたWebhook URLを指定
        - Incomming Webhookで上で指定したchannel/ icon/ nameで通知が飛びます
    - **Show Options** : チェックONにするとオプション設定を表示します
    - **Custom Message** : デフォルトの通知メッセージを上書きすることができます
        - デフォルトは `@xxxx アラートが発生しました` です
        - `@xxxx`の部分は設定したSeverityに応じて変化します
            - `High` : @channel
            - `Medium` : @here
            - `Low`: メンションなし
    - **Channel** （Depricated） : 通知先のチャンネルを指定します。現在、非推奨な設定項目です。
    - ![alert_notification.png](/img/risken/alert_notification.png){style="width:600px"}

### アラート条件の設定
1. 左メニューの`Alert > Condition`をクリックしてください
2. 画面右側の`NEW`をクリックします
3. Alert Conditionダイアログで以下の項目を入力し`REGIST`をクリックします
    - **Description**: アラートの説明
    - **Severity**: 重大度の選択
        - **High**: 最も危険なレベル。通知時時に `@channel` でメンションされます
        - **Medium**: 中間のレベル。通知時時に `@here` でメンションされます
        - **Low**: INFOレベル。通知時のメンションはなし。
    - **And Or**: アラートルールを複数設定する場合の評価方法を指定します
        - **And**: すべてのルールが `true` となった場合にアラートを生成します
        - **Or**: いずれか一つ以上のルールが `true` となった場合にアラートを生成します
    - **Notification Cache Term**: アラート通知を抑制するための設定です。設定した期間内では連続する通知を行いません
        - デフォルト1時間
    - **Enabled**: ON/OFFでアラート条件の有効/無効を切り替えます
    - **アラートルール**: 有効にしたいルールを選択します。（複数可）
    - **通知ルール**: 有効にしたい通知先を選択します。（複数可）
    - ![alert_condition.png](/img/risken/alert_condition.png){style="width:600px"}

---

## アラート除外設定

RISKENは定期的にデータソーススキャンをした後に登録済みのアラート条件に基づいて評価→アラート生成を行いますが、以下の操作をすることでアラートの評価対象から除外することができます

### アラートを `ペンディング` 状態にする
- ペンディング状態のアラートがあると、以降は当該アラート条件での通知が飛ばなくなります。
    - アラートの履歴データのみが保存される状態になります
    - 問題が解消され、アラートが `Deactive` な状態になると、新たにアラートが生成されるようになります
    - ＊アラートのライフサイクル: `Active` <-> `Pending` （手動更新） -> `Deactive`
- 以下の操作でペンディング状態にすることができます
    - `Alert > Alert`画面に遷移します
    - 一覧右側のアクションボタンから `Pending` をクリックする
    - ![alert_condition.png](/img/risken/alert_pend.png){style="width:600px"}

### Findingを `ペンディング` 状態にする
- 問題がないことがわかってるFinidingはペンディングさせることでアラートの評価対象から除外させることができます
- 以下の操作でFindingをペンディング状態にすることができます
    - `Finding > Finding`画面に遷移します
    - 一覧右側のアクションボタンから `Pend Finding` をクリックする
    - ![finding_pend.png](/img/risken/finding_pend.png){style="width:600px"}
    - 他にも一括選択でペンディング状態にすることができます
    - 詳細は[Findingの削除／ペンディング](/risken/finding/#_4)を参照してください
