# Parameters

ここではRISKENの各サービスのパラメータについて説明します

## Service Parameters

- [Common](/admin/param_common/)
- [Gateway](/admin/param_gateway/)
- [Core](/admin/param_core/)
- [AWS](/admin/param_aws/)
- [Google](/admin/param_google/)
- [Diagnosis](/admin/param_diagnosis/)
- [OSINT](/admin/param_osint/)
- [Code](/admin/param_code/)

## AWS ParameterStoreをサポートしています

RISKENではアプリケーション実行時に安全にパラメータを渡すためにAWSのParameterStoreをサポートしています

ParameterStoreを利用することで以下のメリットがあります

- ソースコードにクレデンシャルを保存しなくて済む
- KMSによる暗号化して保存と利用時に復号（Envelope Encryption）
    - クレデンシャルの「保存（暗号化）」と「利用（復号化）」の権限分離
    - クレデンシャル操作の監査ログが残せる

## 仕組み・利用方法

各コンテナ実行時のエントリポイントで[env-injector :octicons-link-external-24:](https://github.com/okzk/env-injector){ target="_blank" } を実行しています

- env-injectorにParameterStoreの保存先を指定する（`ENV_INJECTOR_PATH` や `ENV_INJECTOR_META_CONFIG`で指定）ことで、登録済みの値を環境変数としてコンテナにロードできます
- ParameterStoreではなく、SecretsManagerを利用する場合は `ENV_INJECTOR_SECRET_NAME`を指定してください
- 詳細は[env-injector :octicons-link-external-24:](https://github.com/okzk/env-injector){ target="_blank" }のREADME.mdをご確認ください

## ParameterStore 設定例

1. 例えば、findingサービスに以下の環境変数（`ENV_INJECTOR_META_CONFIG`）を指定します
```yaml
- ENV_INJECTOR_META_CONFIG: /prd/meta/core/finding
```
    - Pathは`/{env}/meta/{name_space}/{service_name}`のフォーマットで指定しています 
        - `{env}` 部分はシステム環境の識別子を想定しています
        - `{name_space}` 部分はRISKENの各NameSpaceです
        - `{service_name}` 部分はRISKENのサービス名です
2. コンテナ実行時に上記１で指定されたParameterStoreが読み込まれます
3. `/prd/meta/core/finding`には以下の値がyaml形式で保存されているとします
```yaml
- parameter_store_path: /prd/common
- parameter_store_path: /prd/core/finding
```
4. 上記３で指定した`parameter_store_path` が順番に読み込まれます
    - 最初に`/prd/common/`のParameterStoreのパスが参照されます
        - `/prd/common/`配下のパスに以下のパラメータが登録されているとします
        ```yaml
        - /prd/common/DB_HOST
        - /prd/common/DB_USER
        - /prd/common/DB_PASSWORD
        ```
        - 環境変数としてコンテナに以下の値がロードされます
        ```yaml
        - DB_HOST: localhost
        - DB_USER: hoge
        - DB_PASSWORD: moge
        ```
    - 次に`/prd/core/finding`のParameterStoreのパスが参照されます
        - `/prd/core/finding/`配下のパスに以下のパラメータが登録されているとします
        ```yaml
        - /prd/core/finding/SERVICE_ADDRESS
        - /prd/core/finding/ENABLE_DEBUG_LOG
        ```
        - 環境変数としてコンテナに以下の値がロードされます
        ```yaml
        - SERVICE_ADDRESS: localhost
        - ENABLE_DEBUG_LOG: true
        ```
5. 最終的にコンテナにロードされる環境変数は以下になります
```yaml
- DB_HOST: localhost
- DB_USER: hoge
- DB_PASSWORD: moge
- SERVICE_ADDRESS: localhost
- ENABLE_DEBUG_LOG: true
```

