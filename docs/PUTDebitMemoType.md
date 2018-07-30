# Zuora::PUTDebitMemoType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**auto_pay** | **BOOLEAN** | Whether debit memos are automatically picked up for processing in the corresponding payment run.   By default, debit memos are automatically picked up for processing in the corresponding payment run.  | [optional] 
**comment** | **String** | Comments about the debit memo.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**due_date** | **Date** | The date by which the payment for the debit memo is due, in &#x60;yyyy-mm-dd&#x60; format.  | [optional] 
**effective_date** | **Date** | The date when the debit memo takes effect.  | [optional] 
**items** | [**Array&lt;PUTDebitMemoItemType&gt;**](PUTDebitMemoItemType.md) | Container for debit memo items.  | [optional] 
**reason_code** | **String** | A code identifying the reason for the transaction. The value must be an existing reason code or empty. If you do not specify a value, Zuora uses the default reason code  | [optional] 
**transferred_to_accounting** | **String** | Whether the debit memo is transferred to an external accounting system. Use this field for integration with accounting systems, such as NetSuite.  | [optional] 


