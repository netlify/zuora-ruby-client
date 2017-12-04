# SwaggerClient::GETAccountSummaryType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**basic_info** | [**GETAccountSummaryTypeBasicInfo**](GETAccountSummaryTypeBasicInfo.md) |  | [optional] 
**bill_to_contact** | [**GETAccountSummaryTypeBillToContact**](GETAccountSummaryTypeBillToContact.md) |  | [optional] 
**invoices** | [**Array&lt;GETAccountSummaryInvoiceType&gt;**](GETAccountSummaryInvoiceType.md) | Container for invoices. Only returns the last 6 invoices.  | [optional] 
**payments** | [**Array&lt;GETAccountSummaryPaymentType&gt;**](GETAccountSummaryPaymentType.md) | Container for payments. Only returns the last 6 payments.  | [optional] 
**sold_to_contact** | [**GETAccountSummaryTypeSoldToContact**](GETAccountSummaryTypeSoldToContact.md) |  | [optional] 
**subscriptions** | [**Array&lt;GETAccountSummarySubscriptionType&gt;**](GETAccountSummarySubscriptionType.md) | Container for subscriptions.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 
**tax_info** | [**GETAccountSummaryTypeTaxInfo**](GETAccountSummaryTypeTaxInfo.md) |  | [optional] 
**usage** | [**Array&lt;GETAccountSummaryUsageType&gt;**](GETAccountSummaryUsageType.md) | Container for usage data. Only returns the last 6 months of usage.  | [optional] 


