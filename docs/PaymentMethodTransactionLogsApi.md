# Zuora::PaymentMethodTransactionLogsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_get_payment_method_transaction_log**](PaymentMethodTransactionLogsApi.md#object_get_payment_method_transaction_log) | **GET** /v1/object/payment-method-transaction-log/{id} | CRUD: Retrieve PaymentMethodTransactionLog


# **object_get_payment_method_transaction_log**
> ProxyGetPaymentMethodTransactionLog object_get_payment_method_transaction_log(id, opts)

CRUD: Retrieve PaymentMethodTransactionLog



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodTransactionLogsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
}

begin
  #CRUD: Retrieve PaymentMethodTransactionLog
  result = api_instance.object_get_payment_method_transaction_log(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentMethodTransactionLogsApi->object_get_payment_method_transaction_log: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetPaymentMethodTransactionLog**](ProxyGetPaymentMethodTransactionLog.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



