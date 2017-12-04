# SwaggerClient::POSTAccountTypeSoldToContact

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**address1** | **String** | First address line, 255 characters or less.  | [optional] 
**address2** | **String** | Second address line, 255 characters or less.  | [optional] 
**city** | **String** | City, 40 characters or less.  | [optional] 
**country** | **String** | Country; must be a valid country name or abbreviation. If using Zuora Tax, you must specify a country in the sold-to contact to calculate tax. A bill-to contact may be used if no sold-to contact is provided.  | [optional] 
**county** | **String** | County; 32 characters or less. May optionally be used by Zuora Tax to calculate county tax.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**fax** | **String** | Fax phone number, 40 characters or less.  | [optional] 
**first_name** | **String** | First name, 100 characters or less.  | 
**home_phone** | **String** | Home phone number, 40 characters or less.  | [optional] 
**last_name** | **String** | Last name, 100 characters or less.  | 
**mobile_phone** | **String** | Mobile phone number, 40 characters or less.  | [optional] 
**nickname** | **String** | Nickname for this contact  | [optional] 
**other_phone** | **String** | Other phone number, 40 characters or less.  | [optional] 
**other_phone_type** | **String** | Possible values are: &#x60;Work&#x60;, &#x60;Mobile&#x60;, &#x60;Home&#x60;, &#x60;Other&#x60;.  | [optional] 
**personal_email** | **String** | Personal email address, 80 characters or less.  | [optional] 
**state** | **String** | State; must be a valid state or province name or 2-character abbreviation. If using Zuora Tax, be aware that Zuora Tax requires a state (in the US) or province (in Canada) in this field for the sold-to contact to calculate tax, and that a bill-to contact may be used if no sold-to contact is provided.  | [optional] 
**tax_region** | **String** | If using Zuora Tax, a region string as optionally defined in your tax rules. Not required.  | [optional] 
**work_email** | **String** | Work email address, 80 characters or less.  | [optional] 
**work_phone** | **String** | Work phone number, 40 characters or less.  | [optional] 
**zip_code** | **String** | Zip code, 20 characters or less.  | [optional] 


