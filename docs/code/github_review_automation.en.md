# Automating Security Reviews

At RISKEN, we offer `RISKEN Security Review`, a tool for automating source code reviews.

The tool is executed upon GitHub pull requests, detecting potentially dangerous code that could lead to cyber attacks such as secret commits or injections, and provides review comments on the pull requests.

![RISKEN Security Review](https://github.com/ca-risken/security-review/raw/main/image/pullrequest-review.png){style="width:700px"}

???+ info "Mechanism"
    RISKEN Security Review runs as a GitHub Actions (Custom Action).
    It is also available in the following MarketPlace.

    - [RISKEN Security Review :octicons-link-external-24:](https://github.com/marketplace/actions/risken-security-review){ target="_blank" }

## Features

The main features of RISKEN Security Review are:

- Commenting on PRs
    - Secret commits
    - Code with security issues
- Fast operation
    - Works faster compared to similar code review tools
    - Runs a built and lightweight container
    - Scans only the changed parts, not the entire code
    - Checks out only the HEAD, allowing it to work on large repositories
    - Small changes can be completed in about 10 to 60 seconds

## Setting Up on Individual Repositories

Operates by creating a GitHub Actions workflow file.

1. Create a file named `.github/workflows/security-review.yaml` in the target repository
2. Copy & paste the following code into the created file

```yaml
name: Security Code Review on PR
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  review:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pull-requests: write

    steps:
      - uses: actions/checkout@v4
      - uses: ca-risken/security-review@v1
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

### Integration with RISKEN Environment

The above setup works on its own, but you can optionally integrate it with an existing RISKEN environment.

- Integrating with RISKEN offers the following benefits:
    - Access to generated AI explanations and recommended comments
    - Detailed scan results including severity, score, and related links
    - Share with the security team for expert advice
- To enable integration with RISKEN, add the following options:
    - `risken_console_url`
    - `risken_api_endpoint`
    - `risken_api_token`

```yaml
- uses: ca-risken/security-review@v1
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    risken_console_url: ${{ secrets.RISKEN_CONSOLE_URL }} # optional
    risken_api_endpoint: ${{ secrets.RISKEN_API_ENDPOINT }} # optional
    risken_api_token: ${{ secrets.RISKEN_API_TOKEN }} # optional
```

To run this JOB, you need to register `secrets` that GitHub Actions can reference in advance.


| Parameter | Key | Description | Required | Default | Examples |
| ---- | ---- | ---- | ---- | ---- | ---- |
| `risken_console_url` | `RISKEN_CONSOLE_URL` | RISKEN Console URL | `no` | | https://console.your-env.com |
| `risken_api_endpoint` | `RISKEN_API_ENDPOINT` | RISKEN API Endpoint | `no` | | https://api.your-env.com |
| `risken_api_token` | `RISKEN_API_TOKEN` | RISKEN API Token | `no` | | xxxxx |


???+ info "You need to issue an access token beforehand"
    You need to issue an access token for the relevant RISKEN project.

    - [Issue RISKEN Access Token :octicons-link-external-24:](/risken/access_token/){ target="_blank" }
    - [Register Secrets for GitHub Actions :octicons-link-external-24:](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions){ target="_blank" }

## Applying to the Entire Organization

If you are an organization administrator, in addition to setting up individual repositories, you can enable code review for the entire organization.

1. Create a `.github` repository within the organization (use an existing one if already created)
    - The `.github` repository is a special repository for storing common templates and workflows
    - However, any other repository is also fine
2. Register RISKEN information in the organization settings
    - Register `RISKEN_CONSOLE_URL` in Organization variables (Visibility is All repositories)
    - Register `RISKEN_API_ENDPOINT` in Organization variables (Visibility is

 All repositories)
    - Save `RISKEN_API_TOKEN` in Organization secrets (Visibility is All repositories)
        - You need to issue an [Access Token :octicons-link-external-24:](/risken/access_token/){ target="_blank" } in the RISKEN environment beforehand
3. Create the following [workflow file](#_4) in the `.github` repository
4. Create `rulesets` in the organization settings
    - [What are rulesets? :octicons-link-external-24:](https://docs.github.com/en/enterprise-cloud@latest/organizations/managing-organization-settings/managing-rulesets-for-repositories-in-your-organization){ target="_blank" }
    - Create a new `New branch ruleset` in rulesets
    - Specify the target repositories and branches (the following settings target all repositories' default branches)
        - Specify `All Repositories`
        - For branches, choose `Include default branches`
    - Check `Require workflows to pass before merging` and specify the workflow file created above
        - Specify the repository as `.github`
        - Specify the version as the master branch (like `master` or `main`)
            - Specifying a particular version (branch, tag, commit SHA) is also possible
        - Specify the workflow file as `.github/workflows/security-review.yaml`

![GitHubSetting](/img/code/github_rulesets_workflow.png){style="width:800px"}

???+ tip "About Repository Visibility"
    - In these steps, we used the `.github` repository, but if there are public repositories within the organization, there may be issues with referencing the workflow file
        - This is because public repositories can only reference public workflow files
        - Making the `.github` repository public solves this issue, but if you have templates, workflows, or profile data that cannot be published, prepare another repository
    - For details, refer to [workflow settings :octicons-link-external-24:](https://docs.github.com/en/enterprise-cloud@latest/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/available-rules-for-rulesets#require-workflows-to-pass-before-merging)

## Workflow File (Sample)

Save the following as a file named `.github/workflows/security-review.yaml` (yaml file name is arbitrary)

```yaml
name: Security Code Review on PR
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  review:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pull-requests: write

    steps:
      - uses: actions/checkout@v4
      - uses: ca-risken/security-review@v1
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          risken_console_url: ${{ secrets.RISKEN_CONSOLE_URL }} # optional
          risken_api_endpoint: ${{ secrets.RISKEN_API_ENDPOINT }} # optional
          risken_api_token: ${{ secrets.RISKEN_API_TOKEN }} # optional
```
