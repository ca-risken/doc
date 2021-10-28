# RISKEN

![Build Status](https://codebuild.ap-northeast-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoieFQ1ZGdWU1ZnRktuYmZMNWhoNHZ0WTBCbGo5dVM2OG9Ld0cyZTQ5NDYvZkQvUkJKT01pTnF6NThxVjN4Tk8veEs1eTB1MTJudTRYTkFIbHZWT2V1enpJPSIsIml2UGFyYW1ldGVyU3BlYyI6ImtBN28zbFlOU3k5Y1JnalAiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=main)

`RISKEN` is the monitoring tool for your cloud, web-site, source-code...

Please check [RISKEN Documentation](https://docs.security-hub.jp/).

![RISKEN-DEMO](https://user-images.githubusercontent.com/25426601/139181590-3cfdc4c6-7c36-4d9c-9dad-10c76a532de6.gif)

## Quick Start

- Installation guide: [k8s-sample](https://github.com/ca-risken/k8s-sample) 
```bash
$ git clone https://github.com/ca-risken/k8s-sample.git
$ cd k8s-sample
$ make local-apply
```

For more information, please check [RISKEN Instration on local machine](https://docs.security-hub.jp/admin/infra_local/).

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
