# Zuora::GETAccountTypeBillingAndPayment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**additional_email_addresses** | **Array&lt;String&gt;** | A list of additional email addresses to receive emailed invoices.  | [optional] 
**bill_cycle_day** | **String** | Billing cycle day (BCD), the day of the month when a bill run generates invoices for the account.  | [optional] 
**currency** | **String** | A currency defined in the web-based UI administrative settings.  | [optional] 
**invoice_delivery_prefs_email** | **BOOLEAN** | Whether the customer wants to receive invoices through email.   | [optional] 
**invoice_delivery_prefs_print** | **BOOLEAN** | Whether the customer wants to receive printed invoices, such as through postal mail.  | [optional] 
**payment_gateway** | **String** | The name of the payment gateway instance. If null or left unassigned, the Account will use the Default Gateway.  | [optional] 
**payment_term** | **String** | A payment-terms indicator defined in the web-based UI administrative settings, e.g., \&quot;Net 30\&quot;.  | [optional] 


