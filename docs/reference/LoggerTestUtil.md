# Logger Test Util Reference

Type: Apex Class

API Name: `ok.LoggerTestUtil`

This class provides features for controlling your unit test execution.

See [Unit Testing](../docs/api/unit-testing.md).

## Static Methods

| Method                      | Params           | Returns              | Description                                                             |
| --------------------------- | ---------------- | -------------------- | ----------------------------------------------------------------------- |
| disableErrorLoggedException |                  |                      | Disable `ErrorLoggedException` when testing `logger.error()`.           |
| disableErrorLoggedException | Boolean disabled |                      | Disable `ErrorLoggedException` when testing `logger.error()`.           |
| enableDebugLogs             |                  |                      | Enable system debug (Apex Log) in unit tests.                           |
| enableDebugLogs             | Boolean disabled |                      | Enable system debug (Apex Log) in unit tests.                           |
| getLastErrorLogEvent        |                  | ok\_\_Log_Event\_\_e | Return the log event created by the last execution of `logger.error()`. |
