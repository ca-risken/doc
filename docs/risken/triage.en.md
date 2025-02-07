# Automatic Triage
RISKEN has a feature to perform automatic triage.
Through triage, security scan scores may be re-evaluated.
Here we explain the details and operation methods of triage.

???+ tip "Not all scan results are triaged"
    Automatic triage is only applicable to certain data sources and categories.

---

## Checking Triaged Scores
1. Navigate to the Finding details screen
2. Click on the score
    - ![triage_score.png](/img/risken/triage_score.png){style="width:80px"}
3. The triage dialog will be displayed, where you can check what evaluations were used for the triage
    - ![triage_dialog.png](/img/risken/triage_dialog.png){style="width:400px"}

---

## Triage Details
Automatic triage is performed based on the Decision Tree of [SSVC v2.0 :octicons-link-external-24:](https://certcc.github.io/SSVC/){ target="_blank" }.

???+ tip "What is SSVC v2.0?"
    SSVC 2.0 (Stakeholder-Specific Vulnerability Categorization) is a framework for vulnerability response, specifically designed to assist in vulnerability management tailored to different stakeholders (such as deployers).
    It allows for vulnerability assessment from a more comprehensive perspective, not just relying on CVSS scores.
    Additionally, SSVC is used by the U.S. Cybersecurity and Infrastructure Security Agency (CISA) and is recognized for its reliability.

| Decision Points | Aspect | Details |
|---|---|---|
| [Exploitation :octicons-link-external-24:](https://certcc.github.io/SSVC/reference/decision_points/exploitation/) | Vulnerability Exploitation | Evaluates whether attacks exploiting the vulnerability are possible. Determined by factors such as whether the vulnerability has been exploited in the past, whether PoC code is publicly available, and EPSS scores. |
| [SystemExposure :octicons-link-external-24:](https://certcc.github.io/SSVC/reference/decision_points/system_exposure/) | System Exposure | Evaluates access control to the target system. Determines whether it's exposed to the internet and what controls like authentication, authorization, or IP restrictions are in place. |
| [Utility :octicons-link-external-24:](https://certcc.github.io/SSVC/reference/decision_points/utility/) | Attacker Utility | Evaluates how useful the vulnerability exploitation would be for attackers. Assesses efficiency from an attacker's perspective, such as attack automation possibility and whether privileges can be obtained in a single attack. |
| [HumanImpact :octicons-link-external-24:](https://certcc.github.io/SSVC/reference/decision_points/human_impact/) | Safety and Business Impact | Evaluates human casualties and business impact in case of an attack. Determined by factors such as whether it's a production environment and whether important data is stored. |


???+ tip "What is the latest version of SSVC?"
    As of February 7, 2025, SSVC 2.1 is the latest version (released in July 2023).
    The main change is that the evaluation of `Utility (usefulness to attackers)` has been changed to whether it is `Automatable (possibility of attack automation)`.
    Automatable was originally part of Utility, but it has been simplified through consolidation.
