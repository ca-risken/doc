# Website

By registering your website on RISKEN, you can investigate the technologies used on the site from external sources.

By accessing the site from outside, you can obtain information such as the name and version of the tools used on the site.

## Format

When importing data to RISKEN, the following metadata is added:

| Item           | Description                                      |
| -------------- | ------------------------------------------------ |
| `DataSource`   | osint:website (fixed)                            |
| `ResourceName` | Name of the detected technology                  |
| `Description`  | Description                                      |
| `Score`        | Refer to [scoring](/osint/domain_concept/#_2)    |
| `Tag`          | `osint` `website` `osint_id:{OsintID}` `{category of the technology used}` |

* `OsintID`, in the `Tag` field, is the ID assigned at the time of resource registration on the OSINT registration screen.

## Scoring

Currently, since only technology information is collected, the score is registered with a uniform score of `0.1`.

???+ warning "Case where the target server is down"
    When making an analysis, there may be cases where an http(s) request is sent.
    In such cases, if the target server is down, the intended information may not be obtained.
