# Infrastructure(Local)

This is a document for building the RISKEN system on Docker Desktop (Mac) on a local machine.

---

## Preparation

The following tools are required in advance:

- Install various CLI tools
    - [Docker :octicons-link-external-24:](https://docs.docker.com/engine/install/){ target="_blank" }
    - [Docker Compose :octicons-link-external-24:](https://docs.docker.com/compose/install/){ target="_blank" }

---

## Deploy RISKEN

### Deploy using Manifest file

- Run the following command to start RISKEN.
```bash
# clone
git clone https://github.com/ca-risken/doc.git
cd doc

# run
docker compose -f quickstart.yaml up -d
```

- Access the local environment in a browser.
```bash
http://localhost/
```

### AWS Scan

To scan the AWS environment, AWS authentication information is required.
Scanning can be done by passing an AWS IAM user or STS temporary key through environment variables to RISKEN.

```bash
export AWS_ACCESS_KEY_ID=xxx
export AWS_SECRET_ACCESS_KEY=xxx
export AWS_SESSION_TOKEN=xxx
docker compose -f quickstart.yaml up -d
```

You can also set the AWS credentials in the `.env` file.

### Other services

???+ tip "By default, only some services are enabled."
    - The following services are not started by default because credentials are required at startup:
        - Google
    - Set the required parameters, update the number of Pods to be started in the Manifest file to `1` or more.
        - For details on the parameters, refer to [Parameters](/admin/param_index/).

---

## Delete created resources

- Delete the local environment resources with the make command.
```sell
$ docker compose -f quickstart.yaml down
```
