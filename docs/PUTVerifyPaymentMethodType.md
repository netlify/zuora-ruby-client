# Zuora::PUTVerifyPaymentMethodType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**gateway_options** | [**PUTVerifyPaymentMethodTypeGatewayOptions**](PUTVerifyPaymentMethodTypeGatewayOptions.md) |  | [optional] 
**payment_gateway_name** | **String** | The name of the payment gateway instance. If no value is specified for this field, the default payment gateway of the customer account will be used.  | [optional] 
**security_code** | **String** | The CVV or CVV2 security code for the credit card or debit card. To ensure PCI compliance, the value of this field is not stored and cannot be queried.  | [optional] 


