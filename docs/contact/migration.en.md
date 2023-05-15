# Migration Guide

[Migration to v0.5.0](#v050)  
[Migration to v0.4.0](#v040)

---
## Migration to v0.5.0
With the addition of the user reservation function in `v0.5.0`, there are changes to the database.

### Migration Procedure
Follow the steps below to migrate.

### Modify Existing Tables
Run the following command to add a column to the user table.
```mysql
ALTER TABLE user ADD user_idp_key varchar(255) NULL;
alter table user add constraint uidx_user_idp_key unique(user_idp_key);
```

## Migration to v0.4.0
There are changes to the tables used in the Code service in `v0.4.0`.

### Migration Procedure
Follow the steps below to migrate.

#### Connect to the mysql in the database container
If you are building it on a local machine, execute the following command to connect to the database.
```shell
kubectl -n middleware exec -it db-0 -- mysql -uroot -Dmimosa --default-character-set=utf8
```

If you are building the system in another environment, connect to the database according to your environment.

#### Add new tables
Run the following command to add new tables.

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

#### Migrating existing data to a new table
Execute the following command to migrate data from an existing table to a new table:
```mysql
insert into code_github_setting (code_github_setting_id, name, project_id, type, base_url, target_resource, github_user, personal_access_token, created_at, updated_at)
select gitleaks_id, name, project_id, type, base_url, target_resource, github_user, personal_access_token, created_at, updated_at from code_gitleaks

insert into code_gitleaks_setting (code_github_setting_id, code_data_source_id, project_id, repository_pattern, scan_public, scan_internal, scan_private, status, scan_at, status_detail, created_at, updated_at)
select gitleaks_id, code_data_source_id, project_id, repository_pattern, scan_public, scan_internal, scan_private, status, scan_at, status_detail, created_at, updated_at from code_gitleaks

insert into code_github_enterprise_org (code_github_setting_id, organization, project_id, created_at, updated_at)
select gitleaks_id, login, project_id, created_at, updated_at from code_enterprise_org
```

#### Deleting an existing table
Execute the following command to delete an unnecessary table:
```mysql
DROP TABLE code_gitleaks

DROP TABLE code_enterprise_org
```
