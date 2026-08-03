# Configuring scans with the GitHub App

To scan repositories with GitHub App authentication, create a GitHub setting in RISKEN and run GitHub integration.

Before continuing, install the GitHub App on the target GitHub Organization or User account.
For installation instructions, see [Installing the GitHub App](github_app_install.md).

## Configuration steps

1. Create a GitHub setting in RISKEN.

    Open `Data Source > Source Code > GitHub`, create a GitHub setting, and select `GitHub App` as the authentication mode.

    Confirm that `Type` and `TargetResource` match the GitHub App installation target, then click `Save`.

    ![RISKEN GitHub setting with GitHub App authentication](/img/code/github_app_setting_github_app_mode.png){style="width:600px"}

2. Run GitHub integration in RISKEN.

    After saving, the GitHub App status changes to `Waiting for GitHub integration`.
    Click `GitHub integration` so RISKEN can verify that the user who created the setting can manage the target repositories on GitHub.

    ![RISKEN GitHub App waiting for GitHub integration](/img/code/github_app_integration_status.png){style="width:600px"}

    After authentication on GitHub is complete and you return to RISKEN, the GitHub settings list displays a message confirming that GitHub integration is complete.

    ![RISKEN GitHub App integration complete](/img/code/github_app_integration_complete.png){style="width:600px"}

## Troubleshooting

### GitHub App verification fails in RISKEN

Check the following:

- The GitHub App is installed on the target Organization or User account.
- `Type` and `TargetResource` in the RISKEN GitHub setting match the GitHub App installation target.
- Repository access includes the repositories to scan.
- GitHub App settings in the RISKEN environment, such as Private Key and App ID, are correct.

### Target repositories are not displayed

The target repositories may not be included in the GitHub App repository access.
Update Repository access on GitHub, then resync the repository list in RISKEN.
