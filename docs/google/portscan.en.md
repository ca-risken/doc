# PortScan

It is possible to perform a port scan using [Nmap :octicons-link-external-24:](https://nmap.org/man/ja/index.html){ target="_blank" } towards ports exposed to the outside from GCP instances, firewall rules, and more, and import the results into RISKEN's Findings.

## Format

The following metadata is added when importing data into RISKEN:

| Item           | Description                                  |
| -------------- | -------------------------------------------|
| `DataSource`   | aws:portscan (fixed)                         |
| `ResourceName` | ARN of the scanned resource                  |
| `Description`  | Description                                  |
| `Score`        | Refer to [Scoring](/google/portscan/#_2)     |
| `Tag`          | `google` `gcp` `portscan` `{ProjectID}`      |

## Scoring

The scoring is the same as AWS's Portscan.
Refer to [AWS's Portscan Scoring](/aws/portscan/#_2) for details.
