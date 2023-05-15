# Domain

By registering domain information that you own, you can detect high-risk subdomains. 

At RISKEN, we analyze domain information by combining multiple OSINT tools.

???+ warning "Coverage of scan target"
    The subdomains targeted for scanning are extracted from those indexed in multiple major search engines. 
    As it is dynamically extracted every time, there is a possibility that the intended domain may not be included.

???+ tip "What is a high-risk domain?"
    RISKEN analyzes domains from the following perspectives:

    - Are there any URLs on the Internet that should not be generally disclosed other than the production environment?
    - Are there any domains that may be subject to [Subdomain Takeover :octicons-link-external-24:](https://developer.mozilla.org/en-US/docs/Web/Security/Subdomain_takeovers){ target="_blank" }?
    - Is the SSL server certificate about to expire?

## Format

When importing data to RISKEN, the following metadata is added:

| Item           | Description                                     |
| -------------- | ----------------------------------------------  |
| `DataSource`   | osint:subdomain (fixed)                          |
| `ResourceName` | Target domain for scanning                      |
| `Description`  | Description                                     |
| `Score`        | See [Scoring](/osint/domain_concept/#_2)         |
| `Tag`          | `osint` `domain` `{Type of risk}` `{Target domain name}` |

## Scoring

As mentioned above, RISKEN determines the risk of a domain based on three factors.

The scoring is as follows for each factor:

???+ warning "Case when the target server is down"
    There are cases where an http(s) request is made during the analysis. 
    If the target server is down at that time, the intended information may not be obtained.

### Environments that should not be generally disclosed are externally disclosed

```mermaid
graph TD
    A[Start] --> B{{Does subdomain match DetectWord?}};
    B -->|YES| C[Score: 0.3]:::low;
    B -->|NO| D[Finding isn't registered.];
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
```

### The SSL server certificate is about to expire

```mermaid
graph TD
    A[Start] --> B{{Is number of days left until certificate expiration?}};
    B -->|More than 30 days| C[Score: 0.1]:::low;
    B -->|Less than 30 days| D[Score: 0.6]:::mid;
    B -->|Less than 14 days| E[Score: 0.8]:::high;
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
```

### Domains with potential for subdomain takeover

The score is calculated based on whether the subdomain has a CNAME record or whether the server/site is down. If the server is down and the risk of subdomain takeover is high, further analysis is conducted.

```mermaid
graph TD
    A[Start] --> B{{Does subdomain has CNAME record?}};
    B -->|NO| C[Finding isn't registered.]:::low;
    B -->|YES| D{{Is subdomain seemed down?}};
    D -->|NO| E[Score: 0.1]:::low;
    D -->|YES| F[Does CNAME match high lisk list?];
    F -->|NO| G[Score: 0.6]:::mid;
    F -->|YES| H[Score: 0.8]:::high;
    classDef high fill:#FFFFFF,stroke:#C2185B,stroke-width:4px;
    classDef mid fill:#FFFFFF,stroke:#F57C00,stroke-width:4px;
    classDef low fill:#FFFFFF,stroke:#4DB6AC,stroke-width:4px;
```

## Domains with High Risk of Subdomain Takeover

The following list includes domains where it is possible for a third party to easily acquire a CNAME record. If the CNAME record matches any of the domains in the list and accessing the subdomain results in a server/site being down, the risk score will be high.

- us-east-1.elasticbeanstalk.com
- s3.amazonaws.com
- s3-website-{region}.amazonaws.com
- s3-website.{region}.amazonaws.com
- animaapp.io
- bitbucket.io
- furyns.com
- ghost.io
- hatenablog.com
- helpjuice.com
- helpscoutdocs.com
