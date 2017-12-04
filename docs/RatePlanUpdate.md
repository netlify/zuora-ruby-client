# SwaggerClient::RatePlanUpdate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**charge_updates** | [**Array&lt;ChargeUpdate&gt;**](ChargeUpdate.md) |  | [optional] 
**custom_fields** | [**CustomFields**](CustomFields.md) |  | [optional] 
**rate_plan_id** | **String** | The id of the rate plan to be updated. It can be the latest version or any history version id.  | [optional] 
**specific_update_date** | **Date** | Used for the &#39;update before update&#39; and &#39;update before remove&#39; cases. | [optional] 
**unique_token** | **String** | A unique string to represent the rate plan charge in the order. The unique token is used to perform multiple actions against a newly added rate plan. For example, if you want to add and update a product in the same order, you would assign a unique token to the product rate plan when added and use that token in future order actions.  | [optional] 


