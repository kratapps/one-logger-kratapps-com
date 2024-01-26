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
