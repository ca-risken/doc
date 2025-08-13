# レポート

RISKENで収集したデータが日々どのような変化をしているかをレポートすることができます

- 問題の総数やスコアの変化を時系列でレポートすることできます
- どこにどの程度の問題があるのか／ないのか、または他のプロジェクトとはどうなのかを比較することもできます
- また、これにより現場の開発者あるいはセキュリティ担当者の成果が可視化されます

???+ note
    日々開発が行われ激しく変化する環境において、セキュリティを維持することは大変な努力が必要です。
    そういった面でも可視化は重要なことです。

---

## Report

`Analysis > Report` 画面ではプロジェクトプロジェクトレポートを作成できます

![レポート](/img/risken/report_report.png){style="width:1200px"}

### AIによるレポートの自動生成

- `Analysis > Report` 画面に遷移します
- リストの上部にある `NEW` ボタンをクリックします

![レポート](/img/risken/report_new.png){style="width:300px"}

- ダイアログで以下の項目を入力してください
    - **Name**: レポートの名前
    - **DataSource**: レポート対象のデータソースを選択します
    - **Base Score**: ベーススコアを設定します
    - **Prompt**: レポートの内容を生成するためのプロンプトを入力します
- 入力後、`CREATE AUTO` ボタンをクリックします

![レポート](/img/risken/report_ai.png){style="width:500px"}

- AIによる生成ではななく手動でレポートを作成する場合には `CREATE EMPTY REPORT` ボタンをクリックします

### レポートを編集する

- `Analysis > Report` 画面に遷移します
- 対象のレポートを選択します
- 右側のペインから `Edit` タブを選択するか、 `＞` ボタンをクリックします

![レポート](/img/risken/report_edit.png){style="width:600px"}

- レポートの内容を編集します
- 編集後、`SAVE` ボタンをクリックします

![レポート](/img/risken/report_edit_save.png){style="width:600px"}

- `＜`, `＞` ボタンでプレビュー→編集を切り替えながら編集できます


### PDFダウンロードする

- `Analysis > Report` 画面に遷移します
- 対象のレポートを選択します
- 右側のペインから `DOWNLOAD PDF` ボタンをクリックします

![レポート](/img/risken/report_pdf.png){style="width:800px"}

---


## Finding Summary

`Report > Finding Summary` 画面ではFindingの統計データを表示／ダウンロードすることができます

![レポートFinding](/img/risken/report_finding.png){style="width:500px"}

### ダウンロード

- `Analysis > Finding Summary` 画面に遷移します
- DataSource, Score, 期間, ファイル形式を選択してください
- **DOWNLOAD REPORT(PROJECT)** をクリックすると現在選択中のプロジェクトの統計データがダウンロードできます

### 可視化のカスタマイズ

統計データの可視化を自由にカスタマイズするには、[Googleデータポータル](https://support.google.com/datastudio/answer/6283323)などのBIツールを利用すると便利です。

=== "データポータル サンプル1"

    ![データポータル1](/img/risken/report_data_portal1.png){style="width:500px"}

=== "データポータル サンプル2"

    ![データポータル2](/img/risken/report_data_portal2.png){style="width:500px"}
