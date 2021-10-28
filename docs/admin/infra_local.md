# Infrastructure(Local)

ローカルマシーンのDocker Desktop（Mac）上でRISKENのシステム構築をするためのドキュメントです

---

## 準備

事前に以下のツールが必要になります

- 各種CLIツールをインストールする
    - [aws cli :octicons-link-external-24:](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html){ target="_blank" }
    - [kubectl :octicons-link-external-24:](https://kubernetes.io/de/docs/tasks/tools/install-kubectl/){ target="_blank" }
    - [kustomize :octicons-link-external-24:](https://kubectl.docs.kubernetes.io/installation/kustomize/){ target="_blank" }

---

## Kubernetesを起動する

- [Docker Desktopのドキュメント :octicons-link-external-24:](https://docs.docker.com/desktop/kubernetes/) を参照しKubernetesを起動してください

---

## RISKENをデプロイする

### Manifestファイルを使ってデプロイ

- [サンプルmanifest :octicons-link-external-24:](https://github.com/ca-risken/k8s-sample){ target="_blank" }をcloneします
```sell
$ git clone https://github.com/ca-risken/k8s-sample.git
$ cd k8s-sample
```

- makeコマンドでlocal環境にデプロイします
```sell
$ make local-apply
```

- PodのStatusが`Runnig`になるのを待ちます
```bash
$ kubectl get pod -A
```

- ブラウザでローカル環境にアクセスします
```bash
http://localhost/
```


???+ tip "デフォルトでは一部のサービスのみが有効です"
    - 以下のサービスは起動時にクレデンシャルが必要になるためデフォルトでは起動しません
        - Google
        - JIRA
    - 必須パラメータを設定しManifestファイル内のPod起動数を`1`以上に更新してください
        - パラメータの詳細は[Prameters](/admin/param_index/)を参照してください

---

## 作成したリソースを削除する

- makeコマンドでローカル環境のリソースを削除します
```sell
$ make local-delete
```
