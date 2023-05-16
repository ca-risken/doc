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

### DataSource

|Namespace|Service|Description|Memo|
|---|---|---|---|
|datasource|datasource-api|AWS, Google, Diagnosis, OSINT, Codeの各種データソース設定やスキャンの呼び出しを行います||

#### AWS

|Namespace|Service|Description|Memo|
|---|---|---|---|
|datasource|guard-duty|GuardDutyのスキャンを行います||
|datasource|admin-checker|IAMユーザやロールの特権チェックに特化したスキャナーです||
|datasource|access-analyzer|AccessAnalyzerのスキャンを行います||
|datasource|cloudsploit|CloudSploitツールを使ったスキャンを行います||
|datasource|portscan|AWSリソースに対するポートスキャンを行います||

#### Google

|Namespace|Service|Description|Memo|
|---|---|---|---|
|datasource|asset|GCP Asset APIを利用して主にIAMやStorege関連のスキャンを行います||
|datasource|scc|GCP Security Command Center(SCC)のスキャンを行います||
|datasource|cloudsploit|CloudSploitツールを使ったスキャンを行います||
|datasource|portscan|GCPリソースに対するポートスキャンを行います||

#### Diagnosis

|Namespace|Service|Description|Memo|
|---|---|---|---|
|datasource|wpscan|WP Scanツールを使ったスキャンを行います||
|datasource|application-scan|OWASP ZAPツールを使ったスキャンを行います||
|datasource|portscan|ポートスキャンを行います||

#### OSINT

|Namespace|Service|Description|Memo|
|---|---|---|---|
|datasource|subdomain|ドメイン情報を収集しOSINTツールを使ったスキャンを行います||
|datasource|website|URLからWEBサイト情報を収集しOSINTツールを使ったスキャンを行います||

#### Code

|Namespace|Service|Description|Memo|
|---|---|---|---|
|datasource|gitleaks|Gitleaksツールを使ったシークレットスキャンを行います||
|datasource|dependency|パッケージに含まれる脆弱性のスキャンを行います||
