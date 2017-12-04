# SwaggerClient::PaymentInvoiceApplicationApplyRequestType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | The amount that is applied from the payment to the invoice.  | 
**invoice_id** | **String** | The unique ID of the invoice that the payment is applied to.  | [optional] 
**items** | [**Array&lt;PaymentInvoiceApplicationItemApplyRequestType&gt;**](PaymentInvoiceApplicationItemApplyRequestType.md) | Container for invoice items.  **Note:** The Invoice Item Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  | [optional] 


