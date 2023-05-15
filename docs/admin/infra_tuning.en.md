# Performance Tuning

Depending on the monitored environment, it may be necessary to tune the resources of RISKEN servers.

RISKEN adopts a microservices architecture, which allows fine-tuning of compute resources for each service.

---

## Preparation

- Make sure that there are sufficient scalable compute resources on the Node side in advance.

---

## Scaling Out

If there are many users or projects and the overall processing time is taking too long, consider performing `Scaling Out` of the target service.

- By adjusting the `replicas` of the Deployment, it is possible to increase the number of simultaneous executions in parallel processing.
- For details on how to configure this, please refer to the [official Kubernetes documentation :octicons-link-external-24:](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/){ target="_blank" }.

---

## Spec Tuning

If a scan of a large data source is required and resources such as CPU and MEM are running out, consider performing `Scaling Up` of the target service.

- By adjusting the `resources` of the Deployment, it is possible to increase the compute resources.
- For details on how to tune the specs, please refer to the [official Kubernetes documentation :octicons-link-external-24:](https://kubernetes.io/docs/tasks/configure-pod-container/assign-memory-resource/){ target="_blank" }.
    - Determining the optimal request/limit for memory or CPU resources requires measuring while actually running.
    - As an example of tuning ideas and measurement methods, we introduce [a blog by Sysdig :octicons-link-external-24:](https://sysdig.com/blog/kubernetes-resource-limits/){ target="_blank" }.
- RISKEN's individual services mainly consume memory or CPU resources, but some scanners temporarily write data to disk (such as the data to be scanned or the scan result files).
    - Therefore, it is unnecessary to add persistent volumes to the containers running scans, but [ephemeral volumes :octicons-link-external-24:](https://kubernetes.io/docs/concepts/storage/ephemeral-volumes/){ target="_blank" } may need to be added.
