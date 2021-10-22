# Parameters

ここではRISKENの各サービスのパラメータについて説明します

## AWS ParameterStoreをサポートしています

RISKENではアプリケーション実行時に安全にパラメータを渡すためにAWSのParameterStoreをサポートしています

ParameterStoreを利用することで以下のメリットがあります

- ソースコードにクレデンシャルを保存しなくて済む
- KMSによる暗号化して保存と利用時に復号（Envelope Encryption）
    - クレデンシャルの「保存（暗号化）」と「利用（復号化）」の権限分離
    - クレデンシャル操作の監査ログが残せる

### ParameterStore 設定例

WIP

## Service Parameters

- [Common](/admin/param_common/)
- [Gateway](/admin/param_gateway/)
- [Core](/admin/param_core/)
- [AWS](/admin/param_aws/)
- [Google](/admin/param_google/)
- [Diagnosis](/admin/param_diagnosis/)
- [OSINT](/admin/param_osint/)
- [Code](/admin/param_code/)
