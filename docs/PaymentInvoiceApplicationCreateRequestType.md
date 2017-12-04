# SwaggerClient::PaymentInvoiceApplicationCreateRequestType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | The amount of the payment associated with the invoice.  | 
**invoice_id** | **String** | The unique ID of the invoice that the payment is created on.  | [optional] 
**items** | [**Array&lt;PaymentInvoiceApplicationItemCreateRequestType&gt;**](PaymentInvoiceApplicationItemCreateRequestType.md) | Container for invoice items.  **Note:** The Invoice Item Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  | [optional] 


