# Apex Log Reference

Type: Apex Class

API Name: `ok.Log`

Data class used for building the log event.

Note that this class is completely different from the `ok__Log__c` custom sobject.

## Methods

| Method          | Params                                            | Returns | Description                                                                                                         |
| --------------- |---------------------------------------------------| ------- | ------------------------------------------------------------------------------------------------------------------- |
| log             | String message                                    | ok.Log  | Registers the log. Log will be printed to console and prepared for publishing.                                      |
| hideSecrets     | Set<String\> secrets                              | ok.Log  | Removes secrets from logs.                                                                                          |
| hideSecret      | String secret                                     | ok.Log  | Removes secret from logs.                                                                                           |
| addPayload      | Object payload                                    | ok.Log  | Add data. String.valueOf will be used to stringify the object.                                                      |
| addPayloadJson  | Object payload                                    | ok.Log  | Add data. JSON.serialize will be used to serialize the object.                                                      |
| addException    | Exception e                                       | ok.Log  | Includes exception data, exception message and stack trace.                                                         |
| linkSObject     | Id sObjectId                                      | ok.Log  | Includes SObject ID and Type in the log.                                                                            |
| linkSObject     | SObject record                                    | ok.Log  | Includes SObject ID, Type and serialized SObject.                                                                   |
| addEmail        | Messaging.Email email                             | ok.Log  | Includes outbound email data.                                                                                       |
| addEmails       | List<Messaging.Email\> emails                     | ok.Log  | Includes outbound email data.                                                                                       |
| addHttpCallout  | HttpRequest req, HttpResponse                     | ok.Log  | Includes HTTP request and response data.                                                                            |
| addHttpRequest  | HttpRequest req                                   | ok.Log  | Includes HTTP request data.                                                                                         |
| addHttpResponse | HttpResponse res                                  | ok.Log  | Includes HTTP response data.                                                                                        |
| addInboundEmail | Messaging.InboundEmail, Messaging.InboundEnvelope | ok.Log  | Includes inbound email data.                                                                                        |
| addRestRequest  | RestRequest req                                   | ok.Log  | Includes REST request data. Use if the REST method is without parameters.                                           |
| addRestRequest  | RestRequest req, Object param1                    | ok.Log  | Includes REST request data. Use if the REST method has one parameter.                                               |
| addRestRequest  | RestRequest req, Map<String, Object> params       | ok.Log  | Includes REST request data. Use if the REST Method has multiple parameters. Map parameter values by parameter name. |
| addRestResponse | RestResponse res, Object responseBody             | ok.Log  | Includes REST response data. Response body is either the return value of the method or RestContext.response.        |
| addTags         | Set<String\> tagNames                             | ok.Log  | Add tags to a log.                                                                                                  |
| addTag          | String tagName                                    | ok.Log  | Add tag to a log.                                                                                                   |
