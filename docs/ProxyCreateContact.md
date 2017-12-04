# SwaggerClient::ProxyCreateContact

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** |  The Zuora account ID associated with this contact. This field is not required when you use the Subscribe call. This field is required for all other calls. **Character limit: **32 **Values: **a valid account ID  | 
**address1** | **String** |  The first line of the contact&#39;s address, which is often a street address or business name. **Character limit**: 255 **Values**: a string of 255 characters or fewer  | [optional] 
**address2** | **String** |  The second line of the contact&#39;s address. **Character limit**: 255 **Values**: a string of 255 characters or fewer  | [optional] 
**city** | **String** |  The city of the contact&#39;s address. **Character limit**: 40 **Values: **a string of 40 characters or fewer  | [optional] 
**country** | **String** |  The country of the contact&#39;s address.  | [optional] 
**county** | **String** |  The county. May optionally be used by Zuora Tax to calculate county tax. **Character limit**: 32 **Values**: a string of 32 characters or fewer  | [optional] 
**description** | **String** |  A description for the contact. **Character limit**: 100 **Values**: a string of 100 characters or fewer  | [optional] 
**fax** | **String** |  The contact&#39;s fax number. **Character limit**: 40 **Values**: a string of 40 characters or fewer  | [optional] 
**first_name** | **String** |  The contact&#39;s first name. **Character limit**: 100 **Values**: a string of the contact&#39;s first name  | 
**home_phone** | **String** |  The contact&#39;s home phone number. **Character limit**: 40 **Values**: a string of 40 characters or fewer  | [optional] 
**last_name** | **String** |  The contact&#39;s last name. **Character limit**: 100 **Values**: a string of 100 characters or fewer  | 
**mobile_phone** | **String** |  The contact&#39;s mobile phone number. **Character limit**: 40 **Values**: a string of 40 characters or fewer  | [optional] 
**nick_name** | **String** |  A nickname for the contact. **Character limit**: 100 **Values**: a string of 100 characters or fewer  | [optional] 
**other_phone** | **String** |  An additional phone number for the contact. **Character limit**: 40 **Values**: a string of 40 characters or fewer  | [optional] 
**other_phone_type** | **String** | The type of the &#x60;OtherPhone&#x60;. **Character limit**: 20 **Values**: &#x60;Work&#x60;, &#x60;Mobile&#x60;, &#x60;Home&#x60;, &#x60;Other&#x60;  | [optional] 
**personal_email** | **String** |  The contact&#39;s personal email address. **Character limit**: 80 **Values**: a string of 80 characters or fewer  | [optional] 
**postal_code** | **String** |  The zip code for the contact&#39;s address. **Character limit:** 20 **Values: **a string of 20 characters or fewer  | [optional] 
**state** | **String** |  The state or province of the contact&#39;s address.  | [optional] 
**tax_region** | **String** | If using Zuora Tax rules  | [optional] 
**work_email** | **String** |  The contact&#39;s business email address. **Character limit**: 80 **Values**: a string of 80 characters or fewer  | [optional] 
**work_phone** | **String** |  The contact&#39;s business phone number. **Character limit**: 40 **notes**: -- **Values**: a string of 40 characters or fewer  | [optional] 


