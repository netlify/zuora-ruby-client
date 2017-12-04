# SwaggerClient::PUTCreditMemoType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**auto_apply_upon_posting** | **BOOLEAN** | Whether the credit memo automatically applies to the invoice upon posting.  | [optional] 
**comment** | **String** | Comments about the credit memo.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**effective_date** | **Date** | The date when the credit memo takes effect.  | [optional] 
**exclude_from_auto_apply_rules** | **BOOLEAN** | Whether the credit memo is excluded from the rule of automatically applying credit memos to invoices.  | [optional] 
**items** | [**Array&lt;PUTCreditMemoItemType&gt;**](PUTCreditMemoItemType.md) | Container for credit memo items.  | [optional] 
**reason_code** | **String** | A code identifying the reason for the transaction. The value must be an existing reason code or empty. If you do not specify a value, Zuora uses the default reason code.  | [optional] 
**transferred_to_accounting** | **String** | Whether the credit memo is transferred to an external accounting system. Use this field for integration with accounting systems, such as NetSuite.  | [optional] 


