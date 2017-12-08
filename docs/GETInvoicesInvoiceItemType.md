# Zuora::GETInvoicesInvoiceItemType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**charge_amount** | **String** | The amount of the charge. This amount doesn&#39;t include taxes regardless if the charge&#39;s tax mode is inclusive or exclusive.  | [optional] 
**charge_description** | **String** | Description of the charge.  | [optional] 
**charge_id** | **String** | ID of the charge.  | [optional] 
**charge_name** | **String** | Name of the charge.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**id** | **String** | Item ID.  | [optional] 
**product_name** | **String** | Name of the product associated with this item.  | [optional] 
**quantity** | **String** | Quantity of this item, in the configured unit of measure for the charge.  | [optional] 
**service_end_date** | **Date** | End date of the service period for this item, i.e., the last day of the service period, as _yyyy-mm-dd_.  | [optional] 
**service_start_date** | **Date** | Start date of the service period for this item, as _yyyy-mm-dd_. For a one-time fee item, the date of the charge.  | [optional] 
**subscription_id** | **String** | ID of the subscription for this item.  | [optional] 
**subscription_name** | **String** | Name of the subscription for this item.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 
**tax_amount** | **String** | Tax applied to the charge.  | [optional] 
**unit_of_measure** | **String** | Unit used to measure consumption.  | [optional] 


