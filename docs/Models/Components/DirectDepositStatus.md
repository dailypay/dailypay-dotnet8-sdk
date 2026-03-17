# DirectDepositStatus

- `SETUP_REQUIRED` Direct deposit is not set up for this Job. Update this resource's relationships to set up direct deposit.
- `SETUP_PENDING` A system action is still pending.
- `SETUP_COMPLETE` Direct deposit is set up for this Job.


## Example Usage

```csharp
using DailyPay.SDK.DotNet8.Models.Components;

var value = DirectDepositStatus.SetupRequired;
```


## Values

| Name            | Value           |
| --------------- | --------------- |
| `SetupRequired` | SETUP_REQUIRED  |
| `SetupPending`  | SETUP_PENDING   |
| `SetupComplete` | SETUP_COMPLETE  |