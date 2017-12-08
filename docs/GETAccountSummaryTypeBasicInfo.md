# Zuora::GETAccountSummaryTypeBasicInfo

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_number** | **String** | Account number.  | [optional] 
**additional_email_addresses** | **Array&lt;String&gt;** | A list of additional email addresses to receive emailed invoices.  | [optional] 
**balance** | **String** | Current outstanding balance.  | [optional] 
**batch** | **String** | The alias name given to a batch. A string of 50 characters or less.  | [optional] 
**bill_cycle_day** | **String** | Billing cycle day (BCD), the day of the month when a bill run generates invoices for the account.  | [optional] 
**currency** | **String** | A currency value.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**default_payment_method** | [**GETAccountSummaryTypeBasicInfoDefaultPaymentMethod**](GETAccountSummaryTypeBasicInfoDefaultPaymentMethod.md) |  | [optional] 
**id** | **String** | Account ID.  | [optional] 
**invoice_delivery_prefs_email** | **BOOLEAN** | Whether the customer wants to receive invoices through email.   | [optional] 
**invoice_delivery_prefs_print** | **BOOLEAN** | Whether the customer wants to receive printed invoices, such as through postal mail.  | [optional] 
**last_invoice_date** | **Date** | Date of the most recent invoice for the account; null if no invoice has ever been generated.  | [optional] 
**last_payment_amount** | **String** | Amount of the most recent payment collected for the account; null if no payment has ever been collected.  | [optional] 
**last_payment_date** | **Date** | Date of the most recent payment collected for the account. Null if no payment has ever been collected.  | [optional] 
**name** | **String** | Account name.  | [optional] 
**status** | **String** | Account status; possible values are: &#x60;Active&#x60;, &#x60;Draft&#x60;, &#x60;Canceled&#x60;.  | [optional] 
**tags** | **String** |  | [optional] 


