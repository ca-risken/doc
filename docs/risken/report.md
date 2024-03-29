# レポート

RISKENで収集したデータが日々どのような変化をしているかをレポートすることができます

- 問題の総数やスコアの変化を時系列でレポートすることできます
- どこにどの程度の問題があるのか／ないのか、または他のプロジェクトとはどうなのかを比較することもできます
- また、これにより現場の開発者あるいはセキュリティ担当者の成果が可視化されます

???+ note
    日々開発が行われ激しく変化する環境において、セキュリティを維持することは大変な努力が必要です。
    そういった面でも可視化は重要なことです。

---

## ダッシュボード

`Dashboard`画面ではプロジェクトの現在の状態を可視化します

![ダッシュボード](/img/risken/report_dashboard.png){style="width:500px"}

### Status

`Dashboard`画面の上部にステータスを表示します

- `プロジェクトステータス`: プロジェクトの全体の状態を表示します
    - `ステータス`の根拠は以下の3つから判定されます
        1. アラートが残ってないか
        2. 高スコアのFindingが放置されていないか
        3. プロジェクトの設定状況が十分か
- `アラート（赤）`: 現在有効なアラートが存在する場合はそのカウントが表示されます
    - クリックすると`Alert > Alert`画面に遷移します
- `Finding（青）`: 高スコア（0.8以上）のFindingが存在する場合はそのカウントが表示されます
    - クリックすると`Finding > Finding`画面に遷移します
- `設定状況（グレー）`: プロジェクトが十分な設定状況かを%で表示します
    - クリックするとダイアログで設定状況の詳細を表示します


### Category

`Dashboard`画面の中央部にカテゴリ毎（データソースなど）の問題箇所を表示します。
クリックすると対象画面に遷移します。

### Chart

`Dashboard`画面の下部にグラフを表示します。
Findingの登録状況や、現在発生しているアラートの重大度ごとの割合を表示します。

---


## レポート

`Report > ReportFinding` 画面ではFindingの統計データを表示／ダウンロードすることができます

![レポートFinding](/img/risken/report_finding.png){style="width:500px"}

### ダウンロード

- `Report > ReportFinding` 画面に遷移します
- DataSource, Score, 期間, ファイル形式を選択してください
- **DOWNLOAD REPORT(PROJECT)** をクリックすると現在選択中のプロジェクトの統計データがダウンロードできます

### 可視化のカスタマイズ

統計データの可視化を自由にカスタマイズするには、[Googleデータポータル](https://support.google.com/datastudio/answer/6283323)などのBIツールを利用すると便利です。

=== "データポータル サンプル1"

    ![データポータル1](/img/risken/report_data_portal1.png){style="width:500px"}

=== "データポータル サンプル2"

    ![データポータル2](/img/risken/report_data_portal2.png){style="width:500px"}
