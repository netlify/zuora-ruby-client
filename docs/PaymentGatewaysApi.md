# Zuora::PaymentGatewaysApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_paymentgateways**](PaymentGatewaysApi.md#g_et_paymentgateways) | **GET** /v1/paymentgateways | Get payment gateways


# **g_et_paymentgateways**
> GETPaymentGatwaysResponse g_et_paymentgateways(opts)

Get payment gateways

Retrieves the basic information about all the payment gateways. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentGatewaysApi.new

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get payment gateways
  result = api_instance.g_et_paymentgateways(opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentGatewaysApi->g_et_paymentgateways: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GETPaymentGatwaysResponse**](GETPaymentGatwaysResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



