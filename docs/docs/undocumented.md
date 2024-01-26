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
