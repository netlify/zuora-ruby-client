# Zuora::Order

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**currency** | **String** |  | [optional] 
**custom_fields** | [**ObjectCustomFields**](ObjectCustomFields.md) |  | [optional] 
**existing_account_number** | **String** |  | [optional] 
**order_date** | **Date** |  | [optional] 
**order_number** | **String** |  | [optional] 
**status** | **String** |  | [optional] 
**subscriptions** | [**Array&lt;OrderSubscriptions&gt;**](OrderSubscriptions.md) | Represents a processed subscription, including the origin request (order actions) that create this version of subscription and the processing result (order metrics). The reference part in the request will be overridden with the info in the new subscription version. | [optional] 


