# Infrastructure(Local)

This is a document for building the RISKEN system on Docker Desktop (Mac) on a local machine.

---

## Preparation

The following tools are required in advance:

- Install various CLI tools
    - [Docker Desktop :octicons-link-external-24:](https://www.docker.com/products/docker-desktop){ target="_blank" }
    - [kubectl :octicons-link-external-24:](https://kubernetes.io/de/docs/tasks/tools/install-kubectl/){ target="_blank" }
    - [kustomize :octicons-link-external-24:](https://kubectl.docs.kubernetes.io/installation/kustomize/){ target="_blank" }

---

## Launch Kubernetes

- Refer to the [Docker Desktop documentation :octicons-link-external-24:](https://docs.docker.com/desktop/kubernetes/) to start Kubernetes.
- To run it in the local environment, you need to set the CPU and MEM resources assigned to Docker Desktop to the following values or higher:
    - `Preferences` > `Resourses` > `ADVANCED`
        - `CPUs`: 4+
        - `Memory`: 8GB+
    - ![Docker Desktop Resource setting](/img/admin/admin_docker_desktop_min.png)

---

## Deploy RISKEN

### Deploy using Manifest file

- Clone the [sample manifest :octicons-link-external-24:](https://github.com/ca-risken/k8s-sample){ target="_blank" }.
```sell
$ git clone https://github.com/ca-risken/k8s-sample.git
$ cd k8s-sample
```

- Deploy it in the local environment using the make command.
```sell
$ make local-apply
```

- Wait for the Pod's status to become `Running`.
```bash
$ kubectl get pod -A
```

- Access the local environment in a browser.
```bash
http://localhost/
```

???+ tip "By default, only some services are enabled."
    - The following services are not started by default because credentials are required at startup:
        - Google
    - Set the required parameters, update the number of Pods to be started in the Manifest file to `1` or more.
        - For details on the parameters, refer to [Parameters](/admin/param_index/).

---

## Delete created resources

- Delete the local environment resources with the make command.
```sell
$ make local-delete
```
