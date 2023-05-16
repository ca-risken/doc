# Portscan

It is possible to conduct a port scan using [Nmap :octicons-link-external-24:](https://nmap.org/man/ja/index.html){ target="_blank" } towards the set IP/FQDN and import the results to RISKEN's Finding.

---
## Format

The following metadata will be added when importing data to RISKEN:

| Item            | Description                                            |
| -------------- | ---------------------------------------------- |
| `DataSource`   | diagnosis:portscan (fixed)                |
| `ResourceName` | IP/FQDN that was scanned                                         |
| `Description`  | Description        　                |
| `Score`        | Refer to [scoring](/diagnosis/portscan_concept/#_2)            |
| `Tag`          | `diagnosis` `portscan` `vulnerability` `fqdn` `{target IP/FQDN}` |

---
## Scoring

The scoring content is the same as AWS's Portscan.
Refer to [AWS's Portscan Scoring](/aws/portscan/#_2).
