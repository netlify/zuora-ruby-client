# Zuora::GETInvoiceType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | Customer account ID.  | [optional] 
**account_name** | **String** | Customer account name.  | [optional] 
**account_number** | **String** | Customer account number.  | [optional] 
**amount** | **String** | Amount of the invoice before adjustments, discounts, and similar items.  | [optional] 
**balance** | **String** | Balance remaining due on the invoice (after adjustments, discounts, etc.)  | [optional] 
**body** | **String** | The REST URL of the invoice PDF file.  | [optional] 
**created_by** | **String** | User ID of the person who created the invoice. If a bill run generated the invoice, then this is the user ID of person who created the bill run.  | [optional] 
**credit_balance_adjustment_amount** | **String** |  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**due_date** | **Date** | Payment due date as _yyyy-mm-dd_.  | [optional] 
**id** | **String** | Invoice ID.  | [optional] 
**invoice_date** | **Date** | Invoice date as _yyyy-mm-dd_  | [optional] 
**invoice_files** | [**Array&lt;GETInvoiceFileType&gt;**](GETInvoiceFileType.md) | Information about the invoice PDF file:  | [optional] 
**invoice_items** | [**Array&lt;GETInvoicesInvoiceItemType&gt;**](GETInvoicesInvoiceItemType.md) | Information on one or more items on this invoice:  | [optional] 
**invoice_number** | **String** | Unique invoice ID, returned as a string.  | [optional] 
**invoice_target_date** | **Date** | Date through which charges on this invoice are calculated, as _yyyy-mm-dd_.  | [optional] 
**status** | **String** | Status of the invoice in the system - not the payment status, but the status of the invoice itself. Possible values are: &#x60;Posted&#x60;, &#x60;Draft&#x60;, &#x60;Canceled&#x60;, &#x60;Error&#x60;.  | [optional] 


