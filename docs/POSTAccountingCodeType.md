# SwaggerClient::POSTAccountingCodeType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**gl_account_name** | **String** | Name of the account in your general ledger.  Field only available if you have Zuora Finance enabled. Maximum of 255 characters.  | [optional] 
**gl_account_number** | **String** | Account number in your general ledger.  Field only available if you have Zuora Finance enabled. Maximum of 255 characters.  | [optional] 
**name** | **String** | Name of the accounting code.  Accounting code name must be unique. Maximum of 100 characters.  | 
**notes** | **String** | Maximum of 2,000 characters.  | [optional] 
**type** | **String** | Accounting code type. You cannot create new accounting codes of type &#x60;AccountsReceivable&#x60;.   Note that &#x60;On-Account Receivable&#x60; is only available if you enable the Advanced AR Settlement feature.   | 


