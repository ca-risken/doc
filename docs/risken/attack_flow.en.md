# Attack Flow Analysis

With attack flow analysis, you can analyze the related resources within the cloud and the access paths to those resources. You can have an overview of not only the individual findings detected by RISKEN but also how they may impact other aspects.

![attack_flow.png](/img/risken/attack_flow.png){style="width:800px"}

## Resource Search

Specify the resource that serves as the starting point for the attack flow analysis in the search bar at the top of the screen. It is recommended to prioritize the analysis of public-facing cloud resources.

- Cloud environment
- Cloud service
- Resource name

## Supported Services

The following cloud services are starting points for attack flow analysis (From there, the analysis extends to related backend services.)

| Cloud Environment | Cloud Service | Classification |
|:---|:---|:---|
| AWS | Amazon CloudFront | CDN |
| AWS | Amazon API Gateway | Gateway |
| AWS | Elastic Load Balancing | LB |
| AWS | Amazon EC2 | Compute |
| AWS | AWS Lambda | Compute |
| AWS | AWS AppRunner | Compute |
| AWS | Amazon S3 | DataStore |
| AWS | Amazon SNS | DataStore |

The following cloud services are analyzed as backend services:

| Cloud Environment | Cloud Service | Classification |
|:---|:---|:---|
| AWS | Amazon SQS | DataStore |
| AWS | Amazon EventBridge | DataStore |
