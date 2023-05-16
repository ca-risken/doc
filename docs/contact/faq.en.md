# FAQ

Error occurs during WPScan scan
-------------------
If you see the error message "Failed exec WPScan Ask the system administrator." during the scan, please check the following:

1. Make sure that the site you are scanning is created with WordPress.
2. Make sure that RISKEN is allowed to communicate with the site to be scanned.
    - You need to allow communication from RISKEN's IP address.
    - If any controls, such as BASIC authentication, are in place, scanning may not be possible.
3. Communication with the target site may be filtered by a WAF (Web Application Firewall).
    - Enabling the following setting in `Setting Detail` may make scanning possible:
        - Check the `Use a random user-agent for each scan` box.
4. If you have changed the `wp-content` directory from the default directory during WordPress installation,
    - Enabling the following setting in `Setting Detail` may make scanning possible:
        - Enter the changed directory in the `The wp-content dirctory` text box.
5. For other cases,
    - Enabling the following setting in `Setting Detail` may make scanning possible:
        - Check the `Do not check if the target is running WordPress or returns a 403` box.
        - In addition, even if you have not changed the `wp-content` directory during installation, you may be able to resolve the issue by entering `wp-content` in the setting in step 3.
6. If the issue persists or a different error is displayed,
    - Please contact your system administrator.
