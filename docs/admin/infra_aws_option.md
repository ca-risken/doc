# Infrastructure(AWS) Option

AWSのマネージドサービスとの連携や、細かなチューニング等について記載します

## Pod単位でIAMロールを設定する

- AWS EKSではKubernetes内のサービスアカウントとIAMロールを紐付けることにより、Pod単位での細かなアクセスコントロールが可能になります
- 例えば以下のような形でサービスアカウントのannotationにIAMロールのARNを設定することで紐付けることが可能です

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-sa
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::123456789012:role/your-role

---
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  serviceAccountName: my-sa
  ...
```

- 必要に応じてサービスアカウントを作成してください
    - 詳細は[サービスアカウントのIAMロール :octicons-link-external-24:](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html){ target="_blank" } を参照してください
- また、サービスアカウントからIAMロールのTokenを取得するために`IAM OIDCプロバイダー`をクラスタごとに準備する必要があります
    - 詳細は[クラスターの IAM OIDC プロバイダーを作成するには :octicons-link-external-24:](https://docs.aws.amazon.com/ja_jp/eks/latest/userguide/enable-iam-roles-for-service-accounts.html){ target="_blank" }を参照してください


## AWS Cognito経由の認証フローを設定する

- RISKENのALB認証の設定でCognitoタイプ選択することができます
- Cognitoユーザプールを利用することで、複数のIdpからのログインを許可することも可能になります
- 詳細は[Amazon Cognitoを利用する :octicons-link-external-24:](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/listener-authenticate-users.html#cognito-requirements){ target="_blank" } を参照してください

## カスタムドメインURLを設定する

- [Route53のエイリアスレコード :octicons-link-external-24:](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-values-alias.html){ target="_blank" }を使用してカスタムドメインを設定することが可能です

## RDSと連携する

- RDSを利用することで、可用性・メンテナンス性・可観測性が向上します
- 特にプロダクション環境ではRDSを利用が推奨です
- RDSへ接続するためには、DBへの接続情報をRISKENのパラメータに設定する必要があります

|環境変数|説明|
|---|---|
|DB_MASTER_HOST|マスターDBのホスト名|
|DB_MASTER_USER|マスターDBのユーザ名|
|DB_MASTER_PASSWORD|マスターDBのパスワード|
|DB_SLAVE_HOST|スレーブDB（ReadOnly）のホスト名|
|DB_SLAVE_USER|スレーブDB（ReadOnly）のユーザ名|
|DB_SLAVE_PASSWORD|スレーブDB（ReadOnly）のパスワード|


## SQSと連携する

- SQSを利用することで、可用性・メンテナンス性・可観測性が向上します
- 特にプロダクション環境ではSQSの利用が推奨です

## Parameter Storeにシステムプロパティを登録する

RISKENでは各Podに設定する環境変数の値をParameter Storeから取得する機能をサポートしています。
詳細は[Parameters](/admin/param_index/)のページを参照してください

## Secrets ManagerでCredentialを管理する

WIP

## アクセストークン用のエンドポイントを作成する

- RISKENのアクセストークン機能を利用してプログラマブルにAPIアクセスさせるためには、アクセストークン用のエンドポイントを用意する必要があります。
- 以下は同一のALBでリスナールールを追加してエンドポイントを作成する例です

1. アクセストークン用にsubdomainを用意する
    - 例: `api.your-domain.com`
2. アクセストークン用にALBのリスナールールを追加
```yaml
# コンソール用（WEBブラウザからのアクセス）
IF:
    - Host Header: console.your-domain.com
    - Path: /api/*
THEN:
    - Authenticatate: OIDC(*)
    - ForwardTo: {API用のターゲットグループ}

# アクセストークン用（curlなどからのアクセス）
IF:
    - Host Header: api.your-domain.com
    - Path: /api/*
    - Source IP: {必要に応じて設定}
THEN:
    - ForwardTo: {API用のターゲットグループ}
```

???+ warning
    アクセストークン用のルールに認証設定がない分インセキュアにはなりますが、トークンの最初の発行操作はコンソールにログインする必要があります。
    また、トークンには有効期限が設定可能です。
