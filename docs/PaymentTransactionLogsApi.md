# Zuora::PaymentTransactionLogsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_get_payment_transaction_log**](PaymentTransactionLogsApi.md#object_get_payment_transaction_log) | **GET** /v1/object/payment-transaction-log/{id} | CRUD: Get payment transaction log


# **object_get_payment_transaction_log**
> ProxyGetPaymentTransactionLog object_get_payment_transaction_log(id, opts)

CRUD: Get payment transaction log

Retrieves information about a specific payment transaction log. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentTransactionLogsApi.new

id = 'id_example' # String | The ID of a payment transaction log. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Get payment transaction log
  result = api_instance.object_get_payment_transaction_log(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentTransactionLogsApi->object_get_payment_transaction_log: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of a payment transaction log.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyGetPaymentTransactionLog**](ProxyGetPaymentTransactionLog.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



