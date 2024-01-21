# Invocable Log Reference

Type: Apex Class

API Name: `ok.InvocableLog`

## Fields

| Field Label      | Type   | Required | Description                                                                             |
| ---------------- | ------ | -------- | --------------------------------------------------------------------------------------- |
| Message          | string | true     | Log message.                                                                            |
| Flow Name        | string | true     | Name of the flow calling the logger.                                                    |
| Namespace Prefix | string | false    | Namespace prefix of the flow. Should be set if the flow is in a package with namespace. |
| Function Name    | string | false    | Optional identifier to distinguish from other logs in the same flow.                    |
| SObject ID       | string | false    | Linked SObject record.                                                                  |
| Payload          | string | false    | Additional data to include in the log.                                                  |
