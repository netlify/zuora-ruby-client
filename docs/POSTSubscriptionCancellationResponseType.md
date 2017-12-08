# Zuora::POSTSubscriptionCancellationResponseType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**cancelled_date** | **Date** | The date that the subscription was canceled.  | [optional] 
**credit_memo_id** | **String** | The credit memo ID, if a credit memo is generated during the subscription process.  **Note:** This field is only available if you have the Advanced AR Settlements feature enabled.  | [optional] 
**invoice_id** | **String** | ID of the invoice, if one is generated.  | [optional] 
**paid_amount** | **String** | Amount paid.  | [optional] 
**payment_id** | **String** | ID of the payment, if a payment is collected.  | [optional] 
**subscription_id** | **String** | The subscription ID.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 
**total_delta_mrr** | **String** | Change in the subscription monthly recurring revenue as a result of the update.  | [optional] 
**total_delta_tcv** | **String** | Change in the total contracted value of the subscription as a result of the update.  | [optional] 


