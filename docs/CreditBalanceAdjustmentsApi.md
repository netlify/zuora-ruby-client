# Zuora::CreditBalanceAdjustmentsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_get_credit_balance_adjustment**](CreditBalanceAdjustmentsApi.md#object_get_credit_balance_adjustment) | **GET** /v1/object/credit-balance-adjustment/{id} | CRUD: Retrieve CreditBalanceAdjustment


# **object_get_credit_balance_adjustment**
> ProxyGetCreditBalanceAdjustment object_get_credit_balance_adjustment(id, opts)

CRUD: Retrieve CreditBalanceAdjustment



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditBalanceAdjustmentsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
}

begin
  #CRUD: Retrieve CreditBalanceAdjustment
  result = api_instance.object_get_credit_balance_adjustment(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditBalanceAdjustmentsApi->object_get_credit_balance_adjustment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetCreditBalanceAdjustment**](ProxyGetCreditBalanceAdjustment.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



