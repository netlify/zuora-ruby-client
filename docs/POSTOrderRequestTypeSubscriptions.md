# Zuora::POSTOrderRequestTypeSubscriptions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**custom_fields** | [**ObjectCustomFields**](ObjectCustomFields.md) |  | [optional] 
**order_actions** | [**Array&lt;OrderActionRequest&gt;**](OrderActionRequest.md) | The actions to be applied to the subscription. Order actions will be stored with the sequence when it was provided in the request. | [optional] 
**subscription_number** | **String** | Leave this empty to represent new subscription creation. Specify a subscription number to update an existing subscription.  | [optional] 


