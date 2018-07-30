# Zuora::CreateSubscription

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**invoice_separately** | **BOOLEAN** |  | [optional] 
**new_subscription_owner_account** | [**NewSubscriptionOwnerAccount**](NewSubscriptionOwnerAccount.md) |  | [optional] 
**notes** | **String** |  | [optional] 
**subscribe_to_rate_plans** | [**Array&lt;RatePlanOverride&gt;**](RatePlanOverride.md) |  | [optional] 
**subscription_number** | **String** | The subscription number for the new subscription. | [optional] 
**subscription_owner_account_number** | **String** | The subscription owner account number this subscription will be created under. It can be either the subscriptionOwnerAccountNumber or the newSubscriptionOwnerAccount info provided. It will return an error if both are specified.  | [optional] 
**terms** | [**Terms**](Terms.md) |  | [optional] 


