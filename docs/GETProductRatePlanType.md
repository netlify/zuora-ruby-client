# SwaggerClient::GETProductRatePlanType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**description** | **String** | Rate plan description.  | [optional] 
**effective_end_date** | **Date** | Final date the rate plan is active, as &#x60;yyyy-mm-dd&#x60;. After this date, the rate plan status is &#x60;Expired&#x60;.  | [optional] 
**effective_start_date** | **Date** | First date the rate plan is active (i.e., available to be subscribed to), as &#x60;yyyy-mm-dd&#x60;.  Before this date, the status is &#x60;NotStarted&#x60;.  | [optional] 
**id** | **String** | Unique product rate-plan charge ID.  | [optional] 
**name** | **String** | Name of the product rate-plan charge. (Not required to be unique.)  | [optional] 
**product_rate_plan_charges** | [**Array&lt;GETProductRatePlanChargeType&gt;**](GETProductRatePlanChargeType.md) | Field attributes describing the product rate plan charges:  | [optional] 
**status** | **String** | Possible vales are: &#x60;Active&#x60;, &#x60;Expired&#x60;, &#x60;NotStarted&#x60;.  | [optional] 


