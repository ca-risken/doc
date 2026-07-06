# Installing the GitHub App

To scan repositories with GitHub App authentication, install the RISKEN GitHub App on the target GitHub Organization or User account and grant access to the repositories to scan.

Complete the GitHub App installation and repository access configuration before creating the GitHub setting in RISKEN.

## Installation URL

Use the following URL to install the RISKEN Code GitHub App.

[https://github.com/apps/risken-code-app/installations/select_target](https://github.com/apps/risken-code-app/installations/select_target){ target="_blank" }

## Who should install it

For GitHub Organizations, the Organization owner should install the GitHub App.

GitHub may allow repository admins to install a GitHub App in some cases, but this depends on the Organization permissions and repository administration permissions requested by the app.
For stable scanning of repositories under an Organization, RISKEN recommends installation by an Organization owner.

For personal repositories, the GitHub User should install the GitHub App on their own account.

## Installation steps

1. Sign in to GitHub.

    If you are installing the app on an Organization, sign in as a user with Organization owner permissions.

2. Open the [installation URL](#installation-url), then select the Organization or User account to install the app on.

    Select the same Organization or User that you will set as `TargetResource` in the RISKEN GitHub setting.

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

5. Click `Install` or `Update`.

    If the GitHub App has already been installed, GitHub may show the repository access update page.

    ![GitHub App installation complete](/img/code/github_app_install_complete.png){style="width:800px"}

6. Create a GitHub setting in RISKEN.

    Open `Code > GitHub`, create a GitHub setting, and select `GitHub App` as the authentication mode.

    After saving the setting, RISKEN checks the GitHub App installation status and repository access.

    ![RISKEN GitHub setting with GitHub App authentication](/img/code/github_app_setting_github_app_mode.png){style="width:800px"}

7. Run GitHub integration in RISKEN.

    Click `GitHub integration` in the RISKEN screen so that RISKEN can verify that the setting user can manage the target repositories on GitHub.

    ![RISKEN GitHub App integration status](/img/code/github_app_integration_status.png){style="width:800px"}

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
