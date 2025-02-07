# 自動トリアージ
RISKENでは自動でトリアージを行う機能があります。
トリアージによって、セキュリティのスキャンの後にスコア値が再評価されることがあります。
ここではトリアージに関する詳細・操作方法を説明します。

???+ tip "全てのスキャン結果がトリアージされるわけではありません"
    自動トリアージの対象は一部のデータソース、一部のカテゴリのみです。

---

## トリアージされたスコアを確認する
1. Findingの詳細画面に遷移します
2. スコアをクリックします
    - ![triage_score.png](/img/risken/triage_score.png){style="width:80px"}
3. トリアージダイアログが表示され、どのような評価に基づいてトリアージされたかを確認することができます
    - ![triage_dialog.png](/img/risken/triage_dialog.png){style="width:400px"}

---

## トリアージの詳細
自動トリアージは[SSVC v2.0 :octicons-link-external-24:](https://certcc.github.io/SSVC/){ target="_blank" }のDecision Treeに基づいて行われます。

???+ tip "SSVC v2.0とは？"
    SSVC 2.0（Stakeholder-Specific Vulnerability Categorization）は、脆弱性対応のためのフレームワークであり、特に異なるステークホルダー（デプロイヤーなど）に合わせた脆弱性管理を支援するために設計されています。
    従来のCVSSスコアだけでなく、より包括的な視点で脆弱性を評価することができます。
    また、SSVCは、米国サイバーセキュリティ庁（CISA）でも利用され、信頼性が認められています。

| Decision Points | 観点 | 詳細 |
|---|---|---|
| [Exploitation :octicons-link-external-24:](https://certcc.github.io/SSVC/reference/decision_points/exploitation/) | 脆弱性の悪用 | 脆弱性をつく攻撃が可能かどうかを評価します。対象の脆弱性が過去に悪用された実績があるか、PoCコードが公開されているか、EPSSスコアなどを参考に判断します。 |
| [SystemExposure :octicons-link-external-24:](https://certcc.github.io/SSVC/reference/decision_points/system_exposure/) | システムの露出 | 対象のシステムへのアクセス制御を評価します。インターネットから公開されているか、認証認可やIP制限などの制御がされているかを判断します。 |
| [Utility :octicons-link-external-24:](https://certcc.github.io/SSVC/reference/decision_points/utility/) | 攻撃者にとっての有用性 | 対象の脆弱性を悪用した攻撃が、攻撃者にとってどの程度有用かを評価します。攻撃の自動化可能性や、一回の攻撃で特権を取得できるか？など、攻撃者視点での効率性を評価します。 |
| [HumanImpact :octicons-link-external-24:](https://certcc.github.io/SSVC/reference/decision_points/human_impact/) | 安全性、ビジネス影響 | 攻撃された場合の人的被害やビジネス影響を評価します。本番環境のプロダクトか？重要なデータが保存されているか？等で判断します。 |


???+ tip "SSVCの最新のバージョンは？"
    2025-02-07執筆時点ではSSVC 2.1が最新バージョンとなります。（2023年7月リリース）
    主な変更点は `Utility（攻撃者にとっての有用性）` の評価が、 `Automatable（攻撃の自動化可能）` かどうかに変更されています。
    AutomatableはもともとUtilityの中の一部となっていましたが、統廃合によりシンプルなものになっています。
