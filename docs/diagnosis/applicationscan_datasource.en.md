# Data source

Explanation of data source settings for ApplicationScan

???+ warning "Scanning other environments is not allowed"
    
???+ warning "Do not scan production environments"
    Unexpected addition/deletion of data may occur due to sending a large number of requests

1. Click `Diagnosis > ApplicationScan` from the menu.
2. Click `NEW` on the right side of the screen.
3. Enter the following items and click `EDIT`:
    - **Name**: Enter a description of the target (this will not affect the diagnosis).
    - **Target URL**: Enter the URL of the target for diagnosis. The URL set here and below it will be the target for diagnosis.
        - Even for the same domain, URLs that do not include the target URL will not be the target for diagnosis.
    - If you want to make detailed settings for scanning, enter the following:
    - **Setting Detail**: Click to enter two items related to crawling the target for diagnosis:
    - **Max Depth**: Sets the number of layers of depth from the target URL to be scanned. 
        - The default is 0, which scans until no more targets are found. 
        - If you set 0 or a large number, the scanning process may take a long time depending on the size of the target site.
    - **Max Children**: Crawls the links found on each page up to the number set here. 
        - The default is 0, which targets all links on the page. 
        - If you set 0 or a large number, the scanning process may take a long time when there are a large number of similar pages, such as blog posts.

![applicationscan](/img/diagnosis/applicationscan.png){style="width:400px"}
