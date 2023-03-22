# AWS側のIAMロール作成

AWSマネージメントコンソールからの設定例を記載します

1. AWSのマネージメントコンソールで `IAM` サービスに遷移します
2. 新規IAMポリシーを作成します
    - IAMのポリシーメニューから `ポリシーの作成`をクリックしてください
        - ![ポリシーボタン](/img/aws/aws_policy_btn.png){style="width:300px"}
    - `JSON` タブを開き以下を貼り付け、ポリシーの確認をクリックしてください
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ses:DescribeActiveReceiptRuleSet",
                "athena:GetWorkGroup",
                "logs:DescribeLogGroups",
                "logs:DescribeMetricFilters",
                "elastictranscoder:ListPipelines",
                "elasticfilesystem:DescribeFileSystems",
                "servicequotas:ListServiceQuotas"
            ],
            "Resource": "*"
        }
    ]
}
```
        - ![ポリシーエディタ](/img/aws/aws_policy_editor.png){style="width:400px"}
    - 名前欄に `RISKEN` と入力して`ポリシー作成`をクリックしてください
        - ![ポリシー作成](/img/aws/aws_policy_create.png){style="width:400px"}

3. 新規IAMロールを作成します
    - IAMのロールメニューから `ロールの作成` をクリックしてください
        - ![ロール作成](/img/aws/aws_role_btn.png){style="width:400px"}
    - `信頼されたエンティティの種類を選択` で`AWSアカウント`を選択し以下を入力してください
        - AWSアカウント: 別のAWSアカウント
        - アカウントID: RISKENのAWSアカウントIDを信頼済みに登録する必要があります
        ???+ tip "AWSアカウントID"
            RISKEN環境のAWSアカウントIDについてはシステム管理者にお問い合わせください


        - 外部ID（External-ID）:
```
{先程、自動生成した外部ID}
```
        - ![プリンシパル](/img/aws/aws_role_principal.png){style="width:500px"}
        - `次のステップ` をクリックしてください
    - アクセス権限の画面で以下の２つのポリシーを検索しチェックしてから、`次のステップ` をクリックしてください
        - `RISKEN` （先程作ったポリシー）
        - `SecurityAudit` （マネージメントポリシー）
    - タグ設定の画面で `次のステップ` をクリックしてください
    - 確認画面でロール名に `RISKEN` と入力し `ロールの作成` をクリックしてください
        - ![ロール作成](/img/aws/aws_role_create.png){style="width:400px"}
