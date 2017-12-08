# Zuora::GETCreditMemoItemType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | The total amount of the credit memo item.  | [optional] 
**applied_amount** | **Float** | The applied amount of the credit memo item.  | [optional] 
**comment** | **String** | Comments about the credit memo item.  | [optional] 
**created_by_id** | **String** | The ID of the Zuora user who created the credit memo item.  | [optional] 
**created_date** | **DateTime** | The date and time when the credit memo item was created, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-01 15:31:10.  | [optional] 
**credit_tax_items** | [**Array&lt;GETCMTaxItemType&gt;**](GETCMTaxItemType.md) | Container for credit memo taxation items.  | [optional] 
**finance_information** | [**GETCreditMemoItemTypeFinanceInformation**](GETCreditMemoItemTypeFinanceInformation.md) |  | [optional] 
**id** | **String** | The ID of the credit memo item.  | [optional] 
**refund_amount** | **Float** | The amount of the refund on the credit memo item.  | [optional] 
**service_end_date** | **Date** | The service end date of the credit memo item.  | [optional] 
**service_start_date** | **Date** | The service start date of the credit memo item. If the associated charge is a one-time fee, this date is the date of that charge.  | [optional] 
**sku** | **String** | The SKU for the product associated with the credit memo item.  | [optional] 
**sku_name** | **String** | The name of the SKU.  | [optional] 
**source_item_id** | **String** | The ID of the source item.  | [optional] 
**source_item_type** | **String** | The type of the source item.  | [optional] 
**subscription_id** | **String** | The ID of the subscription associated with the credit memo item.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully. | [optional] 
**unapplied_amount** | **Float** | The unapplied amount of the credit memo item.  | [optional] 
**updated_by_id** | **String** | The ID of the Zuora user who last updated the credit memo item.  | [optional] 
**updated_date** | **DateTime** | The date and time when the credit memo item was last updated, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-02 15:36:10.  | [optional] 


