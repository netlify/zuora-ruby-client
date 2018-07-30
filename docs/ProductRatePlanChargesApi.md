# Zuora::ProductRatePlanChargesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_delete_product_rate_plan_charge**](ProductRatePlanChargesApi.md#object_delete_product_rate_plan_charge) | **DELETE** /v1/object/product-rate-plan-charge/{id} | CRUD: Delete ProductRatePlanCharge
[**object_get_product_rate_plan_charge**](ProductRatePlanChargesApi.md#object_get_product_rate_plan_charge) | **GET** /v1/object/product-rate-plan-charge/{id} | CRUD: Retrieve ProductRatePlanCharge


# **object_delete_product_rate_plan_charge**
> ProxyDeleteResponse object_delete_product_rate_plan_charge(id, opts)

CRUD: Delete ProductRatePlanCharge



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ProductRatePlanChargesApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Delete ProductRatePlanCharge
  result = api_instance.object_delete_product_rate_plan_charge(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ProductRatePlanChargesApi->object_delete_product_rate_plan_charge: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyDeleteResponse**](ProxyDeleteResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_get_product_rate_plan_charge**
> ProxyGetProductRatePlanCharge object_get_product_rate_plan_charge(id, opts)

CRUD: Retrieve ProductRatePlanCharge



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ProductRatePlanChargesApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
}

begin
  #CRUD: Retrieve ProductRatePlanCharge
  result = api_instance.object_get_product_rate_plan_charge(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ProductRatePlanChargesApi->object_get_product_rate_plan_charge: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetProductRatePlanCharge**](ProxyGetProductRatePlanCharge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



