# Migration Guide

---

## v0.4.0未満のバージョンからv0.4.0への移行

`v0.4.0`にて、Codeサービスで使用するデータベースのテーブルに変更があります

### 移行手順
以下の手順に従って、移行を行ってください

#### データベースコンテナ内のmysqlへの接続
ローカルマシーンで構築している場合、以下のコマンドを実行してデータベースへ接続します
```shell
kubectl -n middleware exec -it db-0 -- mysql -uroot -Dmimosa --default-character-set=utf8
```

その他の環境でシステムを構築している場合、環境に合わせてデータベースへ接続してください

#### 新規テーブルの追加
以下のコマンドを実行して、新規テーブルを追加します
```mysql
CREATE TABLE code_github_setting (
  code_github_setting_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  project_id INT UNSIGNED NOT NULL,
  name VARCHAR(64) NULL,
  github_user VARCHAR(64) NULL,
  personal_access_token VARCHAR(255) NULL,
  type ENUM('UNKNOWN_TYPE', 'ENTERPRISE' ,'ORGANIZATION', 'USER') NOT NULL DEFAULT 'UNKNOWN_TYPE',
  base_url VARCHAR(128) NULL,
  target_resource VARCHAR(128) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(code_github_setting_id),
  UNIQUE KEY uidx_code_github_setting (name, project_id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin AUTO_INCREMENT = 1001;

CREATE TABLE code_gitleaks_setting (
  code_github_setting_id INT UNSIGNED NOT NULL,
  project_id INT UNSIGNED NOT NULL,
  code_data_source_id INT UNSIGNED NOT NULL,
  repository_pattern VARCHAR(128) NULL,
  scan_public ENUM('false', 'true') NOT NULL DEFAULT 'true',
  scan_internal ENUM('false', 'true') NOT NULL DEFAULT 'true',
  scan_private ENUM('false', 'true') NOT NULL DEFAULT 'false',
  status ENUM('UNKNOWN', 'OK' ,'CONFIGURED', 'IN_PROGRESS', 'ERROR') NOT NULL DEFAULT 'UNKNOWN',
  status_detail VARCHAR(255) NULL,
  scan_at DATETIME NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(code_github_setting_id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE code_github_enterprise_org (
  code_github_setting_id INT UNSIGNED NOT NULL,
  organization VARCHAR(128) NOT NULL,
  project_id INT UNSIGNED NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(code_github_setting_id, organization)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE code_dependency_setting (
  code_github_setting_id INT UNSIGNED NOT NULL,
  project_id INT UNSIGNED NOT NULL,
  code_data_source_id INT UNSIGNED NOT NULL,
  status ENUM('UNKNOWN', 'OK' ,'CONFIGURED', 'IN_PROGRESS', 'ERROR') NOT NULL,
  status_detail VARCHAR(255) NULL,
  scan_at DATETIME NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(code_github_setting_id)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
```

#### 既存のデータを新規テーブルへ移行する
以下のコマンドを実行して、既存のテーブルからデータを新規テーブルへ移行します
```mysql
insert into code_github_setting (code_github_setting_id,name,project_id,type,base_url,target_resource,github_user,personal_access_token,created_at,updated_at)
select gitleaks_id,name,project_id,type,base_url,target_resource,github_user,personal_access_token,created_at,updated_at from code_gitleaks

insert into code_gitleaks_setting ( code_github_setting_id,code_data_source_id,project_id,repository_pattern,scan_public,scan_internal,scan_private,status,scan_at,status_detail,created_at,updated_at)
select gitleaks_id,code_data_source_id,project_id,repository_pattern,scan_public,scan_internal,scan_private,status,scan_at,status_detail,created_at,updated_at from code_gitleaks

insert into code_github_enterprise_org (code_github_setting_id,organization,project_id,created_at,updated_at)
select gitleaks_id,login,project_id,created_at,updated_at from code_enterprise_org
```

#### 既存のテーブルの削除
以下のコマンドを実行して、不要となったテーブルを削除します
```mysql
DROP TABLE code_gitleaks

DROP TABLE code_enterprise_org
```