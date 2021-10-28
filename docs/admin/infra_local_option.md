# Infrastructure(Local) Option

細かなチューニング等について記載します

---

## ローカル環境からAWSをスキャンする

AWSをスキャンするためにはAWSの認証情報（※）が必要です。
AWSのIAMユーザまたは、STSの一時キーを環境変数経由でRISKENにわたすことでスキャンが可能になります。

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **AWS_ACCESS_KEY_ID** | AWSアクセスキーID | | |
| **AWS_SECRET_ACCESS_KEY** | AWSシークレットキー | | |
| **AWS_SESSION_TOKEN** | AWSセッショントークン（STS一時キーを利用する場合） | | |

(※) 事前にスキャンされるAWSからアクセス許可されてる必要があります

---

## ローカル環境からGCPをスキャンする

GCPをスキャンするためにはGCPの認証情報（※）が必要です。
GCPのサービスアカウントのキー情報を環境変数経由でRISKENにわたすことでスキャンが可能になります。

| Param | Description | Required | Default |
| --- | --- | --- | --- |
| **GOOGLE_SERVICE_ACCOUNT_JSON** | GCPサービスアカウントのクレデンシャル（JSON） | yes | |
| **GOOGLE_SERVICE_ACCOUNT_EMAIL** | GCPサービスアカウントのEMAIL | yes | |
| **GOOGLE_SERVICE_ACCOUNT_PRIVATE_KEY** | GCPサービスアカウントのRSA秘密鍵 | yes | |

(※) 事前にスキャンされるGCPからアクセス許可されてる必要があります
