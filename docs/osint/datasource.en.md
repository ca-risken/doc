# Data Source

???+ warning "Scanning other people's environments is prohibited"
    If found, data may be forcibly deleted.

1. Click `OSINT > OSINT` from the menu.
2. Click `NEW` on the right side of the screen.
3. Enter the following items and click `EDIT`:
    - **ResourceType**: Specify either Domain or Website.
    - **ResourceName**: Enter the Domain name or Website URL you want to monitor with OSINT.
    - **Activate DataSource**: Check this to enable the available data sources for that resource type at the time of registration.
    - ![New OSINT](/img/osint/osint_new.png){style="width:500px"}
4. After registering the OSINT resource, click the list to open the DataSource screen.
5. Click on the DataSource in the list to open the dialog and click `ATTACH`.
    - Only those that are valid for the set resource type are displayed in the DataSource list.
    - ![OSINT Attach](/img/osint/osint_attach.png){style="width:400px"}
6. For `osint:subdomain`, you can monitor websites that should not normally be publicly available by registering a DetectWord.
    - The following keywords are registered by default:
        - `jenkins`
        - `stg`
        - `dev`
        - `admin`
    - You can also add keywords by clicking `NEW WORD`.
