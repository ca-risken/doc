# Access Token
To access data on RISKEN from a program, you need an access token. This section explains how to issue a new access token and access the API.

---
## Issuing an Access Token
1. Select the target project from the P button on the menu at the top of the screen
2. Click IAM > AccessToken from the left menu
    - ![Access Token List](/img/risken/access_token_list.png){style="width:400px"}
3. Click the NEW button on the right side of the screen
4. Enter the following items:
    - ***Name***: Access token name
    - ***Description***: Description (purpose of the token, etc.)
    - ***ExpiredAt***: Token expiration date
    - ***Role***: Select the role to grant to the access token (for details on roles, see [Role Settings](/risken/user/#_4))
5. Click the REGIST button
    - ![Access Token Dialog](/img/risken/access_token_dialog.png){style="width:400px"}
6. When the access token is displayed, be sure to make a note of it and keep it safe
    - ![New Token](/img/risken/new_token.png){style="width:300px"}
???+ note
    Access tokens are only displayed once when first issued and cannot be viewed again afterwards.

---
## Accessing the API with an Access Token
1. Prepare a valid access token
    - Make sure the access token has the appropriate role assigned
    - Check that the access token has not expired
    - Ensure that there is at least one member (token administrator) in the project associated with the access token
2. Use curl:
```bash
$ curl -XGET \
    --header 'Authorization: Bearer {your-token-here}' \
    'https://{your-site}/api/v1/iam/list-user/?activated=true'
```
???+ warning
    For details of the API endpoint ({your-site}), please contact your system administrator.
    If you cannot access the API using the above steps, there may be ACL settings such as IP restrictions on the API endpoint, or authentication methods other than tokens may be set.
    Please check with your system administrator for details.

---
## Detecting Access Token Expiration
When an access token expires, the target token is registered as a Finding with a score of `0.8`. 
To receive notifications, set the appropriate conditions in the [Alert Settings](/risken/alert/#_3) and configure the notification destination as well.
Below is an example of alert conditions to detect access token expiration:

- **Score**: 0.8
- **Tag**: `access-token`
???+ note "Default Alert Conditions"
    When creating a project, an alert condition with a score of 0.8 or higher is registered by default, so access token expiration alerts are included in the default conditions.
    
    ＊However, even if you use the default conditions, you still need to set up the notification destination separately.

---
## API Reference
For more details on the API, please refer to the [API Reference](/reference/api/)
