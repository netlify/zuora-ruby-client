# SwaggerClient::POSTJournalEntryItemType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accounting_code_name** | **String** | Name of the accounting code.  | 
**accounting_code_type** | **String** | Accounting code type. This field is required if &#x60;accountingCodeName&#x60; is not unique.  Note that &#x60;On-Account Receivable&#x60; is only available if you enable the Advanced AR Settlement feature.   | [optional] 
**amount** | **String** | Journal entry item amount in transaction currency.  | 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**home_currency_amount** | **String** | Journal entry item amount in home currency.  This field is required if you have set your home currency for foreign currency conversion. Otherwise, do not pass this field.  | [optional] 
**type** | **String** | Type of journal entry item.  | 


