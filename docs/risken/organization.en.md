# Organization

The Organization feature allows you to centrally manage risks and permissions scattered across multiple Projects. Organization permissions are managed by a separate "Organization IAM."
For details about Organization IAM, please refer to [Organization IAM :octicons-link-external-24:](/en/risken/user/#_7){ target="_blank" }.

## How to Use Organization

---

### Switching to Organization Mode

**Switch to Organization Mode**

1. While in Project Mode, click the `Organization Mode` button from the dropdown menu at the top right of the screen.
    - ![OrganizationMode](/img/risken/organization_mode.png){style="width:300px"}
2. If the switch is successful, the `P` in the top menu will change to `O`, and you will be redirected to the Project invitation screen.
    - ![Project Invitation Screen](/img/risken/project_invitation.png){style="width:400px"}

**Switch to Project Mode**

1. While in Organization Mode, click the `Project Mode` button from the dropdown menu at the top right of the screen.
    - ![ProjectMode](/img/risken/project_mode.png){style="width:300px"}
2. Once the switch is complete, the `O` in the top menu will change to `P`, and you will be redirected to the Project dashboard screen.
    - ![RISKEN Top](/img/risken/top.png){style="width:400px"}

---

### Creating a New Organization

1. Click the `O` button in the top menu.
    - ![Organization Button](/img/risken/organization_btn.png){style="width:300px"}
2. In the Organization dialog, click the `CREATE NEW ORGANIZATION` button.
    - ![Organization Dialog](/img/risken/organization_dialog.png){style="width:350px"}
3. On the Organization creation screen, enter the Organization name and an optional description, then click `CREATE`.
4. Once created, the Organization name will appear in the `O` section of the top menu, and you will be redirected to the Organization invitation screen.
    - ![Project Invitation Screen](/img/risken/project_invitation.png){style="width:400px"}

---

### Editing an Organization

1. Click the `O` button in the top menu.
    - ![Organization Button](/img/risken/organization_btn.png){style="width:300px"}
2. In the Organization dialog, click the `Edit ORGANIZATION` button.
3. The Organization edit screen will be displayed.
    - ![Organization Edit](/img/risken/organization_edit.png){style="width:400px"}
4. To change the Organization name or description, edit the `Name` or `Description` fields and click the `Save` button.

---

### Deleting an Organization

To delete an Organization, follow the steps below.

???+ warning
    Please note that once an Organization is deleted, it may not be recoverable.

1. Click the `O` button in the top menu.
    - ![Organization Button](/img/risken/organization_btn.png){style="width:300px"}
2. In the Organization dialog, click the `Edit ORGANIZATION` button.
3. The Organization edit screen will be displayed.
    - ![Organization Edit](/img/risken/organization_edit.png){style="width:400px"}
4. Click the `Delete` button.


## Inviting Projects to an Organization
To centrally manage Projects in an Organization, invite Projects to the Organization. Projects can join the Organization by accepting or rejecting the invitation.

---

### Checking Invitation Status

You can check invitations on the Project Invitation or Organization Invitation screens.

![Project Invitation Screen](/img/risken/project_invitation_status.png){style="width:400px"}

- You can check the status of invitations in the Status column:
    - `PENDING`: Awaiting response
    - `ACCEPTED`: Accepted
    - `REJECTED`: Rejected
- You can check the project membership status in the Membership column:
    - `Joined`: The project belongs to the Organization
    - `Not Joined`: The project does not belong to the Organization

---

### Sending an Invitation

1. In **Organization Mode**, click `Organization > Project Invitation` from the left menu.
    - ![Project Invitation Screen](/img/risken/project_invitation.png){style="width:400px"}

2. Click the `NEW` button on the right side of the screen.

3. The Project dialog will appear. Click the project you want to invite.
    - ![Project Dialog](/img/risken/project_invitation_dialog.png){style="width:400px"}

4. The invitation will be sent, and the status will become `PENDING`.
    - ![Project Invitation Screen](/img/risken/project_invitation_pending.png){style="width:400px"}

???+ note
    You can only invite Projects for which you have access rights. Also, if the Organization and Project are already linked, you cannot send a new invitation.

---

### Deleting a Project Invitation

Organizations can delete invitations they have sent.

1. In **Organization Mode**, on the Project Invitation screen, click the `Delete Invitation` button in the Action column of the invitation you want to delete.
    - ![Delete Invitation Button](/img/risken/project_invitation_delete.png){style="width:400px"}

2. Click `OK` in the confirmation dialog.

3. The invitation will be deleted.
    - ![Project Invitation Screen](/img/risken/project_invitation.png){style="width:400px"}

???+ note
    If you delete an invitation with the status ACCEPTED, the link with the Project will also be removed.


---

### Project Accepts or Rejects an Invitation

A Project that receives an invitation from an Organization can decide to join or not join the Organization by accepting or rejecting the invitation.

1. In **Project Mode**, click `Project > Organization Invitation` from the left menu to go to the Organization Invitation screen.
    - ![Organization Invitation Screen](/img/risken/organization_invitation.png){style="width:300px"}

2. In the `Action` column of the invitation you want to accept or reject, select `Accept Invitation` or `Reject Invitation`.
    - ![Reply Button](/img/risken/organization_invitation_reply.png){style="width:300px"}

3. Click `OK` in the confirmation dialog.

4. The invitation process will be completed:
    - If accepted: The Organization will join the Project, and the invitation status will become `ACCEPTED`.
    - ![Organization Invitation Screen](/img/risken/organization_invitation_accept.png){style="width:300px"}
    - If rejected: The invitation status will become `REJECTED`.
    - ![Organization Invitation Screen](/img/risken/organization_invitation_reject.png){style="width:300px"}

???+ note
    You can change your decision to accept or reject the invitation later.
---
