# SwaggerClient::GETSubscriptionRatePlanType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**id** | **String** | Rate plan ID.  | [optional] 
**last_change_type** | **String** | The last amendment on the rate plan.  Possible Values:  * &#x60;Add&#x60; * &#x60;Update&#x60; * &#x60;Remove&#x60;  | [optional] 
**product_id** | **String** |  | [optional] 
**product_name** | **String** |  | [optional] 
**product_rate_plan_id** | **String** |  | [optional] 
**product_sku** | **String** | The unique SKU for the product.  | [optional] 
**rate_plan_charges** | [**Array&lt;GETSubscriptionRatePlanChargesType&gt;**](GETSubscriptionRatePlanChargesType.md) | Container for one or more charges.  | [optional] 
**rate_plan_name** | **String** | Name of the rate plan.  | [optional] 
**subscription_product_features** | [**Array&lt;GETSubscriptionProductFeatureType&gt;**](GETSubscriptionProductFeatureType.md) | Container for one or more features.   Only available when the following settings are enabled:  * The Entitlements feature in your tenant.  * The Enable Feature Specification in Product and Subscriptions setting in Zuora Billing Settings | [optional] 


