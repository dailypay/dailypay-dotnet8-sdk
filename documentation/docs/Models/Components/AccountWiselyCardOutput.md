# AccountWiselyCardOutput


## Fields

| Field                                          | Type                                           | Required                                       | Description                                    | Example                                        |
| ---------------------------------------------- | ---------------------------------------------- | ---------------------------------------------- | ---------------------------------------------- | ---------------------------------------------- |
| `FirstName`                                    | *string*                                       | :heavy_check_mark:                             | The first name of the account holder.          | Edith                                          |
| `LastName`                                     | *string*                                       | :heavy_check_mark:                             | The last name of the account holder.           | Clarke                                         |
| `ExpirationMonth`                              | *string*                                       | :heavy_check_mark:                             | The month of the expiration date for the card. | 02                                             |
| `ExpirationYear`                               | *string*                                       | :heavy_check_mark:                             | The year of the expiration date for the card.  | 2025                                           |
| `WiselyToken`                                  | *string*                                       | :heavy_check_mark:                             | Wisely unique identifier associated to card.   | 53bf829e-6e3f-4c17-a7de-6e91003a5dd3           |
| `LastFour`                                     | *string*                                       | :heavy_check_mark:                             | Last four digits of the card number.           | 0003                                           |
| `Issuer`                                       | *string*                                       | :heavy_check_mark:                             | The issuer of the card.                        | 411600                                         |