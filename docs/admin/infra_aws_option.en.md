# Infrastructure(AWS) Option

This section describes the integration with AWS managed services and fine-tuning.

---

## Observability

It is possible to integrate with various AWS observability-related services. Please refer to the following AWS documentation for details.

- [Set up Container Insights on Amazon EKS and Kubernetes :octicons-link-external-24:](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/deploy-container-insights-EKS.html){ target="_blank" }
- [Configure Fluent Bit as a DaemonSet to send logs to CloudWatch Logs :octicons-link-external-24:](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Container-Insights-setup-logs-FluentBit.html){ target="_blank" }

---

## Setting IAM roles for Pods

- In AWS EKS, it is possible to achieve fine-grained access control on a per-Pod basis by associating Kubernetes service accounts with IAM roles.
- For example, it is possible to associate an IAM role ARN with the service account's annotation as follows:

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

- Create a service account as necessary.
    - Please refer to [IAM roles for service accounts :octicons-link-external-24:](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html){ target="_blank" } for details.
- Also, to obtain the IAM role token from the service account, an `IAM OIDC provider` must be prepared for each cluster.
    - Please refer to [Create an IAM OIDC provider for your cluster :octicons-link-external-24:](https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html){ target="_blank" } for details.

---

## Setting up authentication flow via AWS Cognito

- It is possible to select the Cognito type in the RISKEN ALB authentication settings.
- By using the Cognito user pool, it is also possible to allow logins from multiple IdPs.
- Please refer to [Using Amazon Cognito :octicons-link-external-24:](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/listener-authenticate-users.html#cognito-requirements){ target="_blank" } for details.

---

## Setting up a custom domain URL

- It is possible to set up a custom domain using [Route53 Alias Records :octicons-link-external-24:](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-values-alias.html){ target="_blank" }

---

## Integrating with RDS

- Using RDS improves availability, maintainability, and observability.
- Particularly in a production environment, it is recommended to use RDS.
- To connect to RDS, you need to set the connection information for the DB in RISKEN parameters.

|Environment Variable|Description|
|---|---|
|DB_MASTER_HOST|Hostname of the master DB|
|DB_MASTER_USER|Username of the master DB|
|DB_MASTER_PASSWORD|Password of the master DB|
|DB_SLAVE_HOST|Hostname of the slave DB (ReadOnly)|
|DB_SLAVE_USER|Username of the slave DB (ReadOnly)|
|DB_SLAVE_PASSWORD|Password of the slave DB (ReadOnly)|

---

## Integrating with SQS

- Using SQS improves availability, maintainability, and observability.
- Particularly in a production environment, it is recommended to use SQS.

---

## Registering system properties in Parameter Store

RISKEN supports fetching environment variable values to be set for each Pod from Parameter Store.
Refer to the [Parameters](/admin/param_index/) page for details.

---

## Managing credentials with Secrets Manager

WIP

---

## Creating an endpoint for access tokens

- To enable programmable API access using RISKEN's access token feature, you need to prepare an endpoint for access tokens.
- The following is an example of creating an endpoint by adding a listener rule to the same ALB.

1. Prepare a subdomain for access tokens.
    - Example: `api.your-domain.com`
2. Add a listener rule for the ALB for access tokens.
```yaml
# For console access (accessed from a web browser)
IF:
    - Host Header: console.your-domain.com
    - Path: /api/*
THEN:
    - Authenticatate: OIDC(*)
    - ForwardTo: {Target Group for API}

# For access tokens (accessed from curl or similar)
IF:
    - Host Header: api.your-domain.com
    - Path: /api/*
    - Source IP: {Configure if necessary}
THEN:
    - ForwardTo: {Target Group for API}
```

???+ warning
    The lack of authentication settings in the rule for access tokens makes it less secure, but you need to log in to the console for the initial token issuance operation.
    Also, the token can have an expiration date set.
