# JobRelationships

The relationships between the job and other resources, including the accounts to which paychecks from this job are deposited.


## Fields

| Field                                                                           | Type                                                                            | Required                                                                        | Description                                                                     |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `Person`                                                                        | [PersonRelationship](../../Models/Components/PersonRelationship.md)             | :heavy_check_mark:                                                              | N/A                                                                             |
| `Organization`                                                                  | [OrganizationRelationship](../../Models/Components/OrganizationRelationship.md) | :heavy_check_mark:                                                              | N/A                                                                             |
| `DirectDepositDefaultDepository`                                                | [AccountRelationship](../../Models/Components/AccountRelationship.md)           | :heavy_minus_sign:                                                              | N/A                                                                             |
| `DirectDepositDefaultCard`                                                      | [AccountRelationship](../../Models/Components/AccountRelationship.md)           | :heavy_minus_sign:                                                              | N/A                                                                             |