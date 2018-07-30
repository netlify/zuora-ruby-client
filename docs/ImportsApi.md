# Zuora::ImportsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_get_import**](ImportsApi.md#object_get_import) | **GET** /v1/object/import/{id} | CRUD: Retrieve Import
[**object_post_import**](ImportsApi.md#object_post_import) | **POST** /v1/object/import | CRUD: Create Import


# **object_get_import**
> ProxyGetImport object_get_import(id, opts)

CRUD: Retrieve Import



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ImportsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
}

begin
  #CRUD: Retrieve Import
  result = api_instance.object_get_import(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ImportsApi->object_get_import: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetImport**](ProxyGetImport.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_post_import**
> ProxyPostImport object_post_import(import_type, name, file, opts)

CRUD: Create Import

Creates a data import. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ImportsApi.new

import_type = 'import_type_example' # String | The type of data to import. 

name = 'name_example' # String | A descriptive name for the import. 

file = File.new('/path/to/file.txt') # File | The data to import. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Create Import
  result = api_instance.object_post_import(import_type, name, file, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ImportsApi->object_post_import: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **import_type** | **String**| The type of data to import.  | 
 **name** | **String**| A descriptive name for the import.  | 
 **file** | **File**| The data to import.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyPostImport**](ProxyPostImport.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json; charset=utf-8



