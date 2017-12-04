# SwaggerClient::POSTOrderPreviewRequestTypeSubscriptions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**custom_fields** | [**CustomFields**](CustomFields.md) |  | [optional] 
**order_actions** | [**Array&lt;OrderActionRequest&gt;**](OrderActionRequest.md) | The actions to be applied to the subscription. Order actions will be stored with the sequence when it was provided in the request. | [optional] 
**subscription_number** | **String** | Leave this field empty to represent new subscription creation, or specify a subscription number to update an existing subscription.  | [optional] 


