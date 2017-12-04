# SwaggerClient::GETAccountSummaryPaymentType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**effective_date** | **Date** | Effective date as &#x60;yyyy-mm-dd&#x60;.  | [optional] 
**id** | **String** | Payment ID.  | [optional] 
**paid_invoices** | [**Array&lt;GETAccountSummaryPaymentInvoiceType&gt;**](GETAccountSummaryPaymentInvoiceType.md) | Container for paid invoices for this subscription.  | [optional] 
**payment_number** | **String** | Payment number.  | [optional] 
**payment_type** | **String** | Payment type; possible values are: &#x60;External&#x60;, &#x60;Electronic&#x60;.  | [optional] 
**status** | **String** | Payment status. Possible values are: &#x60;Draft&#x60;, &#x60;Processing&#x60;, &#x60;Processed&#x60;, &#x60;Error&#x60;, &#x60;Voided&#x60;, &#x60;Canceled&#x60;, &#x60;Posted&#x60;.  | [optional] 


