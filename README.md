# RISKEN

![Build Status](https://codebuild.ap-northeast-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoieFQ1ZGdWU1ZnRktuYmZMNWhoNHZ0WTBCbGo5dVM2OG9Ld0cyZTQ5NDYvZkQvUkJKT01pTnF6NThxVjN4Tk8veEs1eTB1MTJudTRYTkFIbHZWT2V1enpJPSIsIml2UGFyYW1ldGVyU3BlYyI6ImtBN28zbFlOU3k5Y1JnalAiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=main)

`RISKEN` is the monitoring tool for your cloud, web-site, source-code...

Please check [RISKEN Documentation](https://docs.security-hub.jp/).

![RISKEN-demo-640x400](https://user-images.githubusercontent.com/25426601/139187114-f21479be-5483-43f5-a397-a4a9a4d09e4d.gif)

## Quick Start

You can quickly start the RISKEN server with the docker compose command.
If it works, you can access the RISKEN server at http://localhost/.

```bash
git clone https://github.com/ca-risken/doc.git
cd doc
docker compose up -d
```

### AWS Scan

If you want to scan AWS resources, you need to set the AWS credentials in the environment variables.

```bash
export AWS_ACCESS_KEY_ID=xxx
export AWS_SECRET_ACCESS_KEY=xxx
export AWS_SESSION_TOKEN=xxx
docker compose up -d
```

You can also set the AWS credentials in the `.env` file.

### Support services

Some services(GoogleCloud, Azure, etc.) will not work in the quick start. Because they require administrator settings such as credentials.
For more details, please refer to the following documentation.

- [RISKEN Instration on local machine](https://docs.security-hub.jp/admin/infra_local/)

## Background

RISKEN is an open-source project designed to allow detection of security risks in Cloud-Service-Provider (Amazon Web Services (AWS), Google Cloud Platform (GCP)), and WEB application, Domain, Source-Code-Management(GitHub)...

These `DataSource` are designed to return a series of potential misconfigurations, vulnerabirities and security risks.

## Architecture

RISKEN is a microservice architecture design that runs on Kubernetes.
The servicies are designed with `API-Gateway`, `Core` and various `DataSources`.

![Architecture](https://user-images.githubusercontent.com/25426601/139044505-308e49ed-9fc5-4656-bd4e-59db7f65b61f.png "Architecture")

The detailed flow can be found [here](https://docs.security-hub.jp/admin/infra_architecture/)

## License

Please see [LICENSE](https://github.com/ca-risken/doc/blob/master/LICENSE).
