# Installing the GitHub App

To scan repositories with GitHub App authentication, install the RISKEN GitHub App on the target GitHub Organization or User account and grant access to the repositories to scan.

Complete the GitHub App installation and repository access configuration before creating the GitHub setting in RISKEN.

## Installation URL

Use the following URL to install the RISKEN Code GitHub App.

[https://github.com/apps/risken-code-app/installations/select_target](https://github.com/apps/risken-code-app/installations/select_target){ target="_blank" }

## Who should install it

For GitHub Organizations, the Organization owner should install the GitHub App.

For personal repositories, the GitHub User should install the GitHub App on their own account.

## Installation steps

1. Sign in to GitHub.

    If you are installing the app on an Organization, sign in as a user with Organization owner permissions.

2. Open the [installation URL](#installation-url), then select the Organization or User account to install the app on.

    Select the same Organization or User that you will set as `TargetResource` in the RISKEN GitHub setting.

    On the next screen, confirm that the target Organization or User is displayed at the top as the installation target.

    ![GitHub App install target selection](/img/code/github_app_install_select_target.png){style="width:800px"}

3. Select Repository access.

    Select `Only select repositories` to grant access only to specific repositories.

    Select `All repositories` to grant access to all repositories under the Organization.

    !!! warning "Note"
        If you select `All repositories`, repositories created in the future will also be accessible by the GitHub App.
        Select `Only select repositories` if you want to operate with least privilege.

    ![GitHub App Repository access](/img/code/github_app_install_repository_access.png){style="width:800px"}

4. Review the permissions requested by the GitHub App.

    Confirm that the permissions are appropriate for reading the repositories to scan.

    ![GitHub App Permissions](/img/code/github_app_install_permissions.png){style="width:800px"}

5. Click `Install & Authorize`, `Install`, or `Update`.

    If the GitHub App has already been installed, GitHub may show the repository access update page.

    Before completing the installation, review the installation target, Repository access, and permissions, then click the installation button displayed on the screen.

    ![GitHub App installation confirmation](/img/code/github_app_install_complete.png){style="width:800px"}

6. Create a GitHub setting in RISKEN.

    Open `Code > GitHub`, create a GitHub setting, and select `GitHub App` as the authentication mode.

    Confirm that `Type` and `TargetResource` match the GitHub App installation target, then click `Save`.

    ![RISKEN GitHub setting with GitHub App authentication](/img/code/github_app_setting_github_app_mode.png){style="width:800px"}

7. Run GitHub integration in RISKEN.

    After saving, the GitHub App status changes to `Waiting for GitHub integration`.
    Click `GitHub integration` so RISKEN can verify that the user who created the setting can manage the target repositories on GitHub.

    ![RISKEN GitHub App waiting for GitHub integration](/img/code/github_app_integration_status.png){style="width:800px"}

    After authentication on GitHub is complete and you return to RISKEN, the GitHub settings list displays a message confirming that GitHub integration is complete.

    ![RISKEN GitHub App integration complete](/img/code/github_app_integration_complete.png){style="width:800px"}

## Changing repository access

To add or remove repositories to scan, update the Repository access settings on GitHub.

1. Open `Settings` for the target Organization or User on GitHub.
2. Open `RISKEN Code App` from `GitHub Apps` or `Installed GitHub Apps`.
3. Select `All repositories` or `Only select repositories` in `Repository access`.
4. If you select `Only select repositories`, add or remove the repositories to scan.
5. Resync the repository list on the RISKEN GitHub setting page.

![GitHub App Repository access](/img/code/github_app_install_repository_access.png){style="width:800px"}

## Troubleshooting

### The target Organization is not displayed

The signed-in GitHub user may not be a member of the target Organization.
Contact the Organization owner.

### The Install button is not displayed, or GitHub shows an installation request

The signed-in GitHub user may not have permission to install GitHub Apps on the target Organization.
Ask the Organization owner to install the app.

### GitHub App verification fails in RISKEN

Check the following:

- The GitHub App is installed on the target Organization or User account.
- `Type` and `TargetResource` in the RISKEN GitHub setting match the GitHub App installation target.
- Repository access includes the repositories to scan.
- GitHub App settings in the RISKEN environment, such as Private Key and App ID, are correct.

### Target repositories are not displayed

The target repositories may not be included in the GitHub App repository access.
Update Repository access on GitHub, then resync the repository list in RISKEN.
