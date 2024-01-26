# Logging Examples

See specifications for logging on the
[Logger Reference](../../reference/Logger.md) page and
[Log Reference](../../reference/Log.md) page.

## Basic Logging

```apex
public class SpaceshipController {
    private static ok.Logger logger = ok.Logger.getLogger(SpaceshipController.class);
    private Spaceship__c spaceship;

    public Boolean prepareForHyperspaceJump() {
        Id pilotId = UserInfo.getUserId();
        Boolean isAuthorized = isHyperspaceJumpAuthorized(pilotId);
        if (!isAuthorized) {
            // WARNING log.
            logger.warn().linkSObject(spaceship).linkSObject2(pilotId).log('Pilot is not authorized.');
            return false;
        }
        // INFO log.
        logger.info().addPayloadJson(spaceship.getEngineStatus()).log('Hyperspace jump is ready.');
        return true;
    }
}
```

## Exception Handling

```apex
public void safeOperation() {
    try {
        unsafeOperation();
    } catch (Exception e) {
        logger.error().addException(e).log('Unexpected error happened.');
    }
}
```

### Add Payload

```apex
// String payload example:
Datetime now = Datetime.now();
logger.info().addPayload(now).log('String payload.');

// Serialized payload example:
public class Person {
    public String firstName;
    public String lastName;

    public Person(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }
}

Person anakin = new Person('Anakin',  'Skywalker');
logger.info().addPayloadJson(anakin).log('Apex object serialized.');
```

## HTTP Callout

```apex
HttpRequest req = new HttpRequest();
logger.fine().addHttpRequest(req).log('HTTP request.');

HttpResponse resp = new Http().send(req);
if (resp.getStatusCode() != 200) {
    logger.error().addHttpCallout(req, resp).log('HTTP request failed.');
}
```

## Apex REST

```apex
@RestResource(urlMapping='/Spaceship/*')
global with sharing class SpaceshipResource {
    private static ok.Logger logger = ok.Logger.getLogger(SpaceshipResource.class);

    @HttpGet
    global static String doGet() {
        try {
            logger.info().addRestRequest(RestContext.request).log('REST request received.');
            someOperation();
            return 'ok';
        } catch (Exception e) {
            logger.error().addRestRequest(RestContext.request).log('Unexpected error.');
            return 'err';
        } finally {
            ok.Logger.publish();
        }
    }
}
```

## Outbound Emails

```apex
Messaging.Email email;
logger.info().addEmail(email).log('Outbound email.');

List<Messaging.Email> emails;
logger.info().addEmails(emails).log('Outbound emails.');
```

## Inbound Emails

```apex
Messaging.InboundEmail email;
Messaging.InboundEnvelope envelope;
logger.info().addInboundEmail(email, envelope).log('Inbound emails.');
```

## Tagging

```apex
logger.info().addTag('sales').log('Tagged log');
```

## Masking Secrets

```apex
String secret = 'super-private-key';
logger.info().addPayload(secret).hideSecret(secret).log('Sensitive data.');
// ok__Payload__c = '****'
```
