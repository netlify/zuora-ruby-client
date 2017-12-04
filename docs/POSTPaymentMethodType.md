# SwaggerClient::POSTPaymentMethodType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_key** | **String** | ID of the customer account to update.  | 
**card_holder_info** | [**POSTPaymentMethodTypeCardHolderInfo**](POSTPaymentMethodTypeCardHolderInfo.md) |  | [optional] 
**credit_card_number** | **String** | Credit card number, a string of up to 16 characters. This field can only be set when creating a new payment method; it cannot be queried or updated.  | 
**credit_card_type** | **String** | Possible values are: &#x60;Visa&#x60;, &#x60;MasterCard&#x60;, &#x60;AmericanExpress&#x60;, &#x60;Discover&#x60;.  | 
**default_payment_method** | **BOOLEAN** | Specify true to make this card the default payment method; otherwise, omit this parameter to keep the current default payment method.  | [optional] 
**expiration_month** | **String** | Two-digit expiration month (01-12).  | 
**expiration_year** | **String** | Four-digit expiration year.  | 
**num_consecutive_failures** | **Integer** | The number of consecutive failed payments for this payment method. It is reset to &#x60;0&#x60; upon successful payment.   | [optional] 
**security_code** | **String** | The CVV or CVV2 security code for the credit card or debit card. Only required if changing expirationMonth, expirationYear, or cardHolderName. To ensure PCI compliance, this value isn&#39;t stored and can&#39;t be queried.   | [optional] 


