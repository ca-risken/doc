# Finding
RISKENではあらゆるセキュリティリスクデータをFindingという形式で保存・利用します。
ここではFindingデータに関する操作方法を説明します。

---

## 検索

1. 左メニューより`Finding > Finding`をクリックしてください
2. 現在収集済みのFinding（各種スキャナで収集済みのデータ）が一覧表示されます
    - ![Findingリスト](/img/risken/finding_list.png){style="width:400px"}
    - Findingにはリスク値に応じたスコアやデータソース情報、リソース名、タグ情報などが表示されます
3. 詳細を確認するには一覧の行をクリックしてください
    - ![Findingリスト](/img/risken/finding_detail.png){style="width:400px"}
4. Findingの一覧画面では以下の検索フィルターをサポートしています
    - **ResourceName**: リソース名（部分一致）
    - **Tag**: タグ（例えばAWS関連のデータでフィルタしたい場合には `aws` タグを指定します）
    - **DataSource**: データソース（部分一致。どこからFinding収集されたか識別するラベル）
    - **Score**: スコア（0.0 ~ 1.0）
5. またResource画面（`Finding > Resource`）では、Resource名のレベルで検索することも可能です
    - 上記フィルタの他にリソースの登録日でフィルタすることができます（カレンダーのFrom-To指定）
    - ![Findingリスト](/img/risken/finding_resource.png){style="width:400px"}

---

## スコアリング

Findingには必ず `スコア`が設定されます。
全てのデータソースで評価されるスコアはバラツキがありますが、RISKENに登録される際には必ず `0.0 ~ 1.0` の間の数値に標準化されます。
スコアによってリスクの高いデータをフィルタしたり優先順位設定のための意思決定を支援します。


### スコア帯域

RISKENでは以下の帯域によってSeverity（重大度）や色分けにて区別をしています

???+ inline end "詳細"
    データソースごとの詳細なスコア判定については、各データソースのページを参照してください。

| Score       | 重大度                              | 説明                                                                   |
| :---------- | :--------------------------------- | :-------------------------------------------------------------------- |
| `0.8 ~ 1.0` | :material-alert:                高 | 危険という判定です。すぐに確認し必要があればインシデント発生前に対処すべきです。    |
| `0.4 ~ 0.7` | :material-check-circle-outline: 中 | すぐにではないですが、時間がある時に確認してください。                      　  |
| `0.0 ~ 0.3` | :material-cancel:               低 | 無視しても大丈夫です。気になる場合はチェックしてください。                       |

---

## ChatGPTアシスト機能

Finding詳細のモーダル画面を開くと右上に `ChatGPTに聞いてみる` ボタンが表示されます。

![ChatGPT](/img/risken/finding_openai.png){style="width:500px"}

???+ warning "ChatGPT機能はオプションです"
    ChatGPT機能を利用するにはOpenAIのAPIトークンが必要です。
    サーバ側でAPIトークンを `OPEN_AI_TOKEN` 変数にロードする必要があります。（パラメータの詳細は[こちら](/admin/param_core/)）
    詳細はシステム管理者にお問い合わせください。

- ボタンをクリックするとセキュリティの問題を翻訳・要約・推奨アクションの提案をしてくれます
- 専門的な用語が含まれる場合、セキュリティのスペシャリスト以外は理解に時間がかかるケースがあります
- ChatGPTによる要約で理解をアシストしてくれます
    - しかし、AIによる自動生成のコンテンツを100%信頼することは危険なので、提案事項の検証は必要です
- また、以下のようなセキュリティの懸念があるため制約事項をいくつか設けています
    - 送信するデータはFindingデータの一部のみとし、クラウド環境が特定される情報は極力排除する方針にします
        - ただし、OpenAIの[ポリシー](https://openai.com/policies/api-data-usage-policies)ではAPI経由で送信されたデータはモデルの学習などには活用されないとあります
    - プロンプトはサーバ側で生成します
        - プロンプトインジェクションやジェイルブレキングなどの[LLMに対するセキュリティ脅威](https://github.com/dair-ai/Prompt-Engineering-Guide/blob/main/guides/prompts-adversarial.md)を考慮した背景があります

---

## 削除／ペンディング

Findingで検出された問題を修復した場合は、以下のいずれかのパターンの対応が必要です。

1. 放置
    - 状態が変化しFiniding自体のスコアが下がる場合は特に何も対応は必要ありません
    - ほとんどの場合はこれに該当します

2. 削除
    - 問題は解決したが、Finidingのスコアが下がらない場合はFinding自体を削除してください
    - もし、解決したつもりだったが問題が残っていた場合は、次のデータ収集タイミングで新たにFindingが生成されてしまいます

3. ペンディング
    - Findingを確認した結果、 `対応しない` という判断をする場合はペンディング状態にしておく必要があります（リスク受容）
    - ペンディング中のFindingは[アラート](/risken/alert/)の評価から外れます

???+ inline end "Hint!"
    `削除`や`ペンディング` はFinding一覧の右側のメニューから実行できます

![Findingアクション](/img/risken/finding_action.png){style="width:400px"}


### 一括更新

Findingを一括で更新する場合は以下の手順で実施します

- Findingで更新したいリストにフィルタします
- 一覧の左側のチェックボックスで更新対象を選択します
- 画面右上側のメニューより以下の選択します
    - 一括削除
    - 一括ペンディング

![Finding選択](/img/risken/finding_selected.png){style="width:400px"}

---

## タグ

Findingの詳細ダイアログより `NEW TAG`ボタンからFinidngにタグ設定することができます。
タグはフィルタリングやアラート条件に設定することが可能です。

---


## 設定

`Finding > 設定`よりFindingに関する設定を行うことができます。

### スコア調整

リソース名の単位で細かなスコアリングの調整が可能です。
プロジェクトにとって重要なリソースにはスコアを上げたり、あるいはそれほど重要ではないリソースはスコアを下げることもできます。
ただし、スコアは必ず `0.0 ~ 1.0` の範囲に収まります（範囲を超える場合は最小値または最大値が設定されます）。

- `Finding > 設定`を開きます
- 画面右側の`new`をクリックします
- 対象のリソース名（前方一致）とスコア係数を設定します
    - `1.0` より大きい係数を設定した場合は実際のスコアはベーススコアよりも大きくなります
    - `1.0` より小さい係数を設定した場合は実際のスコアはベーススコアよりも小さくなります
![Finding設定](/img/risken/finding_setting.png){style="width:400px"}
