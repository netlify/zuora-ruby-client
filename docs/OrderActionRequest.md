# Zuora::OrderActionRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**add_product** | [**RatePlanOverride**](RatePlanOverride.md) |  | [optional] 
**cancel_subscription** | [**CancelSubscription**](CancelSubscription.md) |  | [optional] 
**create_subscription** | [**CreateSubscription**](CreateSubscription.md) |  | [optional] 
**custom_fields** | [**ObjectCustomFields**](ObjectCustomFields.md) |  | [optional] 
**owner_transfer** | [**OwnerTransfer**](OwnerTransfer.md) |  | [optional] 
**remove_product** | [**RemoveProduct**](RemoveProduct.md) |  | [optional] 
**terms_and_conditions** | [**TermsAndConditions**](TermsAndConditions.md) |  | [optional] 
**trigger_dates** | [**TriggerDates**](TriggerDates.md) |  | [optional] 
**type** | **String** | Type of the order action. For each specific type of order actions, corresponding parameters need to be specified. For example, if the &#39;updateProduct&#39; node provided for the &#39;AddProduct&#39; type, an error response will return. The &#39;RenewSubscription&#39; type does not require any parameter. | 
**update_product** | [**RatePlanUpdate**](RatePlanUpdate.md) |  | [optional] 


