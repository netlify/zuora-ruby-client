# Zuora::BillingPreviewResult

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | ID of the customer account to which the billing preview applies.  | [optional] 
**credit_memo_items** | [**Array&lt;POSTBillingPreviewCreditMemoItem&gt;**](POSTBillingPreviewCreditMemoItem.md) | An array of credit memo items returned as the result of the billing preivew request.  **Note:** The credit memo items are only available if you have Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  | [optional] 
**invoice_items** | [**Array&lt;POSTBillingPreviewInvoiceItem&gt;**](POSTBillingPreviewInvoiceItem.md) | An array of invoice items returned as the result of the billing preview request.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 


