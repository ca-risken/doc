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

### DataSource

|Namespace|Service|Description|Memo|
|---|---|---|---|
|datasource|datasource-api|Calls for various data sources settings and scans such as AWS, Google, Diagnosis, OSINT, and Code.||

#### AWS

|Namespace|Service|Description|Memo|
|---|---|---|---|
|datasource|guard-duty|Performs scans of GuardDuty.||
|datasource|admin-checker|Scanner that specializes in checking privileges of IAM users and roles.||
|datasource|access-analyzer|Performs scans of AccessAnalyzer.||
|datasource|cloudsploit|Performs scans using CloudSploit tool.||
|datasource|portscan|Performs port scans on AWS resources.||

#### Google

|Namespace|Service|Description|Memo|
|---|---|---|---|
|datasource|asset|Performs scans mainly on IAM and Storege using GCP Asset API.||
|datasource|scc|Performs scans of GCP Security Command Center (SCC).||
|datasource|cloudsploit|Performs scans using CloudSploit tool.||
|datasource|portscan|Performs port scans on GCP resources.||

#### Diagnosis

|Namespace|Service|Description|Memo|
|---|---|---|---|
|datasource|wpscan|Performs scans using WP Scan tool.||
|datasource|application-scan|Performs scans using OWASP ZAP tool.||
|datasource|portscan|Performs port scans.||

#### OSINT

|Namespace|Service|Description|Memo|
|---|---|---|---|
|datasource|subdomain|Collects domain information and performs scans using OSINT tools.||
|datasource|website|Collects website information from URLs and performs scans using OSINT tools.||

#### Code

|Namespace|Service|Description|Memo|
|---|---|---|---|
|datasource|gitleaks|Performs scans for secrets using Gitleaks tool.||
|datasource|dependency|Performs scans for vulnerabilities included in packages.||
