# SwaggerClient::CreditMemoFromChargeDetailType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**charge_id** | **String** | The ID of the product rate plan charge that the credit memo is created from.  | 
**comment** | **String** | Comments about the product rate plan charge.  | [optional] 
**finance_information** | [**CreditMemoFromChargeDetailTypeFinanceInformation**](CreditMemoFromChargeDetailTypeFinanceInformation.md) |  | [optional] 
**memo_item_amount** | **Float** | The amount of the credit memo item.  | [optional] 
**service_end_date** | **Date** | The service end date of the credit memo item. If not specified, the effective end date of the corresponding product rate plan will be used.  | [optional] 
**service_start_date** | **Date** | The service start date of the credit memo item. If not specified, the effective start date of the corresponding product rate plan will be used.  | [optional] 


