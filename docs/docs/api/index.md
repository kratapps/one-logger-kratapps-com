# Logger API

The API can be invoked through following components:

-   [Logger](../../reference/Logger.md) - Main API for creating and publishing logs. Additionally, you can control the execution context.
-   [Log](../../reference/Log.md) - Apex class used to build the `ok__Log_Event__e`. Includes methods to log specific data, for example:
    -   Build the Log Event and set the log message using `.log(message)`.
    -   Exception data (type, message, stack trace...), for example `.addException(exception)`.
    -   Custom payload, for example `.addPyaload(someString)` or `.addPayloadJson(someSerializableData)`.
    -   HTTP request/response data, for example `.addHttpRequest(request);`.
    -   Email data, for example `.addEmail(email);`.
-   [Invocable Error Logger](../../reference/InvocableErrorLogger.md) - Log from flows, see [Flow Logging](flow-logging.md).
-   [Logger Test Util](../../reference/LoggerTestUtil.md) - Control unit tests execution, see [Unit Testing](unit-testing.md).
-   [Permission Manager](../../reference/PermissionManager.md) - Manage permission sets and license assignments programmatically.

## Log Lifecycle

A log can have several forms throughout the lifecycle:

-   Log data (`ok.Log` apex class) - See [Log Reference](../../reference/Log.md).
-   Log event (`ok__Log_Event__e` platform event) - See [Log Event Reference](../../reference/ok__Log_Event__e.md).
-   Log record (`ok__Log_c` custom object) - See [Log Reference](../../reference/ok__Log__c.md).

The log lifecycle includes following steps:

1. Build log data.
2. Register log event.
3. Publish log events.
4. Subscribe to log events.
    - Create log records.
    - Plugins are executed (optional).
5. _Store logs to external app_ (optional), e.g. Splunk for further analysis.
6. Consume log records (optional).
7.
