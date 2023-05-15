# Parameters

This section describes the parameters for each service of RISKEN.

## Service Parameters

- [Common](/admin/param_common/)
- [Gateway](/admin/param_gateway/)
- [Core](/admin/param_core/)
- [AWS](/admin/param_aws/)
- [Google](/admin/param_google/)
- [Diagnosis](/admin/param_diagnosis/)
- [OSINT](/admin/param_osint/)
- [Code](/admin/param_code/)

## Supports AWS Parameter Store

RISKEN supports AWS Parameter Store to safely pass parameters during application runtime.

Using Parameter Store provides the following benefits:

- Avoids saving credentials in source code
- Encryption by KMS and decryption at runtime (Envelope Encryption)
    - Separation of authority between "saving (encryption)" and "using (decryption)" of credentials
    - Audit logs of credential operations can be retained
    - If you save credentials, please specify `Secret String`.
    - For details, please refer to the [official documentation :octicons-link-external-24:](https://docs.aws.amazon.com/kms/latest/developerguide/services-parameter-store.html#parameter-store-advanced-encrypt){ target="_blank" }.

## Mechanism and Usage

At the entry point of each container execution, [env-injector :octicons-link-external-24:](https://github.com/okzk/env-injector){ target="_blank" } is executed.

By specifying the storage location in Parameter Store in env-injector (`ENV_INJECTOR_PATH` or `ENV_INJECTOR_META_CONFIG`), registered values can be loaded into the container as environment variables.

If you want to use SecretsManager instead of Parameter Store, please specify `ENV_INJECTOR_SECRET_NAME`.

For details, please refer to the README.md of [env-injector :octicons-link-external-24:](https://github.com/okzk/env-injector){ target="_blank" }.

## Parameter Store Configuration Example

1. For example, specify the following environment variables (`ENV_INJECTOR_META_CONFIG`) for the finding service:
```yaml
- ENV_INJECTOR_META_CONFIG: /prd/meta/core/finding
```
    - The Path is specified in the format of `/{env}/meta/{name_space}/{service_name}`.
        - The `{env}` part is intended to identify the system environment.
        - The `{name_space}` part is the name space for each RISKEN.
        - The `{service_name}` part is the name of the RISKEN service.
2. The Parameter Store specified in 1 above is loaded at container runtime.
3. Assume that the following values are saved in yaml format in `/prd/meta/core/finding`:
```yaml
- parameter_store_path: /prd/common
- parameter_store_path: /prd/core/finding
```

4. The `parameter_store_path` specified in step 3 is loaded in order:
    - First, the Parameter Store paths under `/prd/common/` are referenced.
        - Assume the following parameters are registered under `/prd/common/`:
        ```yaml
        - /prd/common/DB_HOST
        - /prd/common/DB_USER
        - /prd/common/DB_PASSWORD
        ```
        - The following values are loaded as environment variables in the container:
        ```yaml
        - DB_HOST: localhost
        - DB_USER: hoge
        - DB_PASSWORD: moge
        ```
    - Next, the Parameter Store paths under `/prd/core/finding` are referenced.
        - Assume the following parameters are registered under `/prd/core/finding/`:
        ```yaml
        - /prd/core/finding/SERVICE_ADDRESS
        - /prd/core/finding/ENABLE_DEBUG_LOG
        ```
        - The following values are loaded as environment variables in the container:
        ```yaml
        - SERVICE_ADDRESS: localhost
        - ENABLE_DEBUG_LOG: true
        ```
5. Finally, the environment variables loaded into the container are as follows:
```yaml
- DB_HOST: localhost
- DB_USER: hoge
- DB_PASSWORD: moge
- SERVICE_ADDRESS: localhost
- ENABLE_DEBUG_LOG: true
```
