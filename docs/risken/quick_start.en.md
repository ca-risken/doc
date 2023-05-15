# Quick Start

This page explains how to set up security monitoring for your system environment using RISKEN.


## Before you begin

1. [Create a project :octicons-link-external-24:](/risken/project/#_2){ target="_blank" }
    - Skip if you have already created one.

2. [Prepare a Slack webhook URL :octicons-link-external-24:](https://api.slack.com/messaging/webhooks){ target="_blank" }
    - Currently, Slack is the only supported platform.


## Configure data sources

1. First, collect security information for your environment.

???+ tip "RISKEN supports various data sources."
    Please configure one or more depending on your environment.

- [AWS :octicons-link-external-24:](/aws/overview_datasource/){ target="_blank" }
- [GCP :octicons-link-external-24:](/google/overview_datasource/){ target="_blank" }
- [WordPress :octicons-link-external-24:](/diagnosis/wpscan_datasource/){ target="_blank" }
- [Domain :octicons-link-external-24:](/osint/domain_datasource/){ target="_blank" }
- [Source code :octicons-link-external-24:](/code/gitleaks_datasource/){ target="_blank" }

## Run a scan

1. After registering data sources, open each data source dialog and click the `SCAN` button.
    - ![GCP data source](/img/google/gcp_datasource_list.png){ style="width: 460px;"}
2. When the status becomes `OK`, the scan is complete.
3. Go to `Finding > Finding` screen to check the collected data.
    - ![Finding](/img/risken/finding_list.png){ style="width: 400px;"}

## Set up alerts

1. Create a `rule` with a score of 0.8 or higher.
    - Create an [alert rule named "over 0.8" :octicons-link-external-24:](/risken/alert/#_4){ target="_blank" }.
2. Configure Slack `notifications`.
    - Create a [notification destination with a channel name :octicons-link-external-24:](/risken/alert/#_5){ target="_blank" }.
3. Create an `alert condition` and specify the rule and notification destination.
    - Create an [alert condition named "over 0.8" :octicons-link-external-24:](/risken/alert/#_6){ target="_blank" }.

## Next steps

1. Configure the necessary data sources for your system environment.
2. Invite stakeholders to your project.
    - However, you must log in to RISKEN before inviting them.
