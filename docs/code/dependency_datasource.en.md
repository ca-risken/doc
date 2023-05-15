# Data Source

This section describes how to configure the data source for Dependency.

## Dependency Scan Settings

1. After completing the [Gitleaks configuration](gitleaks_datasource.md#gitleaks-scan-settings), the settings screen will be displayed.
2. Enter the following items and click `EDIT`:
    - **Enable Dependency**: Turn ON to enable Dependency scan (ON by default when creating a new registration)
        - Turning OFF and clicking `EDIT` will delete the existing settings.
    ![Dependency Settings](/img/code/dependency_setting.png){style="width:500px"}

If GitHub settings have already been registered, follow the steps below to move to the Dependency settings screen.

1. Click `Code > GitHub` from the menu.
2. Click `Action -> Edit Item` for the column you want to modify in the GitHub settings list.
3. Click `code:dependency` in the dialog to open the Dependency settings.
