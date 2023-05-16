# Coverage

This document describes the monitoring items supported by RISKEN.

## Scope of Support

RISKEN supports the following categories/items:

| Category     | Item                              | Description                                                              | Note                                                             |
| :----------- | :-------------------------------- | :----------------------------------------------------------------------- | :--------------------------------------------------------------- |
| `Cloud`      | :material-check: Threat intel     | Collects results of threat detection services like GuardDuty or SecurityCommandCenter | Usage fees for security services may apply. |
|              | :material-check: Resource info    | Monitors resource information and problematic settings in use on cloud | Check conformity with third-party evaluation criteria such as CIS benchmarks. |
|              | :material-check: Public asset info | Collects information on cloud storage and other publicly exposed information on the internet | |
| `Network diagnostics` | :material-check: Portscan | Conducts port scans on externally exposed ports, IP/FQDN being used on cloud | |
| `Web site diagnostics` | :material-check: WordPress | Conducts scans on WordPress | |
|              | :material-check: Application    | Conducts a simple web application scan using OWASP ZAP | Scanning of web pages that require authentication is currently not supported. |
| `OSINT`      | :material-check: Domain          | Checks for web sites that should not be publicly exposed, such as staging environments, and risks such as subdomain takeovers | |
| `Source code` | :material-check: Secret scan     | Inspects for confidential information that should not be stored in source code repositories like GitHub | |