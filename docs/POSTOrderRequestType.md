# Zuora::POSTOrderRequestType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**custom_fields** | [**CustomFields**](CustomFields.md) |  | [optional] 
**existing_account_number** | **String** | The account number that this order will be created under. It can be either the accountNumber or the account info provided. It will return an error if both are specified. Note that the invoice owner account of the subscriptions included in this order should be the same with order&#39;s account.  | [optional] 
**new_account** | [**Account**](Account.md) |  | [optional] 
**order_date** | **Date** | The date when the order is signed. All the order actions under this order will use this order date as the contract effective date. | 
**order_number** | **String** | The order number of the new order. If not provided, system will auto-generate a number for this order. | [optional] 
**processing_options** | [**ProcessingOptions**](ProcessingOptions.md) |  | [optional] 
**subscriptions** | [**Array&lt;POSTOrderRequestTypeSubscriptions&gt;**](POSTOrderRequestTypeSubscriptions.md) | Each item includes a set of order actions, which will be applied to the same base subscription. | 


