# Zuora::GETCMTaxItemType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**applied_amount** | **Float** | The applied amount of the credit memo taxation item.  | [optional] 
**exempt_amount** | **Float** | The amount of taxes or VAT for which the customer has an exemption.  | [optional] 
**finance_information** | [**GETCMTaxItemTypeFinanceInformation**](GETCMTaxItemTypeFinanceInformation.md) |  | [optional] 
**id** | **String** | The ID of the credit memo taxation item.  | [optional] 
**jurisdiction** | **String** | The jurisdiction that applies the tax or VAT. This value is typically a state, province, county, or city.  | [optional] 
**location_code** | **String** | The identifier for the location based on the value of the &#x60;taxCode&#x60; field.  | [optional] 
**name** | **String** | The name of the credit memo taxation item.  | [optional] 
**refund_amount** | **Float** | The amount of the refund on the credit memo taxation item.  | [optional] 
**source_tax_item_id** | **String** | The ID of the source taxation item.  | [optional] 
**tax_amount** | **Float** | The amount of taxation.  | [optional] 
**tax_code** | **String** | The tax code identifies which tax rules and tax rates to apply to a specific credit memo.  | [optional] 
**tax_code_description** | **String** | The description of the tax code.  | [optional] 
**tax_date** | **Date** | The date that the tax is applied to the credit memo, in &#x60;yyyy-mm-dd&#x60; format.  | [optional] 
**tax_rate** | **Float** | The tax rate applied to the credit memo.  | [optional] 
**tax_rate_description** | **String** | The description of the tax rate.  | [optional] 
**tax_rate_type** | **String** | The type of the tax rate.  | [optional] 
**unapplied_amount** | **Float** | The unapplied amount of the credit memo taxation item.  | [optional] 


