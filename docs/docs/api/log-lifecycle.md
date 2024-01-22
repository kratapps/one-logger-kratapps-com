# Log Lifecycle

A log can have several forms throughout the lifecycle:

-   Log data (`ok.Log` apex class) - See [Log Reference](../../reference/Log.md).
-   Log event (`ok__Log_Event__e` platform event) - See [Log Event Reference](../../reference/ok__Log_Event__e.md).
-   Log record (`ok__Log_c` custom object) - See [Log Reference](../../reference/ok__Log__c.md).

The log lifecycle includes following steps:

## Build log data

## Register log event

## Publish log events

## Subscribe to log events

    - Create log records.
    - Plugins are executed (optional).

## Store logs in an external app (optional)

Salesforce is not optimized to store a large volume of data, such as logs.
Consider scheduling a log cleaner to prune old logs and connecting an external application like Splunk to persist and conduct further analysis.

## Consume log records (optional).
