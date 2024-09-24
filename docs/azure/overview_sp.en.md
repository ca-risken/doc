# Adding role assignments to Azure Subscription.

Example Configuration from the Azure Management Console

1. In the Azure Portal, navigate to the `Subscriptions` service.
2. In the target Subscription, click on `Access Control (IAM)`.
    - Click `Add > Add role assignment`.
        - ![Role Assignment](/img/azure/subscription_role_en.png){style="width:300px"}
    - In the Role dropdown, select `Reader` access and click `Next`.
    - In the Members section, select the service principal to assign the permissions.
        - ![Assign access](/img/azure/role_allocation_en.png){style="width:400px"}

3. Set the `risken` tag on the Subscription.
    - Refer to [Register the verification code](/en/azure/overview_subscription/#1).