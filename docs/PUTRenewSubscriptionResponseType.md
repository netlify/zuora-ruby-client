# Zuora::PUTRenewSubscriptionResponseType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**credit_memo_id** | **String** | The credit memo ID, if a credit memo is generated during the subscription process.  **Note:** This field is only available if you have the Advanced AR Settlements feature enabled.  | [optional] 
**invoice_id** | **String** | Invoice ID, if one is generated.  | [optional] 
**paid_amount** | **String** | Payment amount, if payment is collected.  | [optional] 
**payment_id** | **String** | Payment ID, if payment is collected.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 
**term_end_date** | **Date** | Date the new subscription term ends, as yyyy-mm-dd.  | [optional] 
**term_start_date** | **Date** | Date the new subscription term begins, as yyyy-mm-dd.  | [optional] 
**total_delta_mrr** | **String** | Change in the subscription monthly recurring revenue as a result of the update. For a renewal, this is the MRR of the subscription in the new term.  | [optional] 
**total_delta_tcv** | **String** | Change in the total contracted value of the subscription as a result of the update. For a renewal, this is the TCV of the subscription in the new term.  | [optional] 


