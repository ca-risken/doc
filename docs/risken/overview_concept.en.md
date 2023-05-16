# Concept

When you introduce RISKEN, you can visualize and manage the security status of your system.

## Continuous Data Collection
![RISKEN Concept1](/img/risken/concept1.png){align=right style="width:400px"}
RISKEN continuously evaluates data from the ever-changing system environment.

- RISKEN aggregates various data sources related to the system environment in one place
- It enhances the accuracy of issues from various perspectives
- For example, if there is a suspicion of information leakage incident, it is necessary to look at multiple points from the following perspectives:
    - Does it contain sensitive data?
    - Is it production data or otherwise?
    - Were there any issues with the storage service settings?
    - Was the storage location for the required keys (e.g., source code repository) secure?

---
## Scoring
![RISKEN Concept2](/img/risken/concept2.png){align=right style="width:400px"}
All risk information collected by RISKEN is assigned a score. The purpose is to help with priority decision-making.

- RISKEN sets a unified score (from 0.0 to 1.0)
- The score allows you to grasp high-risk issues and compare them with others
- It helps in setting the priority of issues
???+ info "Actual priority"
    The priority is not necessarily according to the score set by RISKEN
    RISKEN also allows for score adjustments and exclusion settings for each project
### Whitelisting
Flexible score adjustments can be made for each project.

- For example, if you can distinguish between production and non-production resources, the security level of production environments is generally designed to be higher than others
- Therefore, you can set normal score x {coefficient} for specific resources in the production environment
- This allows you to adjust the risk value higher than the normal judgment (conversely, you can lower the score by setting a value lower than 1 for {coefficient})

---
## Utilizing Open Source and Security Services
RISKEN actively utilizes security-related open-source tools and security services provided by CSPs (Cloud Service Providers). This is because using open tools enables a more objective evaluation of the security of system environments.
- The RISKEN team incorporates services and tools they have evaluated into their system and continuously executes them
- For aspects not covered by these tools, the RISKEN team develops their own scanning tools
- The collected data is converted into a generic format, and the RISKEN team scores and collects it

---
## Centralized Management of Projects
![RISKEN Concept 3](/img/risken/concept3.png){align=right style="width:300px"}
RISKEN supports the security management of developers/administrators who need to oversee many systems.
- RISKEN users can freely create projects
- Users can also participate in multiple projects
- Within the scope of user permissions, you can switch between projects and manage across projects
