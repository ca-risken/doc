# User Reservation

Users who have just registered with RISKEN are not participating in any projects. Therefore, to access existing project data, they need to be invited as users of the relevant project after their first login.

User reservation is a function that sets the reservation settings of a role for users who are not registered with RISKEN and assigns permissions at the time of login. If the user is already registered with RISKEN, please [invite the user](/risken/user/#_2).

Here we explain how to set up a role reservation.

---

## Performing user reservation

1. Click `IAM > User Reservation` from the left menu on the screen.
    - ![User reservation list](/img/risken/user_reservation.png){style="width:400px"}
2. Click the `NEW` button on the right side of the screen.
3. Enter the following items:
    - **User Key**: A value that identifies the user.
    - **Role**: Select the role to be assigned when the user matching the User Key logs in for the first time (For details on roles, see [Role Settings](/risken/user/#_4)).
4. Click the `RESERVE` button.
5. The registered content will be displayed in the list.

???+ note
    For User Key, set a specific value from the JWT payload containing user information that is set in the request header. Please contact the administrator for the required value.

## Performing User Reservation for Organization

Similar to projects, you can also set role reservation settings for users who are not registered with RISKEN in Organizations and assign permissions when users log in.

1. Click `Org IAM > User Reservation` from the left menu on the screen.
    - ![User reservation list](/img/risken/user_reservation.png){style="width:400px"}
2. Click the `NEW` button on the right side of the screen.
3. Enter the following items:
    - **User Key**: A value that identifies the user.
    - **Role**: Select the role to be assigned when the user matching the User Key logs in for the first time (For details on roles, see [Role Settings](/risken/user/#_9)).
4. Click the `RESERVE` button.
5. The registered content will be displayed in the list.
