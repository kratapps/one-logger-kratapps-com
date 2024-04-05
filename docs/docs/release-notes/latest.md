# 1.49

Version ID: 04t09000000BXVgAAO

**Flow API**

-   New invocable attributes:
    -   `Fault Message` - Used in the Fault Path. Use `{!$Flow.FaultMessage}`
        global variable. Sets following fields on the log record:
        -   `ok__Exception_Message__c`
        -   `ok__Exception_Type__c`
        -   `ok__First_Error_Message__c`
        -   `ok__Stack_Trace__c`
    -   `Inteview GUID` - Use `{!$Flow.InterviewGuid}` global variable. Sets the
        `ok__Interview_Guid__c` field on the log record.
    -   `SObject Id 2` - Flow variant of the `linkSObject2` method.
-   External logs changes:
    -   Log Level parsed safely. If it is not mapped to the `ok.LogLevel` enum,
        then `ERROR` is the default value.
    -   Source changed to a new value, `EXTERNAL`.
    -   Namespace Prefix populated from
        `ok__External_Log_Import__mdt.ok__External_Log_Namespace__c`.

**Slack Plugin**

-   In Slack message, `ok__Org_Domain_URL__c` is used as the base URL in links
    instead of `Url.getSalesforceBaseUrl()`.
