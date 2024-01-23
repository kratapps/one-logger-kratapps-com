### Log creation

Initialize a One Logger instance.

```apex
// apex class logger
private static final ok.Logger logger = ok.Logger.getLogger(AccountTriggerHandler.class);
// or trigger logger
final ok.Logger logger = ok.Logger.getTriggerLogger();
// or anonymous apex logger
final ok.Logger logger = ok.Logger.getAnonymousBlockLogger();
```

Use `error`, `warn`, `info`, `debug`, `fine`, `finer` or `finest` method on Logger instance to create a
[log](https://kratapps.com/one-logger/latest/reference/Log.cls).

Optionally chain builder methods to provide more details in the log,
e.g. link sObject, add payload, add HTTP/REST requests/responses.

```apex
// log at info
logger.info().log('Hello Logger!');

// log custom payload data
logger.info().payload(customData).log('Log with custom payload.');

// log at error with sobject data and with exception
logger.error().linkSObject(account).addException(e).log('Insert failed.');

// log http request
HttpResponse resp = new Http().send(req);
if (resp.getStatusCode() == 200) {
    logger.info().addHttpRequest(req).addHttpResponse(resp).log('HTTP request success.');
} else {
    logger.error().addHttpRequest(req).addHttpResponse(resp).log('HTTP request failed.');
}

// log rest request
logger.info().addRestRequest(RestContext.request).log('Inbound REST request.');
```

### Log registration

Call `log` method to register the log.
During the registration a log event is build and printed into the console.
You should treat a log object as read-only once you register the log.

### Publish logs

When `publish` method is called, log events are published and sObjects are inserted.

```apex
ok.Logger.publish();
```

You don't need to publish logs in every method, publishing only at the top-level apex code is recommended.
Best practice is to wrap your code at the
top-level apex in a `try-catch` block and use `finally` block to publish events.

Top-level apex code examples:

-   Apex trigger
-   Controller method with `@AuraEnable` annotation
-   Method with `@Future` annotation
-   Execute method of a queueable class
-   Execute method of a schedulable class
-   Execute, start and finish methods of a batchable class
-   Apex REST resource methods

### Generic Payload

A log contains multiple fields for storing data, and it includes the ok\_\_Payload\_\_c field specifically designated for saving a generic payload.

-   addPayload(Object payload) - the payload value is converted to string.
-   addPayloadJson(Object payload) - the payload value is serialized into a JSON.

### Database Error Logger

Create logs at level ERROR from database results.
Use the `logDatabaseFailures` method to register logs from failed save results.
This method does not publish the logs.

```apex
List<Database.SaveResult> saveResults = Database.insert(records, false);
logger.logDatabaseFailures(saveResults);
```

Supported collections:

-   List<Database.DeleteResult>
-   List<Database.LeadConvertResult>
-   List<Database.MergeResult>
-   List<Database.SaveResult>
-   List<Database.UndeleteResult>
-   List<Database.UpsertResult>

### Trigger Logger

Use trigger logger when logging from apex trigger.
Trigger is top-level apex, don't forget to publish events.

```apex
trigger AccountTrigger on Account(after insert) {
  final ok.Logger logger = ok.Logger.getTriggerLogger();
  try {
    AccountTriggerHandler.run();
  } catch (Exception e) {
    logger.error().addException(e).log('Unexpected error in trigger.');
  } finally {
    ok.Logger.publish();
  }
}
```

### Anonymous Block Apex Logger

Use anonymous block logger when logging from anonymous apex scripts.

```apex
final ok.Logger logger = ok.Logger.getAnonymousBlockLogger();
```

### Flow Logger

Create logs from flows using Flow Logger. Add a new action and choose one of the logging actions.
All the actions are in the `Logging` category.
Publish is not required as logs are published automatically.

> Flow logs and apex logs in the same transaction are grouped in a Transaction Log record.

See the [Invocable Log Reference](https://kratapps.com/one-logger/latest/reference/InvocableLog.cls).

![Flow Logger](https://kratapps.com/images/one-logger/flow_logger.png "Flow Logger")

### Logging in Batch Apex

Call `ok.Logger.setBatchableContext(ctx)`
at the beginning of `start`, `execute` and `finish` methods
to provide the batchable context to logger.

Log fields populated:

-   Batch Job Id
-   Batch Child Job Id

### Logging in Schedulable Apex

Call `ok.Logger.setSchedulableContext(ctx)`
at the beginning of the `execute` method
to provide the schedulable context to logger.

Log fields populated:

-   Schedulable Cron Trigger Job Id

### Inbound email logging

Log inbound email.

```apex
Messaging.InboundEmail email;
Messaging.InboundEnvelope envelope;
logger.info().addInboundEmail(email, envelope).addException(e).log('Outbound emails.');
```

Log outbound email(s).

```apex
Messaging.Email email;
logger.info().addEmail(email).addException(e).log('Outbound email.');

List<Messaging.Email> emails;
logger.info().addEmails(emails).addException(e).log('Outbound emails.');
```

### Hide Secrets

The logging utility offers two methods, `hideSecret(String)` and `hideSecrets(List<String>)`,
which are designed to conceal sensitive information within text fields of log records.
These methods effectively obfuscate the specified secrets, ensuring their confidentiality.
By utilizing these methods, you can safeguard sensitive data from being exposed in log entries.
User's access token is automatically added to secrets.

```apex
String secretValue;
logger.info(secretValue).hideSecret(secret).log('Log with a secret.');
```

### Import External Logs

You can configure external log import to publish One Logger events when logs from other loggers are inserted.
This can be used to publish logs:

-   when other apps/managed packages you don't own are using own log objects
-   from your own legacy log object

Create [External Log Import](https://kratapps.com/one-logger/latest/reference/ok__External_Log_Import__mdt)
and [External Log Field Mapping](https://kratapps.com/one-logger/latest/reference/ok__External_Log_Field_Mapping__mdt)
Custom Metadata records to configure the import. Add after
insert trigger on the external log object and call `ok.Logger.publishExternalLogs(Trigger.new);`.

Some configurations can be found in the
[External Logs for One Logger](https://kratapps.com/one-logger/plugins/external-logs-for-one-logger/) plugin.

### Permission Manager

Our API provide simple way to assign licenses or our permission sets.

Let's say you want to assign the Logger_Create_Logs permission set to every new active user.
You can call `PermissionManager.assignCreateLogsPermSet(userIds)` to assign it from your user trigger.

See [Permission Manager reference](https://kratapps.com/one-logger/latest/reference/PermissionManager.cls)
for all features.
