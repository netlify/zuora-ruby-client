# Zuora::DebitMemoFromInvoiceType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**auto_pay** | **BOOLEAN** | Whether debit memos are automatically picked up for processing in the corresponding payment run.   By default, debit memos are automatically picked up for processing in the corresponding payment run.  | [optional] 
**comment** | **String** | Comments about the debit memo.   | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**effective_date** | **Date** | The date when the debit memo takes effect.  | [optional] 
**invoice_id** | **String** | The ID of the invoice that the debit memo is created from.  | [optional] 
**items** | [**Array&lt;DebitMemoItemFromInvoiceItemType&gt;**](DebitMemoItemFromInvoiceItemType.md) | Container for items.  | [optional] 
**reason_code** | **String** | A code identifying the reason for the transaction. The value must be an existing reason code or empty. If you do not specify a value, Zuora uses the default reason code.  | [optional] 
**tax_auto_calculation** | **BOOLEAN** | Whether to automatically calculate taxes in the debit memo.  | [optional] [default to true]


