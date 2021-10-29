# Performance Tuning

モニタリング対象の環境によって、RISKEN側のサーバのリソースをチューニングする必要があります

RISKENはマイクロサービスアーキテクチャを採用しており、サービスごとに細かくコンピュートリソース等のチューニングができます

---

## 準備

- 事前にNode側に十分スケール可能なコンピュートリソースがあることを確認してください

---

## スケールアウト

ユーザ数やプロジェクト数が多く全体の処理に時間がかかっている場合は、対象サービスの`スケールアウト`を行うことを検討してください

- Deploymentの`replicas`を調整することで、並列処理での同時実行数を増やすことが可能です
- 設定方法の詳細は[Kubernetesの本家ドキュメント :octicons-link-external-24:](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/){ target="_blank" }を参照してください

---

## スペックチューニング

巨大なデータソースのスキャンが必要で、CPUやMEM等のリソースが枯渇している場合は対象サービスの`スケールアップ`を検討してください

- Deploymentの `resources` を調整することでコンピュートリソースを増やすことが可能です
- スペックのチューニング方法の詳細は[Kubernetesの本家ドキュメント :octicons-link-external-24:](https://kubernetes.io/docs/tasks/configure-pod-container/assign-memory-resource/){ target="_blank" }を参照してください
    - メモリやCPUの最適なrequest/limitの決定は実際に動作しながら計測していく必要があります
    - チューニングの考え方や計測方法の例として[sysdig社のブログ  :octicons-link-external-24:](https://sysdig.jp/blog/kubernetes-resource-limits/){ target="_blank" }を紹介いたします
- RISKENの各サービスは基本的にはメモリまたはCPUリソースを消費しますが、一部のスキャナによっては一時的にディスクにデータを書き込むものがあります（スキャン対象のデータや、スキャン結果のファイル）
    - なのでスキャンが動くコンテナに対して永続ボリュームの追加は不要ですが、[エフェメラルボリューム :octicons-link-external-24:](https://kubernetes.io/docs/concepts/storage/ephemeral-volumes/){ target="_blank" }は追加する必要が出てくる可能性があります

