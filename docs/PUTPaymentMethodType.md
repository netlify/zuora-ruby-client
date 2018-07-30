# Zuora::PUTPaymentMethodType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**address_line1** | **String** | First address line, 255 characters or less.  | [optional] 
**address_line2** | **String** | Second address line, 255 characters or less.  | [optional] 
**card_holder_name** | **String** | The full name as it appears on the card, e.g., \&quot;John J Smith\&quot;, 50 characters or less.  | [optional] 
**city** | **String** | City, 40 characters or less.  | [optional] 
**country** | **String** | Country; must be a valid country name or abbreviation.  | [optional] 
**default_payment_method** | **BOOLEAN** | Specify \&quot;true\&quot; to make this card the default payment method; otherwise, omit this parameter to keep the current default payment method.  | [optional] 
**email** | **String** | Card holder&#39;s email address, 80 characters or less.  | [optional] 
**expiration_month** | **String** | One or two digit(s) expiration month (1-12).  | [optional] 
**expiration_year** | **String** | Four-digit expiration year.  | [optional] 
**num_consecutive_failures** | **Integer** | The number of consecutive failed payments for this payment method. It is reset to &#x60;0&#x60; upon successful payment.   | [optional] 
**phone** | **String** | Phone number, 40 characters or less.  | [optional] 
**security_code** | **String** | The CVV or CVV2 security code for the credit card or debit card. Only required if changing expirationMonth, expirationYear, or cardHolderName. To ensure PCI compliance, this value isn&#39;t stored and can&#39;t be queried.   | [optional] 
**state** | **String** | State; must be a valid state name or 2-character abbreviation.  | [optional] 
**zip_code** | **String** | Zip code, 20 characters or less.  | [optional] 


