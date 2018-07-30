# Zuora::ExportsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_get_export**](ExportsApi.md#object_get_export) | **GET** /v1/object/export/{id} | CRUD: Retrieve Export
[**object_post_export**](ExportsApi.md#object_post_export) | **POST** /v1/object/export | CRUD: Create Export


# **object_get_export**
> ProxyGetExport object_get_export(id, opts)

CRUD: Retrieve Export

Use this operation to check the status of a data source export and access the exported data.  When you export data from Zuora, each exported file is available for download for 7 days. Data source exports (Export objects) older than 90 days are automatically deleted. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ExportsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
}

begin
  #CRUD: Retrieve Export
  result = api_instance.object_get_export(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ExportsApi->object_get_export: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetExport**](ProxyGetExport.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_post_export**
> ProxyCreateOrModifyResponse object_post_export(create_request, opts)

CRUD: Create Export

Use this operation to create a data source export. After you have created a data source export, use [CRUD: Retrieve Export](https://www.zuora.com/developer/api-reference/#operation/Object_GETExport) to check the status of the data source export and access the exported data.  When you export data from Zuora, each exported file is available for download for 7 days. Data source exports (Export objects) older than 90 days are automatically deleted. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ExportsApi.new

create_request = Zuora::ProxyCreateExport.new # ProxyCreateExport | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Create Export
  result = api_instance.object_post_export(create_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ExportsApi->object_post_export: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_request** | [**ProxyCreateExport**](ProxyCreateExport.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



