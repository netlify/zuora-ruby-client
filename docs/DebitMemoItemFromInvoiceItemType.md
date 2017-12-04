# SwaggerClient::DebitMemoItemFromInvoiceItemType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | The amount of the invoice item.  | 
**comment** | **String** | Comments about the invoice item.  | [optional] 
**finance_information** | [**DebitMemoItemFromInvoiceItemTypeFinanceInformation**](DebitMemoItemFromInvoiceItemTypeFinanceInformation.md) |  | [optional] 
**invoice_item_id** | **String** | The ID of the invoice item.  | [optional] 
**service_end_date** | **Date** | The service end date of the debit memo item.  | [optional] 
**service_start_date** | **Date** | The service start date of the debit memo item.   | [optional] 
**sku_name** | **String** | The name of the SKU.  | 
**tax_items** | [**Array&lt;DebitMemoTaxItemFromInvoiceTaxItemType&gt;**](DebitMemoTaxItemFromInvoiceTaxItemType.md) | Container for taxation items.  | [optional] 
**unit_of_measure** | **String** | The definable unit that you measure when determining charges.  | [optional] 


