# SwaggerClient::POSTInvoiceCollectResponseType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount_collected** | **String** | Payment amount applied.  | [optional] 
**credit_memos** | [**Array&lt;POSTInvoiceCollectCreditMemosType&gt;**](POSTInvoiceCollectCreditMemosType.md) | Information on one or more credit memos associated with this operation.  | [optional] 
**invoices** | [**Array&lt;POSTInvoiceCollectInvoicesType&gt;**](POSTInvoiceCollectInvoicesType.md) | Information on one or more invoices associated with this operation.  | [optional] 
**payment_id** | **String** | Payment ID.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 


