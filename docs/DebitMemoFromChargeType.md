# Zuora::DebitMemoFromChargeType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | The ID of the account associated with the debit memo.  | 
**auto_pay** | **BOOLEAN** | Whether debit memos are automatically picked up for processing in the corresponding payment run.   By default, debit memos are automatically picked up for processing in the corresponding payment run.  | [optional] 
**charges** | [**Array&lt;DebitMemoFromChargeDetailType&gt;**](DebitMemoFromChargeDetailType.md) | Container for product rate plan charges.  | [optional] 
**comment** | **String** | Comments about the debit memo.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**effective_date** | **Date** | The date when the debit memo takes effect.  | [optional] 
**reason_code** | **String** | A code identifying the reason for the transaction. The value must be an existing reason code or empty. If you do not specify a value, Zuora uses the default reason code.  | [optional] 


