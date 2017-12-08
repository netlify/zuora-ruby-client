# Zuora::POSTSubscriptionPreviewTypePreviewAccountInfoBillToContact

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**city** | **String** | The city of the bill-to address. The value should be 40 characters or less.  | [optional] 
**country** | **String** | The country of the bill-to address. The value must be a valid country name or abbreviation.  **Note:** You must specify this field if you are using Zuora Tax for this account.  | [optional] 
**county** | **String** | The county of the bill-to address. The value should be 32 characters or less.  | [optional] 
**state** | **String** | The state of the bill-to address. The value must be a valid state or province name or 2-character abbreviation.  **Note:** You must specify this field if you are using Zuora Tax for this account and the country is &#x60;USA&#x60; or &#x60;Canada&#x60;.  | [optional] 
**tax_region** | **String** | If using Zuora Tax, a region string as optionally defined in your tax rules.  | [optional] 
**zip_code** | **String** | The zip code of the bill-to address. The value should be 20 characters or less.  | [optional] 


