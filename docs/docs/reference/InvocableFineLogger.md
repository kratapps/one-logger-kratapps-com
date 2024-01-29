# Invocable Fine Logger Reference

**Type**: Apex Class

**API Name**: `ok.InvocableFineLogger`

**Label**: Log Fine

**Category**: Logging

Log errors from flows.

Alternatively, use the following invocable loggers to employ a different logging
level:

-   WARN - Using [InvocableWarnLogger](InvocableWarnLogger.md).
-   INFO - Using [InvocableInfoLogger](InvocableInfoLogger.md).
-   DEBUG - Using [InvocableDebugLogger](InvocableDebugLogger.md).
-   FINE - Using [InvocableFineLogger](InvocableFineLogger.md).

See [Flow Logging](../api/flow-logging.md).

## Static Methods

| Method       | Params                   | Returns | Description           |
| ------------ | ------------------------ | ------- | --------------------- |
| logInvocable | List<InvocableLog\> logs |         | Log fine from a flow. |
