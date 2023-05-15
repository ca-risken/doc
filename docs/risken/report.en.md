# Report

You can report how the data collected by RISKEN changes day by day.

- You can report the total number of issues or score changes over time.
- You can compare where and how many problems exist or do not exist, or how they differ from other projects.
- This also visualizes the achievements of on-site developers or security personnel.

???+ note
    Maintaining security in an environment where development is constantly changing requires a great deal of effort.
    Visualization is also important in that respect.

---

## Dashboard

The `Dashboard` screen visualizes the current status of the project.

![Dashboard](/img/risken/report_dashboard.png){style="width:500px"}

### Status

The status is displayed at the top of the `Dashboard` screen.

- `Project Status`: Indicates the overall status of the project.
    - `Status` is determined by the following three factors:
        1. Are there any remaining alerts?
        2. Are high-scoring findings (0.8 or higher) left unattended?
        3. Is the project adequately configured?
- `Alert (Red)`: If there are currently active alerts, the count is displayed.
    - Clicking takes you to the `Alert > Alert` screen.
- `Finding (Blue)`: If there are high-scoring (0.8 or higher) findings, the count is displayed.
    - Clicking takes you to the `Finding > Finding` screen.
- `Configuration Status (Gray)`: Indicates the degree to which the project is adequately configured in %.
    - Clicking displays the details of the configuration status in a dialog.

### Category

The center of the `Dashboard` screen displays the problem areas for each category (such as data sources).
Clicking takes you to the corresponding screen.

### Chart

The bottom of the `Dashboard` screen displays a graph.
It shows the registration status of findings and the percentage of current alerts by severity.

---

## Report

On the `Report > ReportFinding` screen, you can display/download statistical data for findings.

![ReportFinding](/img/risken/report_finding.png){style="width:500px"}

### Download

- Go to the `Report > ReportFinding` screen.
- Select DataSource, Score, Period, and File format.
- Click **DOWNLOAD REPORT(PROJECT)** to download statistical data for the currently selected project.

### Customization of visualization

To freely customize the visualization of statistical data, it is convenient to use BI tools such as [Google Data Studio](https://support.google.com/datastudio/answer/6283323).

=== "Data Portal Sample 1"

    ![Data Portal 1](/img/risken/report_data_portal1.png){style="width:500px"}

=== "Data Portal Sample 2"

    ![Data Portal 2](/img/risken/report_data_portal2.png){style="width:500px"}
