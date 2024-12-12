# Infrastructure(Local)

ローカルマシーンの上でRISKENのシステム構築をするためのドキュメントです

---

## 準備

事前に以下のツールが必要になります

- 各種CLIツールをインストールする
    - [Docker :octicons-link-external-24:](https://docs.docker.com/engine/install/){ target="_blank" }
    - [Docker Compose :octicons-link-external-24:](https://docs.docker.com/compose/install/){ target="_blank" }

---

## RISKENをデプロイする

- 以下のコマンドを実行してRISKENを起動します
```bash
# clone
git clone https://github.com/ca-risken/doc.git
cd doc

# run
docker compose -f quickstart.yaml up -d
```

- ブラウザでローカル環境にアクセスします
```bash
http://localhost/
```

## AWS環境をスキャンする

AWS環境をスキャンするためにはAWSの認証情報が必要です。
AWSのIAMユーザまたは、STSの一時キーを環境変数経由でRISKENにわたすことでスキャンが可能になります。

```bash
export AWS_ACCESS_KEY_ID=xxx
export AWS_SECRET_ACCESS_KEY=xxx
export AWS_SESSION_TOKEN=xxx
docker compose -f quickstart.yaml up -d
```

環境変数ではなく、`.env`ファイルに設定することも可能です。

### その他のサービスについて

???+ tip "デフォルトでは一部のサービスのみが有効です"
    - 以下のサービスは起動時にクレデンシャルが必要になるためデフォルトでは起動しません
        - Google
    - 必須パラメータを設定しManifestファイル内のPod起動数を`1`以上に更新してください
        - パラメータの詳細は[Parameters](/admin/param_index/)を参照してください

---

## 作成したリソースを削除する

- makeコマンドでローカル環境のリソースを削除します
```sell
$ docker compose -f quickstart.yaml down
```
