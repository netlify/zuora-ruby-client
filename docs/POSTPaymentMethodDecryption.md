# Zuora::POSTPaymentMethodDecryption

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | ID of the billing account on which the payment method will be created.  | 
**card_holder_info** | [**POSTPaymentMethodDecryptionCardHolderInfo**](POSTPaymentMethodDecryptionCardHolderInfo.md) |  | [optional] 
**integration_type** | **String** | Field to identify the token decryption type.  **Note:** The only value at this time is ‘ApplePay’.   | 
**invoice_id** | **String** | The id of invoice this payment will apply to.  **Note:** When processPayment is true, this field is required. Only one invoice can be paid; for scenarios where you want to pay for multiple invoices, set processPayment to false and call payment API separately.  | [optional] 
**merchant_id** | **String** | The Merchant ID that was configured for use with Apple Pay in the Apple iOS Developer Center.  | 
**payment_gateway** | **String** | The label name of the gateway instance configured in Zuora that should process the payment. When creating a Payment, this must be a valid gateway instance ID and this gateway must support the specific payment method. If not specified, the default gateway on the Account will be used.  **Note:** When processPayment is true, this field is required.  | [optional] 
**payment_token** | **Object** | The complete JSON Object representing the encrypted payment token payload returned in the response from the Apple Pay session.   | 
**process_payment** | **BOOLEAN** | A boolean flag to control whether a payment should be processed after creating payment method. The payment amount will be equivalent to the amount the merchant supplied in the ApplePay session. Default is false. When processPayment is false, it must be followed by a separate subscribe or payment API call to transaction.  | [optional] 


