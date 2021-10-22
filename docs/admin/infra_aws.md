# [WIP] Infrastructure(AWS)

AWS上でRISKENのシステム構築をするためのドキュメントです

---

## 準備

RISKENをAWS上に構築する上で以下の項目が必要になります

- AWS Region
    - 本ドキュメントでは`ap-northeast-1`リージョンの例を記載します
    - その他のリージョンで構築する場合は適宜手順の修正が必要です
- AWS EKSクラスタ
    - EKS以外でも動作可能ですが本ドキュメントではEKSを対象にします
- OIDCをサポートしているIdP
    - RISKENのユーザ認証は外部のIdPと連携します
    - 認証フローの詳細について[AWS ELBドキュメント :octicons-link-external-24:](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/listener-authenticate-users.html#configure-user-authentication){ target="_blank" }  を参照してください
- 各種CLIツールをインストールする
    - [aws cli :octicons-link-external-24:](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html){ target="_blank" }
    - [kubectl :octicons-link-external-24:](https://kubernetes.io/de/docs/tasks/tools/install-kubectl/){ target="_blank" }
    - [kustomize :octicons-link-external-24:](https://kubectl.docs.kubernetes.io/installation/kustomize/){ target="_blank" }

---

## EKSクラスタを作成する

### 新規クラスタの作成

最初にEKSクラスタを作成する必要があります

- [EKSのドキュメント :octicons-link-external-24:](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-console.html){ target="_blank" } に従ってクラスタを作成してください

### NodeGroupの追加

クラスタを作成したら、続いてNodeGroupを追加します

- [マネージド型ノードグループの追加 :octicons-link-external-24:](https://docs.aws.amazon.com/eks/latest/userguide/create-managed-node-group.html){ target="_blank" } に従って追加してください
- 本ドキュメントでは以下を選択してください
    - AMI type: `Amazon Linux 2 (AL2_x86_64)`
    - インスタンスタイプ: `t3.medium`

???+ tip "FargateタイプやGraviton2タイプのノードを使いたい"
    - RISKENは他のノードタイプでも動作しますが、本ドキュメントでは手順を簡略化するために上記のノードの例を記載します
    - Fargateやその他のノード型の場合リソースの制約やLoggingなどObsrverbility関連に影響します
        - 詳細は[EKSのNode :octicons-link-external-24:](https://docs.aws.amazon.com/ja_jp/eks/latest/userguide/eks-compute.html){ target="_blank" } を参照してください
    - 一部のコンポーネント（DBやQueue）のコンテナイメージがCPUのマルチアーキテクチャに未対応です
        - Graviton2などのARM64アーキテクチャで動作する場合は上記のコンポーネントをAWSのマネージドサービスで構築する必要があります（詳細はページ下を参照ください）



---

## ALBを作成する

インターネットからのリクエスト受け付けるためALBを作成します

[ALBのドキュメント :octicons-link-external-24:](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancer-getting-started.html){ target="_blank" } に従ってALBを作成してください

### ターゲットグループを作成する

1. API用のターゲットグループ
    - Name: api
    - Type: Instance
    - Protocol(Port): HTTP/1.1(30080)
    - HealthCheck Path: /healthz

2. WEB用のターゲットグループ
    - Name: web
    - Type: Instance
    - Protocol(Port): HTTP/1.1(30081)
    - HealthCheck Path: /index.html

3. Auto-Scaling GroupにLBのターゲットグループを設定する
    - Nodeライフサイクルに連動してターゲットグループの紐付けが自動設定されるようにしておきます
    - [EC2 AutoScalingのドキュメント :octicons-link-external-24:](https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-load-balancer-asg.html){ target="_blank" } を参考に上記で作成したターゲットグループとAuto-Scalingグループの紐付けを行ってください


### ALBからEKSへの通信を許可する

- ALBからEKS NodePort経由で通信を許可します
- 以下のEKSクラスタのセキュリティグループInboundルールを設定してください
    - Type: CustomTCP
    - Protcol: TCP
    - Port Range: 30080 - 30081

### ALBリスナールールを作成する

1. ルール1
    - IF(all match)
        - Host Header: ALBのドメイン（またはカスタムドメイン）
        - Path: /api/*
    - THEN
        - Authenticatate: OIDC(*)
        - ForwardTo: {API用のターゲットグループ}
2. ルール2
    - IF(all match)
        - Host Header: ALBのドメイン（またはカスタムドメイン）
        - Path: /*
    - THEN
        - Authenticatate: OIDC(*)
        - ForwardTo: {WEB用のターゲットグループ}
3. Last(Default Action)
    - IF: Requests otherwise not routed
    - THEN
        - Return fixed response: 404
        - Content-Type: text/plain
        - Response body: Not found

???+ tip "(*) OIDC（OpenIDConnect）設定"
    - OIDC連携に必要な以下の項目をあらかじめ準備してください
        - Issuer(発行者)
        - Token Endpoint(トークンエンドポイント)
        - Userinfo Endpoint(ユーザ情報エンドポイント)
        - Client ID(クライアントID)
        - Client Secret(クライアントシークレット)
    - IdP側でClientID/Secretを発行する必要があります
        - その際に必要なRedirectURIはALBの場合には以下になります
        - `https://{your-domain}/oauth2/idpresponse`
        - 詳細は[AWSドキュメント :octicons-link-external-24:](https://docs.aws.amazon.com/es_es/elasticloadbalancing/latest/application/listener-authenticate-users.html){ target="_blank" } を参照してください

---

## RISKENをデプロイする

### EKSにkubectlで接続する

- 新しく作成したクラスタ用に[Kubeconfigを更新 :octicons-link-external-24:](https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html){ target="_blank" }します
```bash
$ aws eks --region ap-northeast-1 update-kubeconfig --name <cluster_name>
```

### ParameterStoreにシステムプロパティを登録する

### Manifestファイルを使ってデプロイ

- サンプルmanifestをcloneします
```sell
$ git clone git@github.com:ca-risken/k8s-sample.git
```
- EKS用のテンプレートをコピーし先程作成したクラスタ名に置換します
```sell
cp -r overlays/eks-template overlays/eks
sed -i "" -e 's/your-cluster/test-cluster/g' overlays/eks/*.yaml
```
- Kustomizeコマンドよりアプリケーションをデプロイします
```bash
kustomize build overlays/eks | kubectl apply -f -
```

---

## Option

## Pod単位でIAMロールを紐付ける

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

- 必要に応じて作成してください
- 詳細は[サービスアカウントのIAMロール :octicons-link-external-24:](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html){ target="_blank" } を参照してください

### AWS Cognito経由の認証フローを設定する

### カスタムドメインURLを設定する

### RDSと連携する

### SQSと連携する

### Observability

### Secrets ManagerでCredentialを管理する

