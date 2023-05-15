# Alert
In RISKEN, we have implemented a feature that generates alerts and sends notifications when problematic data is discovered. This section explains how to operate alerts.

---
## Checking Alerts
1. By setting the [alert conditions](#_3) in advance, you can check the problematic areas on the alert screen.
2. To check the generated alerts, click Alert > Alert from the left menu.
3. The currently active alerts will be displayed.
    - ![alert_list.png](/img/risken/alert_list.png){style="width:600px"}
    - You can filter the alerts using the text box.
    - By unchecking Active Only, you can view past alerts.
4. To view the details of an alert, click on the data in the list.
    - ![alert_dialog.png](/img/risken/alert_dialog.png){style="width:600px"}
    - Links to Findings that match the alert conditions will be displayed.
    - At the bottom of the screen, you can check the update history of the alert.

---
## Setting Alerts
1. By setting the **alert conditions** in advance, you can automatically determine and notify alerts during data collection.
2. You can register multiple alert rules and notification destinations for alert conditions.
    - Before creating an alert condition, set up the rules and notifications first.

### Setting Alert Rules
1. Click Alert > Rule in the left menu.
2. Click NEW on the right side of the screen.
3. Fill in the following items and click REGIST.
    - **Name**: Alert name
    - [Finding filter conditions]
        - **ResourceName**: Resource name (partial match)
        - **Tag**: Tag name
    - **FindingCount**: The number of Findings that match the above filter conditions
    - **Score**: Finding score (specify the minimum points)
    - ![alert_rule.png](/img/risken/alert_rule.png){style="width:600px"}

### Setting up Notification Destination
1. Click on `Alert > Notification` on the left menu
2. Click on `NEW` on the right side of the screen
3. Enter the following information and click on `REGIST`:
    - **Name**: Notification name
    - **Type**: Currently only supports `Slack`
    - **Webhook URL**: Specify the Webhook URL created with [Incomming Webhook](https://api.slack.com/messaging/webhooks)
        - Notifications will be sent with the channel/icon/name specified in Incomming Webhook
    - **Show Options**: Check to display option settings
    - **Custom Message**: Override the default notification message
        - Default is `@xxxx Alert occurred`
        - `@xxxx` changes depending on the severity set
            - `High`: @channel
            - `Medium`: @here
            - `Low`: No mention
    - **Channel** (Depricated): Specify the channel to receive the notification. Currently a deprecated setting.
    - ![alert_notification.png](/img/risken/alert_notification.png){style="width:600px"}

### Setting up Alert Conditions
1. Click on `Alert > Condition` on the left menu
2. Click on `NEW` on the right side of the screen
3. Enter the following information in the Alert Condition dialog and click on `REGIST`:
    - **Description**: Description of the alert
    - **Severity**: Select the severity level
        - **High**: The most critical level. Mentioned with `@channel` when notifying
        - **Medium**: Intermediate level. Mentioned with `@here` when notifying
        - **Low**: INFO level. No mention when notifying
    - **And Or**: Specify the evaluation method when setting multiple alert rules
        - **And**: Generates an alert if all rules are `true`
        - **Or**: Generates an alert if any one or more rules are `true`
    - **Notification Cache Term**: A setting to suppress alert notifications. Notifications will not be sent continuously within the specified period
        - Default is 1 hour
    - **Enabled**: Switch the alert condition on/off
    - **Alert Rule**: Select the rules you want to enable (multiple)
    - **Notification Rule**: Select the notification destinations you want to enable (multiple)
    - ![alert_condition.png](/img/risken/alert_condition.png){style="width:600px"}

---
## Alert Exclusion Settings

After RISKEN performs regular data source scans, it evaluates and generates alerts based on registered alert conditions. However, you can exclude alerts from the evaluation target by performing the following operation.

### Setting an Alert to `Pending` status
- If there is an alert in `Pending` status, notifications for that alert condition will not be sent.
    - Only the history data of the alert will be saved.
    - When the problem is resolved and the alert status becomes `Deactive`, new alerts will be generated.
    - *Alert lifecycle: `Active` <-> `Pending` (manually updated) -> `Deactive`
- You can set an alert to `Pending` status by performing the following operation.
    - Go to the `Alert > Alert` screen.
    - Click on `Pending` from the action button on the right side of the list.
    - ![alert_condition.png](/img/risken/alert_pend.png){style="width:600px"}

### Setting a Finding to `Pending` status
- Findings that are known to have no issues can be excluded from alert evaluation by setting them to `Pending` status.
- You can set a Finding to `Pending` status by performing the following operation.
    - Go to the `Finding > Finding` screen.
    - Click on `Pend Finding` from the action button on the right side of the list.
    - ![finding_pend.png](/img/risken/finding_pend.png){style="width:600px"}
    - You can also set multiple findings to `Pending` status at once.
    - For details, please refer to [Deleting/Pending Findings](/risken/finding/#_4).
