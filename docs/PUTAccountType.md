# Zuora::PUTAccountType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**additional_email_addresses** | **Array&lt;String&gt;** | A list of additional email addresses to receive emailed invoices. Use a comma to separate each email address.  **Note:** Invoices are emailed to the email addresses specified in this field only when the &#x60;invoiceDeliveryPrefsEmail&#x60; field is &#x60;true&#x60;.  | [optional] 
**auto_pay** | **BOOLEAN** | Specifies whether future payments are to be automatically billed when they are due. Possible values are: &#x60;true&#x60;, &#x60;false&#x60;.  | [optional] 
**batch** | **String** | The alias name given to a batch. A string of 50 characters or less.  | [optional] 
**bill_to_contact** | [**PUTAccountTypeBillToContact**](PUTAccountTypeBillToContact.md) |  | [optional] 
**communication_profile_id** | **String** | The ID of a communication profile.  | [optional] 
**crm_id** | **String** | CRM account ID for the account, up to 100 characters.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**invoice_delivery_prefs_email** | **BOOLEAN** | Whether the customer wants to receive invoices through email.   The default value is &#x60;false&#x60;.  | [optional] 
**invoice_delivery_prefs_print** | **BOOLEAN** | Whether the customer wants to receive printed invoices, such as through postal mail.  The default value is &#x60;false&#x60;.  | [optional] 
**invoice_template_id** | **String** | Invoice template ID, configured in Billing Settings in the Zuora UI.  | [optional] 
**name** | **String** | Account name, up to 255 characters.  | [optional] 
**notes** | **String** | A string of up to 65,535 characters.  | [optional] 
**parent_id** | **String** | Identifier of the parent customer account for this Account object. The length is 32 characters. Use this field if you have customer hierarchy enabled. | [optional] 
**payment_gateway** | **String** | The name of the payment gateway instance. If null or left unassigned, the Account will use the Default Gateway.  | [optional] 
**sales_rep** | **String** | The name of the sales representative associated with this account, if applicable. Maximum of 50 characters. | [optional] 
**sold_to_contact** | [**PUTAccountTypeSoldToContact**](PUTAccountTypeSoldToContact.md) |  | [optional] 
**tagging** | **String** |  | [optional] 
**tax_info** | [**POSTAccountTypeTaxInfo**](POSTAccountTypeTaxInfo.md) |  | [optional] 


