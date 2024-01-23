# Log Lifecycle

A log can have several forms throughout the lifecycle:

-   Log data (`ok.Log` apex class) - See [Log Reference](../../reference/Log.md).
-   Log event (`ok__Log_Event__e` platform event) - See [Log Event Reference](../../reference/ok__Log_Event__e.md).
-   Log record (`ok__Log_c` custom object) - See [Log Reference](../../reference/ok__Log__c.md).

The log lifecycle includes following stages:

## Logger initialization

**Apex class logger initialization**

The logger in an apex class should be initialized using `getLogger` and with the correct type.
Add the `static` modifier to enable logging from static methods.

> ⚠ The use of an incorrect type will break information about the method name, line number, etc.

```apex
public class AccountService {
    private static ok.Logger logger = ok.Logger.getLogger(AccountService.class);
}
```

**Apex trigger logger initialization**

Similar to the Apex class, the trigger logger will be initialized simply with `getTriggerLogger`.

> ⚠ A trigger code is a top-level Apex, and its code should be wrapped in a try-catch-finally block with error logging and publishing.
> The exception should be rethrown in a unit test to roll back the transaction.

```apex
trigger AccountTrigger on Account(before insert) {
    ok.Logger logger = ok.Logger.getTriggerLogger();
    try {
        Domain.triggerHandler(Accounts.class);
    } catch (Exception e) {
        logger.error().addException(e).log('Unexpected error in trigger.');
        throw e;
    } finally {
        ok.Logger.publish();
    }
}
```

**Anonymous apex logger initialization**

If you have some automated Apex scripts, you can also log from there using the anonymous block logger.

```apex
ok.Logger logger = ok.Logger.getAnonymousBlockLogger();
```

**Flow logger**

There's no need to initialize a flow logger, see [Flow Logging](flow-logging.md).

## Build log data

## Register log event

## Publish log events

## Subscribe to log events

    - Create log records.
    - Plugins are executed (optional).

## Store logs in an external app (optional)

Salesforce is not optimized to store a large volume of data, such as logs.
Consider scheduling a log cleaner to prune old logs and connecting an external application like Splunk to persist and conduct further analysis.

## Consume log records (optional)
