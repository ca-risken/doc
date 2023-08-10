# アタックフロー分析

アタックフロー分析を使うと、クラウド内の関連リソースとそれらへのアクセス経路を分析することができます。
RISKENが検出したFinding単体だけでなく、それが他にどのような影響を及ぼすのかを俯瞰して見ることができます。

![attack_flow.png](/img/risken/attack_flow.png){style="width:800px"}

## リソース検索

画面上部の検索バーでアタックフロー分析の起点となるリソースを指定してください。
特に、パブリックフェーシングなクラウドリソースを優先的に分析することを推奨します。

- クラウド環境
- クラウドサービス
- リソース名

## サポート対象サービス

以下のクラウドサービスがアタックフロー分析の起点となるサービスです。（そこから関連するバックエンドサービスを分析します）

| クラウド環境 | クラウドサービス | 分類 |
|:---|:---|:---|
| AWS | Amazon CloudFront | CDN |
| AWS | Amazon API Gateway | Gateway |
| AWS | Elastic Load Balancing | LB |
| AWS | Amazon EC2 | Compute |
| AWS | AWS Lambda | Compute |
| AWS | AWS AppRunner | Compute |
| AWS | Amazon S3 | DataStore |
| AWS | Amazon SNS | DataStore |

下記のクラウドサービスはバックエンドサービスとして分析されます

| クラウド環境 | クラウドサービス | 分類 |
|:---|:---|:---|
| AWS | Amazon SQS | DataStore |
| AWS | Amazon EventBridge | DataStore |
