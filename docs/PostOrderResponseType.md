# Zuora::PostOrderResponseType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**success** | **BOOLEAN** | Indicates whether the call succeeded. | [optional] 
**account_number** | **String** | The account number for the order. | [optional] 
**credit_memo_numbers** | **Array&lt;String&gt;** | An array of the credit memo numbers generated in this order request. The credit memo is only available if you have the Avdanced AR Settlement feature enabled. | [optional] 
**invoice_numbers** | **Array&lt;String&gt;** | An array of the invoice numbers generated in this order request. Normally it includes one invoice number only, but can include multiple items when a subscription was tagged as invoice separately. | [optional] 
**order_number** | **String** | The number of the order created. | [optional] 
**paid_amount** | **String** | The total amount collected in this order request. | [optional] 
**payment_number** | **String** | The payment number that collected in this order request. | [optional] 
**subscription_numbers** | **Array&lt;String&gt;** | An array of number of subscriptions included in this order. | [optional] 


