# Data Source

Explanation about Gitleaks' data source settings

## Gitleaks Scan Settings

1. After completing [GitHub settings](github_setting.md#setting-up-github-repositories), the settings screen will be displayed.
2. Enter the following items and click `EDIT`.
    - **Enable Gitleaks**: Turn it ON to enable Gitleaks scan settings. (ON by default upon registration)
        - Turning it OFF and clicking `EDIT` will remove existing settings.
    - **RepositoryPattern**: Specify the repository name you want to scan under the above TargetResource. (Partial match)
        - If left blank, all repositories under TargetResource will be targeted.
    - **Repository visibility**: Select the visibility to be scanned [visibility :octicons-link-external-24:](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-repository-visibility){ target="_blank" }.
        - `Public`: Scans repositories that are publicly available on the Internet.
        - `Internal`: Scans repositories within the enterprise.
        - `Private`: Scans private repositories.

    ![Gitleaks settings](/img/code/gitleaks_setting.png){style="width:500px"}

3. After clicking `EDIT`, navigate to [Dependency Settings](dependency_datasource.md).

If you have already registered GitHub settings, follow these steps to move to the Gitleaks settings screen.

1. Click `Code > GitHub` from the menu.
2. Click `Action -> Edit Item` for the column you want to change in the GitHub settings list.
3. Click code:gitleaks in the dialog to open Gitleaks settings.
