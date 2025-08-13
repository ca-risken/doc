# Report

You can report how the data collected by RISKEN changes day by day.

- You can report the total number of issues or score changes over time.
- You can compare where and how many problems exist or do not exist, or how they differ from other projects.
- This also visualizes the achievements of on-site developers or security personnel.

???+ note
    Maintaining security in an environment where development is constantly changing requires a great deal of effort.
    Visualization is also important in that respect.

---

## Report

The `Analysis > Report` screen allows you to create project reports.

![Report](/img/risken/report_report.png){style="width:1200px"}

### AI-powered Automatic Report Generation

- Navigate to the `Analysis > Report` screen
- Click the `NEW` button at the top of the list

![Report](/img/risken/report_new.png){style="width:300px"}

- In the dialog, enter the following items:
    - **Name**: Name of the report
    - **DataSource**: Select the data source for the report
    - **Base Score**: Set the base score
    - **Prompt**: Enter a prompt to generate the report content
- After entering the information, click the `CREATE AUTO` button

![Report](/img/risken/report_ai.png){style="width:500px"}

- To create a report manually instead of using AI generation, click the `CREATE EMPTY REPORT` button

### Editing Reports

- Navigate to the `Analysis > Report` screen
- Select the target report
- Choose the `Edit` tab from the right panel or click the `>` button

![Report](/img/risken/report_edit.png){style="width:600px"}

- Edit the report content
- After editing, click the `SAVE` button

![Report](/img/risken/report_edit_save.png){style="width:600px"}

- You can switch between preview and edit modes using the `<` and `>` buttons while editing

### Downloading PDF

- Navigate to the `Analysis > Report` screen
- Select the target report
- Click the `DOWNLOAD PDF` button from the right panel

![Report](/img/risken/report_pdf.png){style="width:800px"}

---

## Finding Summary

On the `Analysis > Finding Summary` screen, you can display/download statistical data for findings.

![ReportFinding](/img/risken/report_finding.png){style="width:500px"}

### Download

- Go to the `Analysis > Finding Summary` screen.
- Select DataSource, Score, Period, and File format.
- Click **DOWNLOAD REPORT(PROJECT)** to download statistical data for the currently selected project.

### Customization of visualization

To freely customize the visualization of statistical data, it is convenient to use BI tools such as [Google Data Studio](https://support.google.com/datastudio/answer/6283323).

=== "Data Portal Sample 1"

    ![Data Portal 1](/img/risken/report_data_portal1.png){style="width:500px"}

=== "Data Portal Sample 2"

    ![Data Portal 2](/img/risken/report_data_portal2.png){style="width:500px"}
