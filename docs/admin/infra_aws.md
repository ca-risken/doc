# Infrastructure(AWS)

AWS上でRISKENのシステム構築をするためのドキュメントです.

本ドキュメントでは数百プロジェクト相当の規模をRISKENでスキャンするような大規模環境を想定しています.
もし、それには該当しないような小規模環境で運用する場合は[`ローカルマシーンへのインストール`](/admin/infra_local/)を参照してください. （シングルインスタンス構成でdocker composeで起動することが可能です。）

## ゴール

最終的に作成される構成は以下のようになります

![AWS Simple Architecture](/img/admin/admin_aws_simple_arch.png){style="width:480px"}

- AWS VPC内に `Public Subnet` と `Private Subnet` を持ちます
    - Public SubnetはインターネットFacingなネットワークです。ここにはALBを配置しています。
    - Private Subnet内にEKSノードが配置されます。ALBから特定のポートを許可します
- EKS上にRISKENのコンテナアプリケーションがデプロイされます
- これは最もシンプルなアーキテクチャイメージです
    - Cognito, Route53, ACM, RDS, SQS, ParameterStore, KMS等のAWSサービスと連携することも可能ですが、説明をシンプルにするためにこの図には含めません

---

## 準備

RISKENをAWS上に構築する上で以下の項目が必要になります

- AWS環境について
    - 本ドキュメントでは以下のAWS環境での構築例を記載します（該当しない箇所は適宜手順の修正が必要です）
        - リージョン: `ap-northeast-1`
        - EKSバージョン: 1.21+
- OIDCをサポートしているIdP
    - RISKENのユーザ認証は外部のIdPと連携します
    - 認証フローの詳細について[AWS ELBドキュメント :octicons-link-external-24:](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/listener-authenticate-users.html#configure-user-authentication){ target="_blank" } を参照してください
- 各種CLIツールをインストールする
    - [aws cli :octicons-link-external-24:](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html){ target="_blank" }
    - [kubectl :octicons-link-external-24:](https://kubernetes.io/de/docs/tasks/tools/install-kubectl/){ target="_blank" }
    - [kustomize :octicons-link-external-24:](https://kubectl.docs.kubernetes.io/installation/kustomize/){ target="_blank" }

---

## EKSクラスタを作成する

### 新規クラスタの作成

最初にEKSクラスタを作成する必要があります

- [EKSのドキュメント :octicons-link-external-24:](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-console.html){ target="_blank" } に従ってクラスタを作成してください
- 以下はクラスタの設定例です（特にセキュリティ関連の設定はチームのポリシーにあわせて変更してください）
```yaml
- Cluster configuration
    - Kubernetes Version: 1.21
    - Cluster Service Role: AmazonEKSClusterPolicyが設定されているロール
- Networking: 環境にあわせて設定
- Cluster Endpoint Access: Public & Private
    - AdbancedSetting: PublicからマスタAPIへのアクセスはIPアドレス制限を設定を推奨
- Control Plane Logging: すべて有効
- その他: デフォルト値
```

### NodeGroupの追加

クラスタを作成したら、続いてNodeGroupを追加します

- [マネージド型ノードグループの追加 :octicons-link-external-24:](https://docs.aws.amazon.com/eks/latest/userguide/create-managed-node-group.html){ target="_blank" } に従って追加してください
- NodeGroupに設定するIAMロールについて
    - 信頼関係の設定で以下のようにEC2サービスからのアクションを許可してください
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": [
        "sts:AssumeRoleWithWebIdentity",
        "sts:AssumeRole"
      ]
    }
  ]
}
```
    - また、以下のマネージドポリシーを追加してください
```yaml
- AmazonSQSFullAccess
- AmazonEKSWorkerNodePolicy
- AmazonEC2ContainerRegistryReadOnly
- AWSXRayDaemonWriteAccess
- AmazonSSMManagedInstanceCore
- CloudWatchLogsFullAccess
- AmazonSSMReadOnlyAccess
- AmazonEKS_CNI_Policy
```
- 本ドキュメントでは以下のインスタンスタイプを選択してください
```yaml
- AMI type: `Amazon Linux 2 (AL2_x86_64)`
- インスタンスタイプ: `t3.medium`
- インスタンス数（Min）: 2
```

???+ tip "FargateタイプやGraviton2タイプのノードを使いたい"
    - RISKENは他のノードタイプでも動作しますが、本ドキュメントでは手順を簡略化するために上記のノードの例を記載します
    - Fargateやその他のノード型の場合リソースの制約やLoggingなどObservability関連に影響します
        - 詳細は[EKSのNode :octicons-link-external-24:](https://docs.aws.amazon.com/ja_jp/eks/latest/userguide/eks-compute.html){ target="_blank" } を参照してください
    - 一部のコンポーネント（DBやQueue）のコンテナイメージがCPUのマルチアーキテクチャに未対応です
        - Graviton2などのARM64アーキテクチャで動作する場合は上記のコンポーネントをAWSのマネージドサービスで構築する必要があります（詳細は[Options](/admin/infra_aws_option/)ページを参照ください）

---

## ALBを作成する

インターネットからのリクエストを受け付けるエンドポイントとしてALBを作成します

### ターゲットグループを作成する

まず、ALBのルーティング先にあたるターゲットグループを２つ作成します

1. API用のターゲットグループ
```yaml
- Name: api
- Type: Instance
- Protocol: HTTP/1.1
- Port: 30080
- HealthCheck Path: /healthz
- Register target: なし（後ほどAuto-Scaling Groupで設定）
```

2. WEB用のターゲットグループ
```yaml
- Name: web
- Type: Instance
- Protocol: HTTP/1.1
- Port: 30081
- HealthCheck Path: /index.html
- Register target: なし（後ほどAuto-Scaling Groupで設定）
```

### Auto-Scaling GroupにLBのターゲットグループを設定する

- Nodeライフサイクルに連動してターゲットグループの紐付けが自動設定されるようにしておきます
- [EC2 AutoScalingのドキュメント :octicons-link-external-24:](https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-load-balancer-asg.html){ target="_blank" } を参考にAuto-Scalingグループと上記で作成したターゲットグループの紐付けを行ってください


### ALBを作成する

続いて、[ALBのドキュメント :octicons-link-external-24:](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancer-getting-started.html){ target="_blank" } に従ってALBを作成してください。

ターゲットグループの設定は上記で作成したものを指定します。ただし、後述の `ALBリスナールールを作成する` で細かな修正を行いますのでここでは任意のターゲットグループの指定で問題ありません。

### ALBリスナールールを作成する

1. ルール1
```yaml
IF:
    - Host Header: ALBのドメイン（またはカスタムドメイン）
    - Path: /api/*
THEN:
    - Authenticatate: OIDC(*)
    - ForwardTo: {API用のターゲットグループ}
```

2. ルール2
```yaml
IF:
    - Host Header: ALBのドメイン（またはカスタムドメイン）
    - Path: /*
THEN:
    - Authenticatate: OIDC(*)
    - ForwardTo: {WEB用のターゲットグループ}
```

3. Last(Default Action)
```yaml
IF:
    - Requests otherwise not routed
THEN:
    - Return fixed response: 404
    - Content-Type: text/plain
    - Response body: Not found
```

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

### ALBからEKSへの通信を許可する

最後に `ALB` -> ( `TargetGroup` ) -> `EKS` への通信の設定を行います

- ALBからEKS NodePort経由で通信を許可します
- EKSクラスタのセキュリティグループに以下のInboundルールを設定してください
    - Type: CustomTCP
    - Protcol: TCP
    - Port Range: `30080 - 30081`
    - Source: ALBに設定したセキュリティグループ

---

## RISKENをデプロイする

### EKSにkubectlで接続する

- 新しく作成したクラスタ用に[Kubeconfigを更新 :octicons-link-external-24:](https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html){ target="_blank" }します
```bash
$ aws eks --region ap-northeast-1 update-kubeconfig --name <cluster_name>
```

### Manifestファイルを使ってデプロイ

- [サンプルmanifest :octicons-link-external-24:](https://github.com/ca-risken/k8s-sample){ target="_blank" }をcloneします
```sell
$ git clone https://github.com/ca-risken/k8s-sample.git
```

- EKS用のテンプレートをコピーします
```sell
$ cp -r overlays/eks-template overlays/eks
```

- Kustomizeコマンドよりアプリケーションをデプロイします
```bash
$ kustomize build overlays/eks | kubectl apply -f -
```

- PodのStatusが`Running`になるのを待ちます
```bash
$ kubectl get pod -A
```

???+ tip "デフォルトでは一部のサービスのみが有効です"
    - 以下のサービスは起動時にクレデンシャルが必要になるためデフォルトでは起動しません
        - Google
        - Code
    - 必須パラメータを設定しManifestファイル内のPod起動数を`1`以上に更新してください
        - パラメータの詳細は[Parameters](/admin/param_index/)を参照してください

---

## 作成したリソースを削除する

以下の順でリソースを削除してください

1. EKS NodeGroup
2. EKS Cluster
3. ALB
4. Target Group
5. Security Group
6. IAM Role
