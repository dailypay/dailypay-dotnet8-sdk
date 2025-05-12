# ErrorJobUpdateErrorSource

Location in the request that may have caused the error.


## Fields

| Field                                                                | Type                                                                 | Required                                                             | Description                                                          | Example                                                              |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `Parameter`                                                          | *string*                                                             | :heavy_minus_sign:                                                   | The name of the parameter that caused the error.                     | filter[first_name]                                                   |
| `Pointer`                                                            | *string*                                                             | :heavy_minus_sign:                                                   | A JSON Pointer to the location in the request that caused the error. | /data/attributes/first_name                                          |
| `Header`                                                             | *string*                                                             | :heavy_minus_sign:                                                   | The name of the header that caused the error.                        | Accept                                                               |