# AWS

RISKEN上にあなたのAWSアカウントを登録することで、AWS関連のセキュリティデータを収集することができます

- AWSの各種データソースを有効にすると自動収集プログラムがスケジュールされます
- どのようなデータが収集されるかは、データソースごとのドキュメントを参照してください
- 全てのデータソースを有効にすることを推奨しますが、一部のデータソースのみを有効化することもできます


![AWSデータソース](/img/aws/aws_datasouce_list.png)

ここではAWS向けの各種データソース設定に関する説明をします。

---
# 事前準備

AWSのデータソース設定には2つの作業が必要です

1. RISKEN上のAWSデータソースの設定
2. AWS側のIAMロール作成

