# Activity

Activityデータソースを有効にすると、AWSリソースの変更履歴やアクセスログを確認することができます。
検知されたFindingのアクティビティを確認することで異常に気付くことができます。

アクティビティは他のAWSデータソースと違いスキャン機能はありません。


???+ tip "アクティビティログとは？"
    アクティビティログは以下のAWSサービスの情報を元に表示してます。

    - [AWS CloudTrail :octicons-link-external-24:](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html){ target="_blank" }
    - [AWS Config :octicons-link-external-24:](https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html){ target="_blank" }

---

## Findingのアクティビティを確認する

`Finding > Finding` 画面で、詳細データを開くと、AWSリソースの場合（ [ARNフォーマット :octicons-link-external-24:](https://docs.aws.amazon.com/ja_jp/general/latest/gr/aws-arns-and-namespaces.html){ target="_blank" } の場合 ）は、 `リソースのアクティビティを確認する` ボタンが表示されます。

![FIINDIG](/img/aws/aws_finding_activity.png){style="width:600px"}


クリックすると `AWS > アクティビティ` 画面へ遷移し詳細のログデータを確認することができます
