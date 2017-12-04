# SwaggerClient::POSTBillingPreviewCreditMemoItem

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **String** | The amount of the charge. This amount doesn&#39;t include taxes regardless if the charge&#39;s tax mode is inclusive or exclusive.  | [optional] 
**charge_date** | **DateTime** | The date when the credit memo item is created.  | [optional] 
**charge_number** | **String** | Number of the charge.  | [optional] 
**charge_type** | **String** | The type of charge.   Possible values are &#x60;OneTime&#x60;, &#x60;Recurring&#x60;, and &#x60;Usage&#x60;.  | [optional] 
**comment** | **String** | Comment of the credit memo item.  | [optional] 
**id** | **String** | Credit memo item id.  | [optional] 
**processing_type** | **String** | Identifies the kind of charge.   Possible values: * charge * discount * prepayment * tax  | [optional] 
**quantity** | **String** | Quantity of this item, in the configured unit of measure for the charge.  | [optional] 
**rate_plan_charge_id** | **String** | Id of the rate plan charge associated with this item.  | [optional] 
**service_end_date** | **Date** | End date of the service period for this item, i.e., the last day of the service period, in yyyy-mm-dd format.  | [optional] 
**service_start_date** | **Date** | Start date of the service period for this item, in yyyy-mm-dd format. If the charge is a one-time fee, this is the date of that charge.  | [optional] 
**sku** | **String** | Unique SKU for the product associated with this item.  | [optional] 
**sku_name** | **String** | Name of the unique SKU for the product associated with this item.  | [optional] 
**subscription_id** | **String** | ID of the subscription associated with this item.  | [optional] 
**subscription_number** | **String** | Name of the subscription associated with this item.  | [optional] 
**unit_of_measure** | **String** | Unit used to measure consumption.  | [optional] 


