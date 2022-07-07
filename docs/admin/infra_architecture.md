# Architecture

RISKENのシステムKubernetes上でいくつかのサービスが動作します

ここではアーキテクチャについて説明します

## Kubernetes

以下は、AWS EKS上に構築する際のアーキテクチャになります

![Kubernetes Architecture](/img/admin/admin_architecture.png)

## Micro Servicies

RISKENシステム内で動作する主なマイクロサービスについて説明します

### Gateway

|Namespace|Service|Description|Memo|
|---|---|---|---|
|gateway|gateway|API-Gatewayです。各サービスへのルーティングや認証・認可を行います|インターネット経由のアクセスはGatewayサービス経由します|
|gateway|web|コンソール画面の静的コンテンツを配信します||

### Core

|Namespace|Service|Description|Memo|
|---|---|---|---|
|core|core|IAM（Identity and AccessManagement）、Finding、Project、Alert、Report関連のAPIサービスです||
|core|datasource-api|AWS, Google, Diagnosis, OSINT, Codeの各種データソース設定やスキャンの呼び出しを行います||

### AWS

|Namespace|Service|Description|Memo|
|---|---|---|---|
|aws|guard-duty|GuardDutyのスキャンを行います||
|aws|admin-checker|IAMユーザやロールの特権チェックに特化したスキャナーです||
|aws|access-analyzer|AccessAnalyzerのスキャンを行います||
|aws|cloudsploit|CloudSploitツールを使ったスキャンを行います||
|aws|portscan|AWSリソースに対するポートスキャンを行います||
|aws|activity|AWSリソースのアクティビティ情報を解析します||

### Google

|Namespace|Service|Description|Memo|
|---|---|---|---|
|google|asset|GCP Asset APIを利用して主にIAMやStorege関連のスキャンを行います||
|google|scc|GCP Security Command Center(SCC)のスキャンを行います||
|google|cloudsploit|CloudSploitツールを使ったスキャンを行います||
|google|portscan|GCPリソースに対するポートスキャンを行います||

### Diagnosis

|Namespace|Service|Description|Memo|
|---|---|---|---|
|diagnosis|wpscan|WP Scanツールを使ったスキャンを行います||
|diagnosis|application-scan|OWASP ZAPツールを使ったスキャンを行います||
|diagnosis|portscan|ポートスキャンを行います||

### OSINT

|Namespace|Service|Description|Memo|
|---|---|---|---|
|osint|subdomain|ドメイン情報を収集しOSINTツールを使ったスキャンを行います||
|osint|website|URLからWEBサイト情報を収集しOSINTツールを使ったスキャンを行います||

### Code

|Namespace|Service|Description|Memo|
|---|---|---|---|
|code|gitleaks|Gitleaksツールを使ったスキャンを行います||
