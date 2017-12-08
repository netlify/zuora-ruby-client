# Zuora::AmendResult

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amendment_ids** | **Array&lt;String&gt;** | A list of the IDs of the associated amendments. There can be as many as three amendment IDs. Use a comma to separate each amendment ID.  | [optional] 
**charge_metrics_data** | [**ChargeMetricsData**](ChargeMetricsData.md) |  | [optional] 
**errors** | [**Array&lt;Error&gt;**](Error.md) |  | [optional] 
**gateway_response** | **String** |  | [optional] 
**gateway_response_code** | **String** |  | [optional] 
**invoice_datas** | [**Array&lt;InvoiceData&gt;**](InvoiceData.md) |  | [optional] 
**invoice_id** | **String** |  | [optional] 
**payment_id** | **String** |  | [optional] 
**payment_transaction_number** | **String** |  | [optional] 
**subscription_id** | **String** |  | [optional] 
**success** | **BOOLEAN** |  | [optional] 
**total_delta_mrr** | **Float** |  | [optional] 
**total_delta_tcv** | **Float** |  | [optional] 


