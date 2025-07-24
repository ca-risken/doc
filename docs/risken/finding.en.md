# Finding
RISKEN stores and uses all security risk data in the format of Findings. Here we explain how to operate with Finding data.

---

## Search

1. Click `Finding > Finding` from the left menu.
2. All collected Findings (data collected by various scanners) are displayed in a list.
    - ![Finding list](/img/risken/finding_list.png){style="width:400px"}
    - Findings show the risk score, data source information, resource name, tag information, etc.
3. Click on a row in the list to view the details.
    - ![Finding detail](/img/risken/finding_detail.png){style="width:400px"}
4. The Finding list screen supports the following search filters:
    - **ResourceName**: Resource name (partial match)
    - **Tag**: Tag (Specify the `aws` tag, for example, to filter data related to AWS.)
    - **DataSource**: Data source (partial match. A label that identifies where the Finding was collected from)
    - **Score**: Score (0.0 ~ 1.0)
5. In addition, it is possible to search by resource name level on the Resource screen (`Finding > Resource`).
    - In addition to the above filters, you can filter by the registration date of the resource (From-To specification on the calendar).
    - ![Finding Resource](/img/risken/finding_resource.png){style="width:400px"}

---

## Scoring

Findings always have a `score` set. Although there is variation in the score evaluation for all data sources, when registered in RISKEN, it is standardized to a number between `0.0 ~ 1.0`. The score helps filter high-risk data and support decision-making for prioritization.

### Score Bands

RISKEN distinguishes Severity and color-coding based on the following bands:

???+ inline end "Details"
    For detailed score judgment for each data source, please refer to the page for each data source.

| Score       | Severity                           | Description                                                            |
| :---------- | :--------------------------------- | :--------------------------------------------------------------------- |
| `0.8 ~ 1.0` | :material-alert:                High | Indicates danger. Check immediately and take action before an incident occurs if necessary. |
| `0.4 ~ 0.7` | :material-check-circle-outline:  Medium | Check when you have time, not immediately. |
| `0.0 ~ 0.3` | :material-cancel:               Low | It is safe to ignore. Check if you are concerned. |

## ChatGPT Assist Feature

When you open the modal screen for detailed findings, you will see the `Summarize with ChatGPT` button in the upper right corner.

![ChatGPT](/img/risken/finding_openai.png){style="width:500px"}

???+ warning "ChatGPT feature is optional"
    To use the ChatGPT feature, you need an API token from OpenAI.
    The API token mentioned needs to be loaded into the `OPEN_AI_TOKEN` variable on the server side. (For more details on parameters, click [here](/admin/param_core/))
    Please contact your system administrator for more information.

- Clicking the button will provide translations, summaries, and recommended actions for security issues.
- If there are specialized terms involved, it may take time for anyone other than security specialists to understand.
- ChatGPT will assist in understanding through summarization.
    - However, it is necessary to verify the proposed actions as it is dangerous to completely trust AI-generated content.
- Additionally, due to security concerns like the following, several constraints have been put in place:
    - Only a part of the finding data will be sent, and any information that may reveal the cloud environment will be excluded as much as possible.
        - However, according to OpenAI's [policy](https://openai.com/policies/api-data-usage-policies), data sent via the API will not be used for model training.
    - The prompts will be generated on the server side.
        - This is done considering security threats such as prompt injection and jailbreaking for LLM, as described in the [Prompt Engineering Guide](https://github.com/dair-ai/Prompt-Engineering-Guide/blob/main/guides/prompts-adversarial.md).

---

## Deletion/Pending

When you have fixed an issue detected in Finding, one of the following actions is necessary:

1. Leave it alone
    - If the state changes and the score of Finding itself decreases, no action is required.
    - This applies in most cases.

2. Deletion
    - If the problem has been resolved but the score of Finding itself does not decrease, delete Finding itself.
    - If you thought you had resolved the problem but there was still an issue, a new Finding will be generated at the next data collection timing.

3. Pending
    - If you determine that the Finding does not require any action, mark it as pending (risk acceptance).
    - Pending Findings are excluded from the evaluation of alerts.

???+ inline end "Hint!"
    You can perform "Deletion" or "Pending" from the menu on the right side of the Finding list.

![Finding Actions](/img/risken/finding_action.png){style="width:400px"}


### Bulk Update

To update Findings in bulk, follow these steps:

- Filter the list to the desired Finding to be updated.
- Select the targets to be updated with the checkboxes on the left side of the list.
- From the menu on the upper right of the screen, select either:
    - Bulk Deletion
    - Bulk Pending

![Finding Selection](/img/risken/finding_selected.png){style="width:400px"}

---

## Tag

From the detailed dialog of Finding, you can set tags for Finding by clicking the `NEW TAG` button. Tags can be used for filtering and alert conditions.

---

## Settings

You can configure settings related to Finding from `Finding > Settings`.

### Score Adjustment

Fine-grained score adjustment is possible by resource name. You can increase the score for important resources in your project or decrease the score for less important ones. However, the score always falls within the range of `0.0 to 1.0` (if exceeded, the minimum or maximum value is set).

- Open `Finding > Settings`.
- Click on `new` on the right side of the screen.
- Set the target resource name (prefix match) and score coefficient.
    - If you set a coefficient greater than `1.0`, the actual score will be higher than the base score.
    - If you set a coefficient smaller than `1.0`, the actual score will be lower than the base score.

![Finding Setting](/img/risken/finding_setting.png){style="width:400px"}
