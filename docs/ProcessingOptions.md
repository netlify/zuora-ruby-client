# Zuora::ProcessingOptions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**billing_options** | [**BillingOptions**](BillingOptions.md) |  | [optional] 
**collect_payment** | **BOOLEAN** | Indicates if the current request needs to collect payments. This value can not be &#39;true&#39; when &#39;runBilling&#39; flag is &#39;false&#39;. | [optional] 
**run_billing** | **BOOLEAN** | Indicates if the current request needs to generate an invoice. The invoice will be generated against all subscriptions included in this order. | [optional] 


