# フィルタ

## アクティビティのフィルタリング

画面の上部にログのフィルタ機能があります。

![FIINDIG](/img/aws/aws_activity_filter.png){style="width:600px"}

## 共通

以下の項目はAWS Config、CloudTrailで共通のフィルタリング項目です

- **AWS**: プロジェクトで登録済みのAWSを選択してください
- **リージョン**: リージョンを選択してください
- **日付（From）**: 検索範囲（From）を指定してください（デフォルト: `90日前`）
- **日付（To）**: 検索範囲（To）を指定してください（デフォルト: `今日`）

### ARN設定

ARN形式で指定したい場合は `ARN設定` ボタンをクリックします。

![FIINDIG](/img/aws/aws_activity_arn.png){style="width:400px"}

- プロジェクトのリソース名のプルダウンから対象を選択します
    - キータイプするとプルダウンの内容が変化します
- `SET` ボタンをクリックすると以下の検索項目が更新されます
    - **リージョン** （ARNにリージョンコードが含まれる場合は更新されます）
    - **タイプ** （AWS Configで利用）
    - **リソース** （AWS Configで利用）
    - **AttributeKey** （CloudTrailで利用）
    - **AttributeValue** （CloudTrailで利用）


## AWS Config

以下の項目はAWS Config用のフィルタに利用されます

- **タイプ** リソースタイプを選択します
- **リソース** `リソースID` を設定します
    - `リソースID`は[ARN形式 :octicons-link-external-24:](https://docs.aws.amazon.com/ja_jp/general/latest/gr/aws-arns-and-namespaces.html){ target="_blank" } の一部です
    - ARN形式ではありません


## CloudTrail

`CloudTrailフィルタ` ボタンをクリックするとCloudTrail用のフィルタ項目が表示されます

以下の項目はCloudTrail用のフィルタに利用されます

- **AttributeKey** CloudTrailで指定できる [Attribute Key ](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/view-cloudtrail-events-cli.html#look-up-events-by-attributes){ target="_blank" }の値を指定できます
- **AttributeValue** AttributeKeyに対応するValueを指定します
    - キーに **READ_ONLY** を指定した場合は `true` または `false` が選択できます
        - `true`: 参照系のアクションのみを抽出します
        - `false`: 更新系のアクションのみを抽出します（参照系はフィルタされてしまいます）
    - キーに **RESOURCE_TYPE** を指定した場合はプルダウンから対象のタイプを選択できるようになります
- **TextFilter** を指定すると抽出されたCloudTrailログをフリーワードでフィルタすることができます
    - CloudTrailのAPIには複数のフィルタ条件が指定できないため、TextFilterに指定した値でフィルタする機能を用意しています
    - これは、サーバサイドの処理ではなくクライアントサイド（JavaScript）で処理されることに注意してください

