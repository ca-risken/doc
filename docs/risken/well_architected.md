# Well-Architected

RISKENではメインのセキュリティ機能の他に、AWSの[Well-Architectedフレームワーク :octicons-link-external-24:](https://aws.amazon.com/jp/architecture/well-architected){ target="_blank" } を基に[５つの柱](/risken/well_architected/#5) の中でも「セキュリティ」以外の柱に対応した `タグ` をFindingに付与します。（セキュリティに関してはメイン機能なので割愛）

???+ note "Well-Architectedタグは試験的な機能です"
    RISKENではすべての項目を網羅しているものではないため（むしろほんの一部です）Well-Architected全体を見直す場合には、組織内の専門チームに相談してください


## 5つの柱

1. [運用上の優秀性 :octicons-link-external-24:](https://wa.aws.amazon.com/wat.pillar.operationalExcellence.en.html){ target="_blank" }
2. [セキュリティ :octicons-link-external-24:](https://wa.aws.amazon.com/wat.pillar.security.en.html){ target="_blank" }
3. [信頼性 :octicons-link-external-24:](https://wa.aws.amazon.com/wat.pillar.reliability.en.html){ target="_blank" }
4. [パフォーマンス効率 :octicons-link-external-24:](https://wa.aws.amazon.com/wat.pillar.performance.en.html){ target="_blank" }
5. [コスト最適化 :octicons-link-external-24:](https://wa.aws.amazon.com/wat.pillar.costOptimization.en.html){ target="_blank" }


## Well-Architectedタグ

| 5つの柱          | タグ          | 説明                                                       |
| --------------- | ------------- | --------------------------------------------------------- |
| 運用上の優秀性    | `operation`   | 運用上の優秀生の考え方に沿って、ワークロードの可観測性やオペレーションの必要性に関する問題がある場合に付与されます(e.g. 古いバージョンのコンポーネントが存在し、対応が必要な場合などもこのタグが付与されます) |
| セキュリティ      | -             | セキュリティに関してはほぼ全てのFindingに関連するため、特別タグは付与しません |
| 信頼性           | `reliability` | システムの冗長性、キャパシティ、バックアップ、証明書の問題等、信頼性に関する問題がある場合に付与されます |
| パフォーマンス効率 | `performance` | アーキテクチャの選択、コンピューティングリソースの効率化に関する問題がある場合に付与されます。※ただし、セキュリティメインのスキャナがこの観点の問題を自動収集することは難しく、比較的件数は少ないです |
| コスト最適化      | `cost` | ムダなコストが発生している可能性がある（使われてないリソースがあるなど）場合にこのタグが付与されます |

## ユースケース

???+ warning "注意"
    Well-Architectedタグは試験的な機能のため、想定している運用イメージ・手順などアップデートされる可能性があります

### ムダなコストが発生した場合にアラートを受け取る

1. `アラート > ルール` 画面へ遷移します
2. 新規ルール作成で以下の条件を設定します
    - タグ: `cost`
    - スコア: `0.3`
    - ![アラートルール](/img/risken/wa_alert_rule.png){style="width:400px"}
3. `アラート > 条件` 画面へ遷移します
4. 新規条件作成で以下を指定します
    - ルール選択: 上記2で作成したルール
    - 通知先選択: 普段利用してる通知先
    - 他: 適当
    - ![アラート条件](/img/risken/wa_alert_condition.png){style="width:400px"}
5. 設定は以上です。
    - この状態で次回スケジュール実行時に問題のFindingがあった場合に通知されるようになります
    - 手動でアラート解析を実行する場合には、対象条件データのメニュー（右側のアクションメニュー）よりアラート解析を実行してください

### システムの信頼性に問題がないかを確認する

次のステップで現在のモニタリング対象のシステムに信頼性の問題があるかを確認します

1. `Finding > Finding`画面へ遷移します
2. フィルタ項目に以下を設定します
    - タグ: `reliability`
    - スコア: `0.3`
    - ![Findig条件](/img/risken/wa_finding.png){style="width:400px"}
3. 検索ボタンをクリックし該当するデータが存在しないか確認します