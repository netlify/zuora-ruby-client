# Zuora::TaxationItemsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**d_elete_taxation_item**](TaxationItemsApi.md#d_elete_taxation_item) | **DELETE** /v1/taxationitems/{id} | Delete taxation item
[**g_et_taxation_item**](TaxationItemsApi.md#g_et_taxation_item) | **GET** /v1/taxationitems/{id} | Get taxation item 
[**object_delete_taxation_item**](TaxationItemsApi.md#object_delete_taxation_item) | **DELETE** /v1/object/taxation-item/{id} | CRUD: Delete TaxationItem
[**object_get_taxation_item**](TaxationItemsApi.md#object_get_taxation_item) | **GET** /v1/object/taxation-item/{id} | CRUD: Retrieve TaxationItem
[**object_post_taxation_item**](TaxationItemsApi.md#object_post_taxation_item) | **POST** /v1/object/taxation-item | CRUD: Create TaxationItem
[**object_put_taxation_item**](TaxationItemsApi.md#object_put_taxation_item) | **PUT** /v1/object/taxation-item/{id} | CRUD: Update TaxationItem
[**p_ut_taxation_item**](TaxationItemsApi.md#p_ut_taxation_item) | **PUT** /v1/taxationitems/{id} | Update taxation item


# **d_elete_taxation_item**
> CommonResponseType d_elete_taxation_item(id, opts)

Delete taxation item

Deletes a specific taxation item by ID. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::TaxationItemsApi.new

id = 'id_example' # String | The unique ID of a taxation item. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Delete taxation item
  result = api_instance.d_elete_taxation_item(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling TaxationItemsApi->d_elete_taxation_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique ID of a taxation item.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_taxation_item**
> GETTaxationItemType g_et_taxation_item(id, opts)

Get taxation item 

Retrieves the information about a specific taxation item by ID. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::TaxationItemsApi.new

id = 'id_example' # String | The unique ID of a taxation item. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get taxation item 
  result = api_instance.g_et_taxation_item(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling TaxationItemsApi->g_et_taxation_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique ID of a taxation item.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GETTaxationItemType**](GETTaxationItemType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_delete_taxation_item**
> ProxyDeleteResponse object_delete_taxation_item(id, opts)

CRUD: Delete TaxationItem



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::TaxationItemsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Delete TaxationItem
  result = api_instance.object_delete_taxation_item(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling TaxationItemsApi->object_delete_taxation_item: #{e}"
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



# **object_get_taxation_item**
> ProxyGetTaxationItem object_get_taxation_item(id, opts)

CRUD: Retrieve TaxationItem



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::TaxationItemsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
}

begin
  #CRUD: Retrieve TaxationItem
  result = api_instance.object_get_taxation_item(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling TaxationItemsApi->object_get_taxation_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetTaxationItem**](ProxyGetTaxationItem.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_post_taxation_item**
> ProxyCreateOrModifyResponse object_post_taxation_item(create_request, opts)

CRUD: Create TaxationItem



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::TaxationItemsApi.new

create_request = Zuora::ProxyCreateTaxationItem.new # ProxyCreateTaxationItem | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Create TaxationItem
  result = api_instance.object_post_taxation_item(create_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling TaxationItemsApi->object_post_taxation_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_request** | [**ProxyCreateTaxationItem**](ProxyCreateTaxationItem.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_put_taxation_item**
> ProxyCreateOrModifyResponse object_put_taxation_item(id, modify_request, opts)

CRUD: Update TaxationItem



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::TaxationItemsApi.new

id = 'id_example' # String | Object id

modify_request = Zuora::ProxyModifyTaxationItem.new # ProxyModifyTaxationItem | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Update TaxationItem
  result = api_instance.object_put_taxation_item(id, modify_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling TaxationItemsApi->object_put_taxation_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifyTaxationItem**](ProxyModifyTaxationItem.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_taxation_item**
> GETTaxationItemType p_ut_taxation_item(body, id, opts)

Update taxation item

Updates a specific taxation item by ID. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::TaxationItemsApi.new

body = Zuora::PUTTaxationItemType.new # PUTTaxationItemType | 

id = 'id_example' # String | The unique ID of a taxation item. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Update taxation item
  result = api_instance.p_ut_taxation_item(body, id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling TaxationItemsApi->p_ut_taxation_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PUTTaxationItemType**](PUTTaxationItemType.md)|  | 
 **id** | **String**| The unique ID of a taxation item.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GETTaxationItemType**](GETTaxationItemType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



