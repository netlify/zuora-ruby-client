# SwaggerClient::ChargeUpdate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**billing** | [**BillingUpdate**](BillingUpdate.md) |  | [optional] 
**charge_number** | **String** | Read only. Identifies the charge to be updated.  | [optional] 
**custom_fields** | [**CustomFields**](CustomFields.md) |  | [optional] 
**description** | **String** |  | [optional] 
**effective_date** | [**TriggerParams**](TriggerParams.md) |  | [optional] 
**pricing** | [**PricingUpdate**](PricingUpdate.md) |  | [optional] 
**unique_token** | **String** | description: |   A unique string to represent the rate plan charge in the order. The unique token is used to perform multiple actions against a newly added rate plan. For example, if you want to add and update a product in the same order, you would assign a unique token to the product rate plan when added and use that token in future order actions.  | [optional] 


