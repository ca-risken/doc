# Subscription

This guide explains how to register your Azure Subscription.

## Add an Azure Subscription

1. From the menu, navigate to the `Azure > Azure` screen.
2. Click `NEW` on the right side of the screen.
3. In the new addition dialog, enter the following items and click `REGIST`:
    - **Name ＊**: Registration name (optional)
    - **Subscription ID ＊**: Subscription ID
        - For how to check your Subscription ID, refer to [Microsoft Azure Documentation :octicons-link-external-24:](https://learn.microsoft.com/en-us/azure/azure-portal/get-subscription-tenant-id){ target="_blank" }
    - **Verification Code ＊**: Verification code
        - If creating a new one, set a random value using the `Auto Generate button`.
    - ![Subscription Registration](/img/azure/subscription_regist.png){style="width:350px"}

4. The verification code must be registered to your Subscription later.
    - If needed, use :material-content-copy: (copy button).

    ???+ info "Subscription Ownership Verification Flow"
        - By verifying that the code set here is also registered in your Subscription, you confirm ownership.
        - Since RISKEN monitors multiple Subscriptions, this verification flow ensures that others cannot register your Subscription.

## Register the Verification Code

1. Open [Azure Home :octicons-link-external-24:](https://portal.azure.com/#home).
2. Open the Subscription menu and select the Subscription you want to register.
3. Open the Tags section.
4. Add the following label:
    - Key: `risken`
    - Value: `{Verification code set in RISKEN}`
    - ![Azure Subscription Tag](/img/azure/subscription_tag_en.png){style="width:580px"}