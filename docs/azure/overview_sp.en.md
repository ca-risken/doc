# Adding role assignments to Azure Subscription.

This section provides examples of settings from the Azure Management Console for:

- Assigning roles to management groups
- Assigning roles to subscriptions

## Assigning Roles to Management Groups

By assigning roles to a management group, permissions are also assigned to the subscriptions within that management group.

1. In the Azure Portal, navigate to the `Management Groups` service.
2. In the target management group, click on `Access control (IAM)`.
    - Click `Add > Add role assignment`.
        - ![Role Assignment](/img/azure/management_group_role_en.png){style="width:300px"}
    - In the Role dropdown, select `Reader` access and click `Next`.
    - In the Assignment section, select the service principal to assign the permissions.
        - ![Add Members](/img/azure/role_allocation.png){style="width:400px"}

## Assigning Roles to Subscriptions

1. In the Azure Portal, navigate to the `Subscriptions` service.
2. In the target Subscription, click on `Access control (IAM)`.
    - Click `Add > Add role assignment`.
        - ![Role Assignment](/img/azure/subscription_role_en.png){style="width:300px"}
    - In the Role dropdown, select `Reader` access and click `Next`.
    - In the Members section, select the service principal to assign the permissions.
        - ![Assign access](/img/azure/role_allocation_en.png){style="width:400px"}

3. Set the `risken` tag on the Subscription.
    - Refer to [Register the verification code](/en/azure/overview_subscription/#1).