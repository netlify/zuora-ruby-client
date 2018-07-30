# Zuora::ProductRatePlansApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_delete_product_rate_plan**](ProductRatePlansApi.md#object_delete_product_rate_plan) | **DELETE** /v1/object/product-rate-plan/{id} | CRUD: Delete ProductRatePlan
[**object_get_product_rate_plan**](ProductRatePlansApi.md#object_get_product_rate_plan) | **GET** /v1/object/product-rate-plan/{id} | CRUD: Retrieve ProductRatePlan
[**object_post_product_rate_plan**](ProductRatePlansApi.md#object_post_product_rate_plan) | **POST** /v1/object/product-rate-plan | CRUD: Create ProductRatePlan
[**object_put_product_rate_plan**](ProductRatePlansApi.md#object_put_product_rate_plan) | **PUT** /v1/object/product-rate-plan/{id} | CRUD: Update ProductRatePlan


# **object_delete_product_rate_plan**
> ProxyDeleteResponse object_delete_product_rate_plan(id, opts)

CRUD: Delete ProductRatePlan



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ProductRatePlansApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Delete ProductRatePlan
  result = api_instance.object_delete_product_rate_plan(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ProductRatePlansApi->object_delete_product_rate_plan: #{e}"
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



# **object_get_product_rate_plan**
> ProxyGetProductRatePlan object_get_product_rate_plan(id, opts)

CRUD: Retrieve ProductRatePlan



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ProductRatePlansApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
}

begin
  #CRUD: Retrieve ProductRatePlan
  result = api_instance.object_get_product_rate_plan(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ProductRatePlansApi->object_get_product_rate_plan: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetProductRatePlan**](ProxyGetProductRatePlan.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_post_product_rate_plan**
> ProxyCreateOrModifyResponse object_post_product_rate_plan(create_request, opts)

CRUD: Create ProductRatePlan



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ProductRatePlansApi.new

create_request = Zuora::ProxyCreateProductRatePlan.new # ProxyCreateProductRatePlan | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Create ProductRatePlan
  result = api_instance.object_post_product_rate_plan(create_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ProductRatePlansApi->object_post_product_rate_plan: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_request** | [**ProxyCreateProductRatePlan**](ProxyCreateProductRatePlan.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_put_product_rate_plan**
> ProxyCreateOrModifyResponse object_put_product_rate_plan(id, modify_request, opts)

CRUD: Update ProductRatePlan



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ProductRatePlansApi.new

id = 'id_example' # String | Object id

modify_request = Zuora::ProxyModifyProductRatePlan.new # ProxyModifyProductRatePlan | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Update ProductRatePlan
  result = api_instance.object_put_product_rate_plan(id, modify_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ProductRatePlansApi->object_put_product_rate_plan: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifyProductRatePlan**](ProxyModifyProductRatePlan.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



