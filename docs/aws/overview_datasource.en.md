# Setting up AWS data sources on RISKEN

1. Click `AWS > AWS` from the menu to go to the AWS settings screen.
2. Click `NEW` on the right side of the screen.
3. In the AWS dialog, enter the following items and click `REGIST`.
    - **Name**: Your AWS name (the one you want to scan).
    - **AWS Account ID**: Your AWS account ID (12 digits).
    - ![new AWS](/img/aws/aws_new_account.png){style="width:300px"}
4. After registering your AWS account, click the data row in the list to open the AWS data source screen.
5. Click `SETUP ALL` on the upper right side of the list.
    - ![setup all](/img/aws/aws_setup_btn.png){style="width:300px"}
6. In the dialog, set the following items and click `ATTACH ALL`.
    - **AssumeRole**: Enter the ARN of the IAM role you are planning to create later.
```
arn:aws:iam::{AWS account ID}:role/RISKEN
```
        - Here, we use "RISKEN" as the role name, but you can use any role name.
    - **External ID**: Click the `AUTO-GENERATE EXTERNAL ID` button to set a random string.

        ???+ "Note"
            - RISKEN's environment monitors multiple AWS environments.
            - It is necessary to distinguish your AWS from other projects so that they do not reference it.

        - When RISKEN references your AWS environment, it identifies it using an external ID.


   - ![setup dialog](/img/aws/aws_setup_dialog.png){style="width:400px"}

7. The `AssumeRole` and `ExternalID` you set here will be needed when creating the IAM role later.
   - Use the :material-content-copy: (copy button) as needed.
