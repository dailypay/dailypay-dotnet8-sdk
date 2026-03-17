# TransferCreateAttributesSchedule

Set the schedule for the transfer. If not set, the transfer will be processed immediately. 
A preview transfer will never send.


## Example Usage

```csharp
using DailyPay.SDK.DotNet8.Models.Components;

var value = TransferCreateAttributesSchedule.WithinThirtyMinutes;
```


## Values

| Name                  | Value                 |
| --------------------- | --------------------- |
| `WithinThirtyMinutes` | WITHIN_THIRTY_MINUTES |
| `NextBusinessDay`     | NEXT_BUSINESS_DAY     |