# Google

RISKEN上にあなたのGoogle情報を登録することで、Google関連のセキュリティデータを収集することができます

???+ inline end info "補足"
    RISKENでは現在GCP関連のみサポートしています


- Googleの各種データソースを有効にすると自動収集プログラムがスケジュールされます
- どのようなデータが収集されるかは、データソースごとのドキュメントを参照してください
- 全てのデータソースを有効にすることを推奨しますが、一部のデータソースのみを有効化することもできます

ここではGCP向けの各種データソース設定に関する説明をします。

---

## 事前準備

GCPのデータソース設定には以下の2つの作業が必要です

1. RISKENのサービスアカウントをアクセス許可する
2. GCPの各種データソースを有効にする

---
## サービスアカウントを許可

RISKENからスキャン対象のGoogleリソースを参照できるようにするために事前にRISKENのサービスアカウントにアクセス権を付与する必要があります

```
risken@ca-security-hub.iam.gserviceaccount.com
```

### GCPの場合

GCPのマネージメントコンソールでサービスアカウントを追加する例です

1. IAMメニューを開きます
    - ![IAMメニュー](/img/google/gcp_iam_menu.png){style="width:200px"}
2. 追加をクリックします
    - ![IAM追加](/img/google/gcp_iam_add.png){style="width:200px"}
3. 以下を入力し保存をクリックします
    - 新しいメンバー: 
        ```
        risken@ca-security-hub.iam.gserviceaccount.com
        ```
    - ロール: `閲覧者` （roles/viewer）
    - ![ロール追加](/img/google/gcp_role_add.png){style="width:300px"}

    ???+ Warning "閲覧者（roles/viewer）権限の付与が難しい場合"
        [GCPカスタムロールを作成](/google/#gcp_1)しRISKENサービスアカウントに付与してください。

        （プロジェクト内にセンシティブなデータが保存されており許可できない場合など）

---
## データソース

**※ GCPの新規プロジェクト登録（以下のStep3）は現状管理者のみ操作可能となっています。**

設定が必要な方は[Contact us](/contact/contact)までご連絡ください

1. メニューより`Google > GCP`をクリックしGCPの設定画面に遷移します
2. 画面右側の`NEW`をクリックします
3. 新規追加ダイアログで以下の項目を入力し`REGIST`をクリックします
    - **Name ＊**: GCP名（任意のもの）
    - **GCP Organization ID**: GCP 組織IDです（SecurityCommandCenterのスキャン時に必要になります）
        - 組織IDの確認方法は [Googleのドキュメント](https://cloud.google.com/resource-manager/docs/creating-managing-organization)を参照してください
    - **GCP Project ID ＊**: GCP プロジェクト
        - プロジェクトの確認方法は [Googleのドキュメント](https://cloud.google.com/resource-manager/docs/creating-managing-projects?hl=ja#identifying_projects) を参照してください
    - ![GCP登録](/img/google/gcp_regist.png){style="width:350px"}
4. GCPプロジェクト登録後、一覧クリックしGoogleのGCP DataSource画面を開きます
5. 各種スキャナーの一覧右側のアクションより`SETUP ALL`をクリックします
    - ![SETUP ALL](/img/google/gcp_setup_all.png){style="width:150px"}
6. DataSourceダイアログで`ATTACH`をクリックします
    - ![ATTACH ALL](/img/google/gcp_attach_all.png){style="width:300px"}


---

## スキャン

データソース設定が完了したら、実際にスキャンできるかを確認します

1. 各種スキャナーの一覧をクリックし左下にある`SCAN`をクリックします
2. Status欄が`OK`になれば連携成功です（※エラー表示時はダイアログにエラーメッセージが表示されます）
    - ![scan](/img/google/gcp_scan.png){style="width:400px"}
    - データソースが収集したFindingデータは`Finding > Finding`画面で確認することができます
3. 上記のように手動スキャンの他に連携済みのDataSourceは定期的にスケジュール実行されます



---

## GCPカスタムロール

以下にRISKEN用のカスタムロールを作成する手順を記載します

- `risken.yaml`というファイル名で下記のyamlを保存してください

```yaml linenums="1"
title: "RISKEN"
description: "RISKEN custom role."
stage: "GA"
includedPermissions:
- cloudasset.assets.analyzeIamPolicy
- cloudasset.assets.searchAllIamPolicies
- cloudasset.assets.searchAllResources
- cloudsql.instances.get
- cloudsql.instances.list
- cloudsql.instances.listServerCas
- cloudsql.sslCerts.list
- cloudsql.users.list
- compute.acceleratorTypes.get
- compute.acceleratorTypes.list
- compute.addresses.get
- compute.addresses.list
- compute.autoscalers.get
- compute.autoscalers.list
- compute.backendBuckets.get
- compute.backendBuckets.list
- compute.backendServices.get
- compute.backendServices.list
- compute.commitments.get
- compute.commitments.list
- compute.diskTypes.get
- compute.diskTypes.list
- compute.disks.get
- compute.disks.getIamPolicy
- compute.disks.list
- compute.externalVpnGateways.get
- compute.externalVpnGateways.list
- compute.firewallPolicies.get
- compute.firewallPolicies.getIamPolicy
- compute.firewallPolicies.list
- compute.firewalls.get
- compute.firewalls.list
- compute.forwardingRules.get
- compute.forwardingRules.list
- compute.globalAddresses.get
- compute.globalAddresses.list
- compute.globalForwardingRules.get
- compute.globalForwardingRules.list
- compute.globalForwardingRules.pscGet
- compute.globalNetworkEndpointGroups.get
- compute.globalNetworkEndpointGroups.list
- compute.globalOperations.get
- compute.globalOperations.getIamPolicy
- compute.globalOperations.list
- compute.globalPublicDelegatedPrefixes.get
- compute.globalPublicDelegatedPrefixes.list
- compute.healthChecks.get
- compute.healthChecks.list
- compute.httpHealthChecks.get
- compute.httpHealthChecks.list
- compute.httpsHealthChecks.get
- compute.httpsHealthChecks.list
- compute.images.get
- compute.images.getFromFamily
- compute.images.getIamPolicy
- compute.images.list
- compute.instanceGroupManagers.get
- compute.instanceGroupManagers.list
- compute.instanceGroups.get
- compute.instanceGroups.list
- compute.instanceTemplates.get
- compute.instanceTemplates.getIamPolicy
- compute.instanceTemplates.list
- compute.instances.get
- compute.instances.getEffectiveFirewalls
- compute.instances.getGuestAttributes
- compute.instances.getIamPolicy
- compute.instances.getScreenshot
- compute.instances.getSerialPortOutput
- compute.instances.getShieldedInstanceIdentity
- compute.instances.getShieldedVmIdentity
- compute.instances.list
- compute.instances.listReferrers
- compute.interconnectAttachments.get
- compute.interconnectAttachments.list
- compute.interconnectLocations.get
- compute.interconnectLocations.list
- compute.interconnects.get
- compute.interconnects.list
- compute.licenseCodes.get
- compute.licenseCodes.getIamPolicy
- compute.licenseCodes.list
- compute.licenses.get
- compute.licenses.getIamPolicy
- compute.licenses.list
- compute.machineImages.get
- compute.machineImages.getIamPolicy
- compute.machineImages.list
- compute.machineTypes.get
- compute.machineTypes.list
- compute.maintenancePolicies.get
- compute.maintenancePolicies.getIamPolicy
- compute.maintenancePolicies.list
- compute.networkEndpointGroups.get
- compute.networkEndpointGroups.getIamPolicy
- compute.networkEndpointGroups.list
- compute.networks.get
- compute.networks.getEffectiveFirewalls
- compute.networks.list
- compute.networks.listPeeringRoutes
- compute.nodeGroups.get
- compute.nodeGroups.getIamPolicy
- compute.nodeGroups.list
- compute.nodeTemplates.get
- compute.nodeTemplates.getIamPolicy
- compute.nodeTemplates.list
- compute.nodeTypes.get
- compute.nodeTypes.list
- compute.projects.get
- compute.publicAdvertisedPrefixes.get
- compute.publicAdvertisedPrefixes.list
- compute.publicDelegatedPrefixes.get
- compute.publicDelegatedPrefixes.list
- compute.regionBackendServices.get
- compute.regionBackendServices.list
- compute.regionHealthCheckServices.get
- compute.regionHealthCheckServices.list
- compute.regionHealthChecks.get
- compute.regionHealthChecks.list
- compute.regionNetworkEndpointGroups.get
- compute.regionNetworkEndpointGroups.list
- compute.regionNotificationEndpoints.get
- compute.regionNotificationEndpoints.list
- compute.regionOperations.get
- compute.regionOperations.getIamPolicy
- compute.regionOperations.list
- compute.regionSslCertificates.get
- compute.regionSslCertificates.list
- compute.regionTargetHttpProxies.get
- compute.regionTargetHttpProxies.list
- compute.regionTargetHttpsProxies.get
- compute.regionTargetHttpsProxies.list
- compute.regionUrlMaps.get
- compute.regionUrlMaps.list
- compute.regionUrlMaps.validate
- compute.regions.get
- compute.regions.list
- compute.reservations.get
- compute.reservations.list
- compute.resourcePolicies.get
- compute.resourcePolicies.list
- compute.routers.get
- compute.routers.list
- compute.routes.get
- compute.routes.list
- compute.securityPolicies.get
- compute.securityPolicies.getIamPolicy
- compute.securityPolicies.list
- compute.snapshots.get
- compute.snapshots.getIamPolicy
- compute.snapshots.list
- compute.sslCertificates.get
- compute.sslCertificates.list
- compute.sslPolicies.get
- compute.sslPolicies.list
- compute.sslPolicies.listAvailableFeatures
- compute.subnetworks.get
- compute.subnetworks.getIamPolicy
- compute.subnetworks.list
- compute.targetGrpcProxies.get
- compute.targetGrpcProxies.list
- compute.targetHttpProxies.get
- compute.targetHttpProxies.list
- compute.targetHttpsProxies.get
- compute.targetHttpsProxies.list
- compute.targetInstances.get
- compute.targetInstances.list
- compute.targetPools.get
- compute.targetPools.list
- compute.targetSslProxies.get
- compute.targetSslProxies.list
- compute.targetTcpProxies.get
- compute.targetTcpProxies.list
- compute.targetVpnGateways.get
- compute.targetVpnGateways.list
- compute.urlMaps.get
- compute.urlMaps.list
- compute.urlMaps.validate
- compute.vpnGateways.get
- compute.vpnGateways.list
- compute.vpnTunnels.get
- compute.vpnTunnels.list
- compute.zoneOperations.get
- compute.zoneOperations.getIamPolicy
- compute.zoneOperations.list
- compute.zones.get
- compute.zones.list
- container.apiServices.list
- container.auditSinks.list
- container.backendConfigs.list
- container.bindings.list
- container.certificateSigningRequests.list
- container.clusterRoleBindings.list
- container.clusterRoles.list
- container.clusters.list
- container.componentStatuses.list
- container.configMaps.list
- container.controllerRevisions.list
- container.cronJobs.list
- container.csiDrivers.list
- container.csiNodeInfos.list
- container.csiNodes.list
- container.customResourceDefinitions.list
- container.daemonSets.list
- container.deployments.list
- container.endpointSlices.list
- container.endpoints.list
- container.events.list
- container.frontendConfigs.list
- container.horizontalPodAutoscalers.list
- container.ingresses.list
- container.initializerConfigurations.list
- container.jobs.list
- container.leases.list
- container.limitRanges.list
- container.managedCertificates.list
- container.mutatingWebhookConfigurations.list
- container.namespaces.list
- container.networkPolicies.list
- container.nodes.list
- container.operations.list
- container.persistentVolumeClaims.list
- container.persistentVolumes.list
- container.petSets.list
- container.podDisruptionBudgets.list
- container.podPresets.list
- container.podSecurityPolicies.list
- container.podTemplates.list
- container.pods.list
- container.priorityClasses.list
- container.replicaSets.list
- container.replicationControllers.list
- container.resourceQuotas.list
- container.roleBindings.list
- container.roles.list
- container.runtimeClasses.list
- container.scheduledJobs.list
- container.serviceAccounts.list
- container.services.list
- container.statefulSets.list
- container.storageClasses.list
- container.storageStates.list
- container.storageVersionMigrations.list
- container.thirdPartyObjects.list
- container.thirdPartyResources.list
- container.updateInfos.list
- container.validatingWebhookConfigurations.list
- container.volumeAttachments.list
- container.volumeSnapshotClasses.list
- container.volumeSnapshotContents.list
- container.volumeSnapshots.list
- dns.changes.get
- dns.changes.list
- dns.dnsKeys.get
- dns.dnsKeys.list
- dns.managedZoneOperations.get
- dns.managedZoneOperations.list
- dns.managedZones.get
- dns.managedZones.list
- dns.policies.get
- dns.policies.list
- domains.locations.list
- domains.operations.list
- iam.serviceAccounts.list
- iam.serviceAccountKeys.list
- logging.buckets.list
- logging.exclusions.list
- logging.locations.list
- logging.logEntries.list
- logging.logMetrics.list
- logging.logServiceIndexes.list
- logging.logServices.list
- logging.logs.list
- logging.notificationRules.list
- logging.privateLogEntries.list
- logging.queries.list
- logging.sinks.list
- logging.views.list
- logging.views.listLogs
- logging.views.listResourceKeys
- logging.views.listResourceValues
- networkmanagement.connectivitytests.list
- networkmanagement.locations.list
- networkmanagement.operations.list
- networksecurity.authorizationPolicies.list
- networksecurity.clientTlsPolicies.list
- networksecurity.locations.list
- networksecurity.operations.list
- networksecurity.serverTlsPolicies.list
- networkservices.endpointConfigSelectors.list
- networkservices.httpFilters.list
- networkservices.httpfilters.list
- networkservices.locations.list
- networkservices.operations.list
- resourcemanager.projects.get
- resourcemanager.projects.getIamPolicy
- securitycenter.findings.group
- securitycenter.findings.list
- securitycenter.findings.listFindingPropertyNames
- securitycenter.sources.get
- securitycenter.sources.list
- serviceusage.quotas.get
- serviceusage.services.get
- serviceusage.services.list
- storage.buckets.getIamPolicy
- storage.buckets.list
- storage.objects.getIamPolicy
- cloudkms.cryptoKeys.list
- cloudkms.cryptoKeyVersions.list
- cloudkms.importJobs.list
- cloudkms.keyRings.list
```

- 以下のコマンドを実行しカスタムロールを作成します
```bash linenums="1"
$ gcloud iam roles create RISKEN \
    --organization={your-org} \
    --project={your-project} \
    --file=risken.yaml
```
    - 組織IDの確認方法は[公式ドキュメント](https://cloud.google.com/resource-manager/docs/creating-managing-organization?hl=ja#retrieving_your_organization_id)を参照してください
    - プロジェクト名はの確認方法は[公式ドキュメント](https://cloud.google.com/resource-manager/docs/creating-managing-projects?hl=ja&visit_id=637520764214530521-3717510879&rd=1)を参照してください
