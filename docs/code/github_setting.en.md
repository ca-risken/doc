# Data Source

This describes the data source settings for Code service.

## GitHub Repository Configuration

1. Click `Code > GitHub` from the menu.
2. Click `NEW` on the right side of the screen.
3. Enter the following items and click `EDIT`.

    ![GitHubSetting](/img/code/github_setting.png){style="width:500px"}

    - **Name\***: The name of the GitHub configuration.
    - **Base URL**: Required if using GHES. See [below](#github-enterprise-server) for details.
    - **Type\***: Specify the type of GitHub, either `Organization` or `User`.
    - **TargetResouce\***: Enter the GitHub organization or user name.
    - **GitHubUser**: Register the authentication information (username) when scanning.
    - **PersonalAccessToken (PAT)**: Register the authentication information (token) when scanning.
        - Please generate either a [Fine-grained Personal Access Token](#fine-grained-personal-access-token) or a [Personal Access Token (classic)](#personal-access-token-classic).
        - If you do not register authentication information, you will not be able to scan internal/private repositories.
        - Authentication information is stored encrypted on RISKEN.
        - After registering the authentication information, the set token cannot be viewed (it is displayed as a masked value such as xxxx).
        - If you change the settings, you need to enter the PersonalAccessToken again.

4. Proceed to configure the data source. See [Gitleaks](gitleaks_datasource.md) and [Dependency](dependency_datasource.md) for details on configuring the data source.

### Fine-grained Personal Access Token

The Fine-grained Personal Access Token offers security advantages over the traditional PAT (classic) due to its ability to allow for more detailed access control.

- Please select the user/Organization to scan from the **Resource owner** dropdown.
- Specify the repository to scan in **Repository access** (select `All repository` to scan everything).

![setting1](/img/code/gitleaks_fgpat_setting1.png){style="width:800px"}

- In **Permissions**, please select `Contents (Read-only)` from the `Repository permissions` section.
    - However, no configuration is necessary if `Public Repositories (read-only)` is selected in **Repository access**.

![setting2](/img/code/gitleaks_fgpat_setting2.png){style="width:600px"}

- Generate the token with `Generate token` and register it in the RISKEN GitHub settings page.

### Personal Access Token (classic)

The Personal Access Token (classic) grants the holder access rights to all repositories they can access.

- When issuing the token, please select the OAuth scopes `repo` and `read:org` (when scanning an Organization).

![Scope](/img/code/gitleaks_pat_scope.png){style="width:800px"}

- Generate the token with `Generate token` and register it in the RISKEN GitHub settings page.

## Scanning GitHub Enterprise Server

GitHub Enterprise Server (GHES) is supported as an option.

However, the following steps are required to scan repositories on GHES:

1. If you have IP restrictions on GitHub v3 API access in your GEHS environment, you need to allow RISKEN environment's IP (contact your RISKEN administrator for the IP address).
2. Set `Base URL` in the GitHub scan settings (e.g. http(s)://hostname/api/v3/).

???+ warning "Limitation"
    The following repositories are not subject to scanning:

    - Repositories with the following statuses:
        - `Archived` (excluded from Gitleaks only)
        - `Disabled`
        - `Fork Repository`
            - *[Fork Repository :octicons-link-external-24:](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo){ target="_blank" } is typically a repository created for contributing (suggesting corrections) to the original repository.
    - Repositories are subject to size limitations (contact your system administrator for details).
    - Those that cannot be cloned from the RISKEN environment.

