# 制約事項

## AWS Configの制約

- Configがサポートしているリソースタイプは[AWS Configの公式ドキュメント :octicons-link-external-24:](https://docs.aws.amazon.com/ja_jp/config/latest/developerguide/resource-config-reference.html){ target="_blank" } を参照してください


## CloudTrailの制約

- CloudTrailログは特に証跡を作成しなくても参照可能ですが過去90日間まで閲覧できます
    - それより過去のログを閲覧するには別途`証跡の作成`が必要になります。（クラウド管理者にお問い合わせください）
- ログ取得にLookupEvents APIを使用するため、各AWSで1秒間に2リクエストまでのみとなります
- その他の制約事項については[CloudTrailの公式ドキュメント :octicons-link-external-24:](https://docs.aws.amazon.com/ja_jp/awscloudtrail/latest/userguide/WhatIsCloudTrail-Limits.html){ target="_blank" } を参照してください

