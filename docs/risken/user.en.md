# User

When you log in to RISKEN, you are automatically registered as a user. However, new users who have just registered will not see anything because they are not participating in any projects.

To view anything, you need to either create a new project or be invited to an existing project. Here, we will explain how to invite a user who is already logged into RISKEN to an existing project.

For information on how to assign permissions to users who have never logged into RISKEN, please see [User Reservation](/risken/user_reservation/#_2).

---

## Inviting Users to a Project

1. Select the project you want from the menu on the screen using the `P` button.
2. Click `IAM > User` from the left menu.
    - ![User List](/img/risken/user_list.png){style="width:300px"}
3. Click the `NEW` button on the right side of the screen.
4. When the user dialog opens, click `INVITE NEW USER` in the upper right corner.
    - ![User Invitation](/img/risken/user_invite.png){style="width:300px"}
5. Search for and select the person you want to invite.
6. When you return to the user dialog, check the role you want to grant and click the `EDIT` button.
    - ![User Dialog](/img/risken/user_dialog.png){style="width:300px"}

???+ note
    If the user you want to invite does not exist, the target user may not have logged in yet. Please ask them to log in and search again in the user dialog.

---

## Assigning Roles to Users

1. Click `IAM > User` from the left menu.
2. The user screen displays users who are already participating in the project.
    - Select the user you want to assign a role to.
    - If the target user does not exist, invite them using [Add Users](/risken/user/#_2).
3. The created roles are displayed, so set the role you want to grant.
    - ![User Dialog](/img/risken/user_dialog.png){style="width:350px"}

???+ note
    By default, a role/policy for `project_admin` is created when a project is created. If you want to allow or control read-only rights or partial functionality, see the next step, [Setting up detailed roles](/risken/user/#_4).

---

## Setting Detailed Roles

You can set detailed roles such as allowing only specific functions within the project.
Before creating a role, you need to set the **policy** that is associated with the role.

- **Policy** defines what operations (actions) are allowed for data (resources).
- It is possible to set multiple policies for a single role.

### Policy Setting

1. Click `IAM > Policy` on the left menu.
2. Click `NEW` on the right side of the screen.
    - ![Policy](/img/risken/user_policy.png){style="width:350px"}
3. Enter the following in the policy dialog and click `REGIST`.
    - **Name**: Policy name
    - **Action Pattern**: Action name pattern
        - For example, set `(get|list|describe|show)` for the ReadOnly action.
    - **Resource Pattern**: Resource name pattern
        - *Currently, detailed control using resource patterns is not supported. Therefore, please specify `.*` in the Resource field. (Control will be uniformly at the project level.)

### Role Setting

1. Click `IAM > Role` on the left menu.
2. Click `NEW` on the right side of the screen.
3. Enter the following in the role dialog and click `REGIST`.
    - **Name**: Role name
    - **Policy**: Select the policy you want to associate with the role.
    - ![Role dialog](/img/risken/user_role_dialog.png){style="width:350px"}
