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

### Database Error Logger

Create logs at level ERROR from database results. Use the `logDatabaseFailures`
method to register logs from failed save results. This method does not publish
the logs.

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

### Anonymous Block Apex Logger

Use anonymous block logger when logging from anonymous apex scripts.

```apex
final ok.Logger logger = ok.Logger.getAnonymousBlockLogger();
```

### Logging in Batch Apex

Call `ok.Logger.setBatchableContext(ctx)` at the beginning of `start`, `execute`
and `finish` methods to provide the batchable context to logger.

Log fields populated:

-   Batch Job Id
-   Batch Child Job Id

### Logging in Schedulable Apex

Call `ok.Logger.setSchedulableContext(ctx)` at the beginning of the `execute`
method to provide the schedulable context to logger.

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

The logging utility offers two methods, `hideSecret(String)` and
`hideSecrets(List<String>)`, which are designed to conceal sensitive information
within text fields of log records. These methods effectively obfuscate the
specified secrets, ensuring their confidentiality. By utilizing these methods,
you can safeguard sensitive data from being exposed in log entries. User's
access token is automatically added to secrets.

```apex
String secretValue;
logger.info(secretValue).hideSecret(secret).log('Log with a secret.');
```

### Import External Logs

You can configure external log import to publish One Logger events when logs
from other loggers are inserted. This can be used to publish logs:

-   when other apps/managed packages you don't own are using own log objects
-   from your own legacy log object

Create
[External Log Import](https://kratapps.com/one-logger/latest/reference/ok__External_Log_Import__mdt)
and
[External Log Field Mapping](https://kratapps.com/one-logger/latest/reference/ok__External_Log_Field_Mapping__mdt)
Custom Metadata records to configure the import. Add after insert trigger on the
external log object and call `ok.Logger.publishExternalLogs(Trigger.new);`.

Some configurations can be found in the
[External Logs for One Logger](https://kratapps.com/one-logger/plugins/external-logs-for-one-logger/)
plugin.

### Permission Manager

Our API provide simple way to assign licenses or our permission sets.

Let's say you want to assign the Logger_Create_Logs permission set to every new
active user. You can call `PermissionManager.assignCreateLogsPermSet(userIds)`
to assign it from your user trigger.

See
[Permission Manager reference](https://kratapps.com/one-logger/latest/reference/PermissionManager.cls)
for all features.
