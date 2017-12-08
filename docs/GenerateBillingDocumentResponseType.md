# Zuora::GenerateBillingDocumentResponseType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**credit_memos** | [**Array&lt;CreditMemoResponseType&gt;**](CreditMemoResponseType.md) | Container for generated credit memos.  **Note:** This container is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  | [optional] 
**invoices** | [**Array&lt;InvoiceResponseType&gt;**](InvoiceResponseType.md) | Container for generated invoics.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully. | [optional] 


