# Well-Architected

In addition to the main security features, RISKEN adds `tags` to Findings for pillars other than "Security" based on the [AWS Well-Architected Framework :octicons-link-external-24:](https://aws.amazon.com/jp/architecture/well-architected){ target="_blank" }, which consists of five pillars, as outlined in our [Well-Architected page](/risken/well_architected/#5). (Security is the main feature and therefore excluded from this implementation.)

???+ note "Well-Architected tags are an experimental feature"
    Please note that RISKEN does not cover all items, but only a small part of the Well-Architected framework. If you need a comprehensive review of the framework, please consult your organization's specialist team.


## Five Pillars

1. [Operational Excellence :octicons-link-external-24:](https://wa.aws.amazon.com/wat.pillar.operationalExcellence.en.html){ target="_blank" }
2. [Security :octicons-link-external-24:](https://wa.aws.amazon.com/wat.pillar.security.en.html){ target="_blank" }
3. [Reliability :octicons-link-external-24:](https://wa.aws.amazon.com/wat.pillar.reliability.en.html){ target="_blank" }
4. [Performance Efficiency :octicons-link-external-24:](https://wa.aws.amazon.com/wat.pillar.performance.en.html){ target="_blank" }
5. [Cost Optimization :octicons-link-external-24:](https://wa.aws.amazon.com/wat.pillar.costOptimization.en.html){ target="_blank" }


## Well-Architected Tags

| Five Pillars | Tag           | Description                                                |
| ------------ | -------------| ---------------------------------------------------------- |
| Operational Excellence | `operation`  | Applied when there are issues related to workload observability or the necessity of operations, following the principles of operational excellence. For example, when there are outdated versions of components that require attention. |
| Security | -             | Since almost all findings are related to security, we do not assign any special tags to it. |
| Reliability | `reliability` | Applied when there are issues related to system redundancy, capacity, backups, certificates, and other reliability-related problems. |
| Performance Efficiency | `performance` | Applied when there are issues related to architecture selection and efficiency of computing resources. Note that since security scanners mainly focus on security, the number of findings in this area is relatively small. |
| Cost Optimization | `cost`       | Applied when there is a possibility of unnecessary costs, such as unused resources. |

## Use Cases

???+ warning "Note"
    Please note that Well-Architected tags are an experimental feature, and operational images, procedures, etc., may be updated.

### Receive alerts when unnecessary costs occur

1. Go to the `Alerts > Rules` screen
2. Set the following conditions for a new rule:
    - Tag: `cost`
    - Score: `0.3`
    - ![Alert rule](/img/risken/wa_alert_rule.png){style="width:400px"}
3. Go to the `Alerts > Conditions` screen
4. Specify the following for a new condition:
    - Rule selection: The rule created in step 2
    - Notification destination selection: Your usual notification destination
    - Other: As appropriate
    - ![Alert condition](/img/risken/wa_alert_condition.png){style="width:400px"}
5. The settings are complete.
    - In this state, you will be notified if there is a problem finding at the next scheduled execution.
    - If you want to manually run alert analysis, please run it from the menu (right-side action menu) of the target condition data.

### Check the system's reliability

Check for reliability issues with the current monitoring target system with the following steps:

1. Go to the `Finding > Finding` screen
2. Set the following for the filter item:
    - Tag: `reliability`
    - Score: `0.3`
    - ![Finding condition](/img/risken/wa_finding.png){style="width:400px"}
3. Click the search button to check if any corresponding data exists.
