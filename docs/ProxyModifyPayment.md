# Zuora::ProxyModifyPayment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | The unique account ID for the customer that the payment is for.  | [optional] 
**accounting_code** | **String** | The aacccounting code for the payment. Accounting codes group transactions that contain similar accounting attributes.  | [optional] 
**amount** | **Float** | The amount of the payment.  | [optional] 
**comment** | **String** | Additional information related to the payment.  | [optional] 
**effective_date** | **Date** | The date when the payment takes effect.  | [optional] 
**payment_method_id** | **String** | The ID of the payment method used for the payment.   | [optional] 
**reference_id** | **String** | The transaction ID returned by the payment gateway. Use this field to reconcile payments between your gateway and Zuora Payments.  | [optional] 
**status** | **String** | The status of the payment in Zuora. The value depends on the type of payment.    For electronic payments, the status can be &#x60;Processed&#x60;, &#x60;Error&#x60;, or &#x60;Voided&#x60;. For external payments, the status can be &#x60;Processed&#x60; or &#x60;Canceled&#x60;.  | [optional] 
**transferred_to_accounting** | **String** | Whether the refund was transferred to an external accounting system. Use this field for integration with accounting systems, such as NetSuite.  | [optional] 
**type** | **String** | The type of the payment, whether the payment is external or electronic.  | [optional] 


