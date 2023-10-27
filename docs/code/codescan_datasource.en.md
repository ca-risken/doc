# Data Source

This section describes the data source settings for CodeScan.

## CodeScan Scan Configuration

1. After completing the [Dependency Configuration](dependency_datasource.en.md#DependencyScanConfiguration), the settings screen will appear.
2. Please fill in the following fields and click on `EDIT`:

   - **Enable CodeScan**: Setting this to ON will allow you to configure the CodeScan scan (it's ON by default for new registrations).
     - Setting it to OFF and clicking `EDIT` will delete the existing settings.
   - **RepositoryPattern**: Specify the repository names you want to scan under the above TargetResource (partial match allowed).
     - If left blank, all repositories under the TargetResource will be targeted.
   - **Repository Visibility**: Please select the [visibility :octicons-link-external-24:](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-repository-visibility){ target="_blank" } for scanning (If you target Internal/Private, you need to register a PAT).
     - `Public`: Scans repositories that are publicly available on the internet.
     - `Internal`: Scans repositories within the Enterprise.
     - `Private`: Scans private repositories.

   ![CodeScan Settings](/img/code/codescan_setting.png){style="width:500px"}

If you have already registered GitHub settings, follow these steps to navigate to the CodeScan settings:

1. Click on `Code > GitHub` from the menu.
2. From the GitHub settings list, click on `Action -> Edit Item` for the row you wish to modify.
3. In the dialog, click on code:codescan to open the CodeScan settings.
