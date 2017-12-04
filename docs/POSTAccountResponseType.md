# SwaggerClient::POSTAccountResponseType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | Auto-generated account ID.  | [optional] 
**account_number** | **String** | Account number.  | [optional] 
**contracted_mrr** | **String** | Contracted monthly recurring revenue of the subscription.  | [optional] 
**credit_memo_id** | **String** | The credit memo ID, if a credit memo is generated during the subscription process.  **Note:** This field is only available if you have the Advanced AR Settlements feature enabled.  | [optional] 
**invoice_id** | **String** | ID of the invoice generated at account creation, if applicable.  | [optional] 
**paid_amount** | **String** | Amount collected on the invoice generated at account creation, if applicable.  | [optional] 
**payment_id** | **String** | ID of the payment collected on the invoice generated at account creation, if applicable.  | [optional] 
**payment_method_id** | **String** | ID of the payment method that was set up at account creation, which automatically becomes the default payment method for this account.  | [optional] 
**subscription_id** | **String** | ID of the subscription that was set up at account creation, if applicable.  | [optional] 
**subscription_number** | **String** | Number of the subscription that was set up at account creation, if applicable.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 
**total_contracted_value** | **String** | Total contracted value of the subscription.  | [optional] 


