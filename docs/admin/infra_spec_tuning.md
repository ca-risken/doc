# Spec Tuning

モニタリング対象の環境によって、RISKEN側のサーバのリソースをチューニングする必要があります

RISKENはマイクロサービスアーキテクチャを採用しているので、サービスごとに細かくスペックチューニングすることができます

---

## チューニング方法

- 事前にNodeに十分なリソースがあることを確認してください
- Podのスペックチューニング方法については[Kubernetesの本家ドキュメント :octicons-link-external-24:](https://kubernetes.io/docs/tasks/configure-pod-container/assign-memory-resource/){ target="_blank" }を参照してください
    - メモリやCPUの最適なrequest/limitの決定は実際に動作しながら計測していく必要があります
    - チューニングの考え方や計測方法の例として[sysdig社のブログ  :octicons-link-external-24:](https://sysdig.jp/blog/kubernetes-resource-limits/){ target="_blank" }を紹介いたします
- RISKENの各サービスは基本的にはメモリまたはCPUリソースを消費しますが、一部のスキャナによっては一時的にDiskにデータを書き込むものがあります（スキャン対象のデータや、スキャン結果のファイル）
    - なのでスキャンが動くコンテナに対して永続ボリュームの追加は不要ですが、[エフェメラルボリューム :octicons-link-external-24:](https://kubernetes.io/docs/concepts/storage/ephemeral-volumes/){ target="_blank" }は追加する必要が出てくる可能性があります

