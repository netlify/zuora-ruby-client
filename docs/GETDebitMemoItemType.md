# Zuora::GETDebitMemoItemType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | The amount of the debit memo item.  | [optional] 
**balance** | **Float** | The balance of the debit memo item.  | [optional] 
**be_applied_amount** | **Float** | The applied amount of the debit memo item.  | [optional] 
**comment** | **String** | Comments about the debit memo item.  | [optional] 
**created_by_id** | **String** | The ID of the Zuora user who created the debit memo item.  | [optional] 
**created_date** | **DateTime** | The date and time when the debit memo item was created, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-01 15:31:10.  | [optional] 
**finance_information** | [**GETDebitMemoItemTypeFinanceInformation**](GETDebitMemoItemTypeFinanceInformation.md) |  | [optional] 
**id** | **String** | The ID of the debit memo item.  | [optional] 
**service_end_date** | **Date** | The end date of the service period associated with this debit memo item. Service ends one second before the date specified in this field.  | [optional] 
**service_start_date** | **Date** | The start date of the service period associated with this debit memo item. If the associated charge is a one-time fee, this date is the date of that charge.  | [optional] 
**sku** | **String** | The SKU for the product associated with the debit memo item.  | [optional] 
**sku_name** | **String** | The name of the SKU.  | [optional] 
**source_item_id** | **String** | The ID of the source item.  | [optional] 
**source_item_type** | **String** | The type of the source item.   | [optional] 
**subscription_id** | **String** | The ID of the subscription associated with the debit memo item.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully. | [optional] 
**tax_items** | [**Array&lt;GETDMTaxItemType&gt;**](GETDMTaxItemType.md) | Container for debit memo taxation items.  | [optional] 
**updated_by_id** | **String** | The ID of the Zuora user who last updated the debit memo item.  | [optional] 
**updated_date** | **DateTime** | The date and time when the debit memo item was last updated, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-02 15:36:10.  | [optional] 


