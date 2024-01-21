# Unit Testing

When an error is logged from within a unit test, an `ErrorLoggedException` exception is thrown by default to fail the test.
Sometimes, it is expected in the test for an error to be logged.
In that case, you can disable this behavior using `LoggerTestUtil.disableErrorLoggedException();`.

Disable the `ErrorLoggedException` on a per-test method basis.

```java
@IsTest
static void myTest() {
    LoggerTestUtil.disableErrorLoggedException();
    // Error logs will not throw the ErrorLoggedException in this test method.
    logger.error().log('test');
}
```

Disable `ErrorLoggedException` on a per-test class basis.

```apex
@IsTest
private class MyTestClass {
    private static ok.Logger logger = ok.Logger.getLogger(MyTestClass.class);

    static {
        LoggerTestUtil.disableErrorLoggedException();
    }

    @IsTest
    static void myTest() {
        // Error logs will not throw the ErrorLoggedException in this test class.
        logger.error().log('test');
    }
}
```

System debug (Apex Log) is disabled by default in unit tests, as the custom settings record does not exist.
You can enable system debug in unit tests explicitly using `LoggerTestUtil.enableDebugLogs();`.
