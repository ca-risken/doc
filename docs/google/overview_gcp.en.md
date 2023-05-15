# GCP

Here's how to register your GCP project.

## Adding a GCP project

1. Navigate to the `Google > GCP` screen from the menu.
2. Click on `NEW` on the right side of the screen.
3. Fill in the following items in the new registration dialog and click `REGIST`:
    - **Name ＊**: GCP name (any name you like)
    - **GCP Project ID ＊**: GCP Project ID
        - Please refer to [Google's documentation :octicons-link-external-24:](https://cloud.google.com/resource-manager/docs/creating-managing-projects?hl=en#identifying_projects){ target="_blank" } for how to confirm your project ID.
    - **Verification Code ＊**: Verification code
        - If creating a new one, set a random value with the `Auto generate` button.
    - ![GCP Registration](/img/google/gcp_regist.png){style="width:350px"}

4. The verification code will need to be registered in your GCP project later.
    - Use the :material-content-copy: (copy button) as needed.

    ???+ info "GCP owner verification flow"
        - The code set here is used to verify that it is also registered in your GCP, confirming that you are the owner of the GCP project.
        - RISKEN monitors multiple GCPs, and this verification flow is intended to prevent others from registering your GCP.

## Registering the verification code

1. Open the [GCP management console :octicons-link-external-24:](https://console.cloud.google.com/).
2. Switch to the GCP project registered with RISKEN.
3. Open the [IAM menu label :octicons-link-external-24:](https://console.cloud.google.com/iam-admin/labels).
4. Add the following label:
    - Key: `risken`
    - Value: `{verification code set in RISKEN}`
    - ![GCP project label](/img/google/gcp_project_label.png){style="width:580px"}

??? warning "Project permissions are required to set labels"
    - Project permissions for [ResourceManager API :octicons-link-external-24:](https://cloud.google.com/resource-manager/docs/creating-managing-labels) are required to set labels.
        - `resourcemanager.projects.get`
        - `resourcemanager.projects.update`
    - Please contact your GCP cloud administrator for more information.
