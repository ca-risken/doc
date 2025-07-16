# Organization

Organizationは複数のProjectに散らばったリスク・権限を一元管理するための機能です。Organizationとは異なる「Organization IAM」によって権限管理されます。
Organization IAMについては[Organization IAM :octicons-link-external-24:](/risken/user/#_7){ target="_blank" }をご確認ください。

## Organizationの使用方法

---

### Organizationへの切り替え

**Organization Modeに切り替える**

1. Project Modeのとき、画面右上のプルダウンメニューより、 `Organization Mode` ボタンをクリックします
    - ![OrganizationMode](/img/risken/organization_mode.png){style="width:300px"}
2. 切り替えに成功すると上メニューの `P` 部分が `O` に切り替わり、Projectの招待画面に遷移します
    - ![プロジェクト招待画面](/img/risken/project_invitation.png){style="width:400px"}

**Project Modeに切り替える**

1. Organization Modeのとき、画面右上のプルダウンメニューより、 `Project Mode` ボタンをクリックします
    - ![ProjectMode](/img/risken/project_mode.png){style="width:300px"}
2. 作成が完了すると上メニューの `O` 部分が `P` に切り替わり、Projectのダッシュボード画面に遷移します
    - ![RISKENトップ](/img/risken/top.png){style="width:400px"}

---

### Organization新規作成

1. 画面上メニューの `O` ボタンをクリックします
    - ![Organizationボタン](/img/risken/organization_btn.png){style="width:300px"}
2. Organizationダイアログで `CREATE NEW ORGANIZATION` ボタンをクリックします
    - ![Organizationダイアログ](/img/risken/organization_dialog.png){style="width:350px"}
3. Organization作成画面でOrganizationの名前、説明(任意)を入力して `CREATE` をクリックします
4. 作成が完了すると上メニューの `O` 部分にOrganizationの名前が表示され、Organizationの招待画面に遷移します
    - ![Project招待画面](/img/risken/project_invitation.png){style="width:400px"}

---

### Organizationの編集

1. 画面上メニューの `O` ボタンをクリックします
    - ![Organizationボタン](/img/risken/organization_btn.png){style="width:300px"}
2. Organizationダイアログで `ORGANIZATION編集` ボタンをクリックします
3. Organizationの編集画面が表示されます
    - ![Organization編集](/img/risken/organization_edit.png){style="width:400px"}
4. Organizationの名前、説明の変更をする場合は、 `名前`または`説明`を編集し、 `保存` ボタンをクリックしてください

---

### Organizationの削除

Organizationを削除する場合は以下の手順で実施してください。

???+ warning
    Organizationを削除してしまった場合、元に戻せなくなる可能性があるので注意してください。

1. 画面上メニューの `O` ボタンをクリックします
    - ![Organizationボタン](/img/risken/organization_btn.png){style="width:300px"}
2. Organizationダイアログで `ORGANIZATION編集` ボタンをクリックします
3. Organizationの編集画面が表示されます
    - ![Organization編集](/img/risken/organization_edit.png){style="width:400px"}
4. `削除` ボタンをクリックします


## プロジェクトをOrganizationに招待する
OrganizationでProjectを一元管理するにはProjectをOrganizationに招待します。Projectはその招待を承認または拒否することでOrganizationへの所属ができます。

---

### 招待のステータスを確認する

招待はProject招待、またはOrganization招待画面で確認できます

![Project招待画面](/img/risken/project_invitation_status.png){style="width:400px"}

- ステータス列で招待の状態を確認できます
    - `PENDING`: 返答待ち
    - `ACCEPTED`: 承認済み
    - `REJECTED`: 拒否済み
- 所属列でプロジェクトの所属ステータスを確認できます
    - `所属中`: プロジェクトがOrganizationに所属済み
    - `未所属`: プロジェクトがOrganizationに所属していない

---

### 招待を送信する

1. **Organization Mode時** に左メニューから `Organization > Project招待` をクリックします
    - ![Project Invitation 画面](/img/risken/project_invitation.png){style="width:400px"}

2. 画面右側にある `NEW` ボタンをクリックします

3. Projectダイアログが表示されるので、招待したいプロジェクトをクリックします
    - ![Projectダイアログ](/img/risken/project_invitation_dialog.png){style="width:400px"}

4. 招待が送信され、ステータスが `PENDING` になります
    - ![Project Invitation 画面](/img/risken/project_invitation_pending.png){style="width:400px"}

???+ note
    招待は自分がアクセス権限を持つProjectのみに行えます。また、既にOrganizationとProjectが関連付けられている場合、新しい招待は送信できません

---

### プロジェクトへの招待を削除する

Organizationは送信した招待を削除することができます。

1. **Organization Mode時** にProject招待画面で削除したい招待の行のアクション列の `招待を削除する`　ボタンをクリックします
    - ![招待削除ボタン](/img/risken/project_invitation_delete.png){style="width:400px"}

2. 確認ダイアログで `OK` をクリックします

3. 招待が削除されます。
    - ![Project招待画面](/img/risken/project_invitation.png){style="width:400px"}

???+ note
    ステータスがACCEPTEDである招待を削除するとProjectとの関連も解除されます


---

### プロジェクトが招待を承認または拒否する

Organizationから招待を受け取ったProjectは、招待を承認または拒否することでOrganizationへの参加/不参加を決定できます。

1. **ProjectMode時** に左メニューから `Project > Organization招待` をクリックし、Organization招待画面に遷移します。
    - ![Organization招待画面](/img/risken/organization_invitation.png){style="width:300px"}

2. 承認または拒否したい招待の行の `アクション` 列で`招待を承認する`または`招待を拒否する`を選択します。
    - ![返答ボタン](/img/risken/organization_invitation_reply.png){style="width:300px"}

3. 確認ダイアログで `OK` をクリックします

4. 招待の処理が完了します
    - 承認した場合：OrganizationがProjectに参加し、招待のステータスが `ACCEPTED` になります
    - ![Organization招待画面](/img/risken/organization_invitation_accept.png){style="width:300px"}
    - 拒否した場合：招待のステータスが `REJECTED` になります
    - ![Organization招待画面](/img/risken/organization_invitation_reject.png){style="width:300px"}

???+ note
    招待の承認・拒否の選択は後から変更することができます
---
