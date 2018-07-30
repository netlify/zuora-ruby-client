# Zuora::ChargeOverride

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**billing** | [**BillingOverride**](BillingOverride.md) |  | [optional] 
**charge_number** | **String** |  | [optional] 
**custom_fields** | [**ObjectCustomFields**](ObjectCustomFields.md) |  | [optional] 
**description** | **String** |  | [optional] 
**end_date** | [**EndConditions**](EndConditions.md) |  | [optional] 
**pricing** | [**PricingOverride**](PricingOverride.md) |  | [optional] 
**product_rate_plan_charge_id** | **String** |  | 
**start_date** | [**TriggerParams**](TriggerParams.md) |  | [optional] 
**unique_token** | **String** | A unique string to represent the rate plan charge in the order. The unique token is used to perform multiple actions against a newly added rate plan. For example, if you want to add and update a product in the same order, you would assign a unique token to the product rate plan when added and use that token in future order actions. | [optional] 


