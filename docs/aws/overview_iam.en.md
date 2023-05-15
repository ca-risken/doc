# Creating IAM Roles on AWS

Here is an example of how to set up IAM roles on AWS Management Console.

1. Navigate to the `IAM` service on AWS Management Console.
2. Create a new IAM policy:
    - Click `Create Policy` in the IAM policy menu.
        - ![Policy button](/img/aws/aws_policy_btn.png){style="width:300px"}
    - Open the `JSON` tab and paste the following policy. Click `Review Policy`.
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
        - ![Policy Editor](/img/aws/aws_policy_editor.png){style="width:400px"}
    - Enter `RISKEN` in the name field and click `Create Policy`.
        - ![Policy Creation](/img/aws/aws_policy_create.png){style="width:400px"}

3. Create a new IAM role:
    - Click `Create Role` in the IAM role menu.
        - ![Role Creation](/img/aws/aws_role_btn.png){style="width:400px"}
    - Select `AWS account` for `Select type of trusted entity` and enter the following:
        - AWS account: Another AWS account
        - Account ID: You need to register the AWS account ID for RISKEN as a trusted entity.
        ???+ tip "AWS account ID"
            Please contact your system administrator for the AWS account ID in the RISKEN environment.
        - External ID:
```
{External ID generated earlier}
```
        - ![Principal](/img/aws/aws_role_principal.png){style="width:500px"}
        - Click `Next: Permissions`.
    - On the Permissions screen, search for and check the following two policies, then click `Next: Tags`:
        - `RISKEN` (the policy created earlier)
        - `SecurityAudit` (the management policy)
    - Click `Next: Tags`.
    - On the Review screen, enter `RISKEN` in the Role name field and click `Create Role`.
        - ![Role Creation](/img/aws/aws_role_create.png){style="width:400px"}
