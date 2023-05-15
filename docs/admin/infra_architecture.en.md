# Architecture

Several services run on the Kubernetes system of RISKEN. 

Here we will explain the architecture.

## Kubernetes

The following is the architecture when built on AWS EKS.

![Kubernetes Architecture](/img/admin/admin_architecture.png)

## Micro Services

We will explain the main microservices that run within the RISKEN system.

### Gateway

|Namespace|Service|Description|Memo|
|---|---|---|---|
|gateway|gateway|API Gateway that routes to each service and performs authentication and authorization.|Access via the internet is done through the Gateway service.|
|gateway|web|Delivers static content for the console screen.||

### Core

|Namespace|Service|Description|Memo|
|---|---|---|---|
|core|core|API service related to IAM (Identity and Access Management), Finding, Project, Alert, and Report.||
|core|datasource-api|Calls for various data sources settings and scans such as AWS, Google, Diagnosis, OSINT, and Code.||

### AWS

|Namespace|Service|Description|Memo|
|---|---|---|---|
|aws|guard-duty|Performs scans of GuardDuty.||
|aws|admin-checker|Scanner that specializes in checking privileges of IAM users and roles.||
|aws|access-analyzer|Performs scans of AccessAnalyzer.||
|aws|cloudsploit|Performs scans using CloudSploit tool.||
|aws|portscan|Performs port scans on AWS resources.||
|aws|activity|Analyzes activity information of AWS resources.||

### Google

|Namespace|Service|Description|Memo|
|---|---|---|---|
|google|asset|Performs scans mainly on IAM and Storege using GCP Asset API.||
|google|scc|Performs scans of GCP Security Command Center (SCC).||
|google|cloudsploit|Performs scans using CloudSploit tool.||
|google|portscan|Performs port scans on GCP resources.||

### Diagnosis

|Namespace|Service|Description|Memo|
|---|---|---|---|
|diagnosis|wpscan|Performs scans using WP Scan tool.||
|diagnosis|application-scan|Performs scans using OWASP ZAP tool.||
|diagnosis|portscan|Performs port scans.||

### OSINT

|Namespace|Service|Description|Memo|
|---|---|---|---|
|osint|subdomain|Collects domain information and performs scans using OSINT tools.||
|osint|website|Collects website information from URLs and performs scans using OSINT tools.||

### Code

|Namespace|Service|Description|Memo|
|---|---|---|---|
|code|gitleaks|Performs scans using Gitleaks tool.||
|code|dependency|Performs scans for vulnerabilities included in packages.||