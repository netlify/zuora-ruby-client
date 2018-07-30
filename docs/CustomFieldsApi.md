# Zuora::CustomFieldsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**d_elete_custom_fields_definition_in_global_namespace**](CustomFieldsApi.md#d_elete_custom_fields_definition_in_global_namespace) | **DELETE** /fields/definitions/{type} | Delete schema of custom fields definition in the global namespace
[**d_elete_custom_fields_definition_in_namespace**](CustomFieldsApi.md#d_elete_custom_fields_definition_in_namespace) | **DELETE** /fields/{namespace}/definitions/{type} | Delete schema of custom fields definition in namespace
[**g_et_custom_fields_definition_in_global_namespace**](CustomFieldsApi.md#g_et_custom_fields_definition_in_global_namespace) | **GET** /fields/definitions/{type} | Get custom fields definition in the global namespace
[**g_et_custom_fields_definition_in_namespace**](CustomFieldsApi.md#g_et_custom_fields_definition_in_namespace) | **GET** /fields/{namespace}/definitions/{type} | Get custom fields definition in namespace
[**g_et_custom_fields_definitions_in_global_namespace**](CustomFieldsApi.md#g_et_custom_fields_definitions_in_global_namespace) | **GET** /fields/definitions | Get all custom fields definitions in the global namespace
[**g_et_custom_fields_definitions_in_namespace**](CustomFieldsApi.md#g_et_custom_fields_definitions_in_namespace) | **GET** /fields/{namespace}/definitions | Get all custom fields definitions in namespace
[**g_et_custom_fields_namespaces**](CustomFieldsApi.md#g_et_custom_fields_namespaces) | **GET** /fields/namespaces | Get namespaces for custom fields definitions
[**g_et_custom_fields_types_in_global_namespace**](CustomFieldsApi.md#g_et_custom_fields_types_in_global_namespace) | **GET** /fields/types | Get all custom fields types in the global namespace
[**g_et_custom_fields_types_in_namespace**](CustomFieldsApi.md#g_et_custom_fields_types_in_namespace) | **GET** /fields/{namespace}/types | Get all custom fields types in namespace
[**p_ut_custom_fields_definition_in_global_namespace**](CustomFieldsApi.md#p_ut_custom_fields_definition_in_global_namespace) | **PUT** /fields/definitions/{type} | Set schema of custom fields definition in the global namespace
[**p_ut_custom_fields_definition_in_namespace**](CustomFieldsApi.md#p_ut_custom_fields_definition_in_namespace) | **PUT** /fields/{namespace}/definitions/{type} | Set schema of custom fields definition in namespace


# **d_elete_custom_fields_definition_in_global_namespace**
> String d_elete_custom_fields_definition_in_global_namespace(authorization, type, opts)

Delete schema of custom fields definition in the global namespace

You cannot use [Set schema of custom fields definition in the global namespace](https://www.zuora.com/developer/api-reference/#operation/PUT_CustomFieldsDefinitionInGlobalNamespace) to set an empty schema. If you want to set an empty schema, you must use this operation instead.  Before calling this operation, you must delete all data stored in the custom fields. To delete all data stored in custom fields that are part of part of Real-Time Usage Rating, use [Delete usage by ID](https://www.zuora.com/developer/api-reference/#operation/DELETE_UsageRecord).  When you delete the schema of a custom fields definition, Zuora sets `\"schema\": {}` and `\"type\": \"_internal\"` for the custom fields definition. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CustomFieldsApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

type = 'type_example' # String | The type of the custom fields definition. For example, `Usage`. Types of custom fields definitions are unique within the global namespace. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Delete schema of custom fields definition in the global namespace
  result = api_instance.d_elete_custom_fields_definition_in_global_namespace(authorization, type, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CustomFieldsApi->d_elete_custom_fields_definition_in_global_namespace: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **type** | **String**| The type of the custom fields definition. For example, &#x60;Usage&#x60;. Types of custom fields definitions are unique within the global namespace.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **d_elete_custom_fields_definition_in_namespace**
> String d_elete_custom_fields_definition_in_namespace(authorization, namespace, type, opts)

Delete schema of custom fields definition in namespace

You cannot use [Set schema of custom fields definition in namespace](https://www.zuora.com/developer/api-reference/#operation/PUT_CustomFieldsDefinitionInNamespace) to set an empty schema. If you want to set an empty schema, you must use this operation instead.  **Warning:**  If the namespace is `zuora`, this operation also deletes all data stored in the custom fields. Use caution when calling this operation.  When you delete the schema of a custom fields definition, Zuora sets `\"schema\": {}` and `\"type\": \"_internal\"` for the custom fields definition. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CustomFieldsApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

namespace = 'namespace_example' # String | The namespace that contains the custom fields definition. For example, `zuora`. 

type = 'type_example' # String | The type of the custom fields definition. For example, `Contact`. Types of custom fields definitions are unique within the namespace. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Delete schema of custom fields definition in namespace
  result = api_instance.d_elete_custom_fields_definition_in_namespace(authorization, namespace, type, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CustomFieldsApi->d_elete_custom_fields_definition_in_namespace: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **namespace** | **String**| The namespace that contains the custom fields definition. For example, &#x60;zuora&#x60;.  | 
 **type** | **String**| The type of the custom fields definition. For example, &#x60;Contact&#x60;. Types of custom fields definitions are unique within the namespace.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_custom_fields_definition_in_global_namespace**
> CustomFieldsDefinitionNoNamespace g_et_custom_fields_definition_in_global_namespace(authorization, type, opts)

Get custom fields definition in the global namespace



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CustomFieldsApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

type = 'type_example' # String | The type of the custom fields definition. For example, `Usage`. Types of custom fields definitions are unique within the global namespace. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Get custom fields definition in the global namespace
  result = api_instance.g_et_custom_fields_definition_in_global_namespace(authorization, type, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CustomFieldsApi->g_et_custom_fields_definition_in_global_namespace: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **type** | **String**| The type of the custom fields definition. For example, &#x60;Usage&#x60;. Types of custom fields definitions are unique within the global namespace.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

[**CustomFieldsDefinitionNoNamespace**](CustomFieldsDefinitionNoNamespace.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_custom_fields_definition_in_namespace**
> CustomFieldsDefinition g_et_custom_fields_definition_in_namespace(authorization, namespace, type, opts)

Get custom fields definition in namespace



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CustomFieldsApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

namespace = 'namespace_example' # String | The namespace that contains the custom fields definition. For example, `zuora`. 

type = 'type_example' # String | The type of the custom fields definition. For example, `Contact`. Types of custom fields definitions are unique within the namespace. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Get custom fields definition in namespace
  result = api_instance.g_et_custom_fields_definition_in_namespace(authorization, namespace, type, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CustomFieldsApi->g_et_custom_fields_definition_in_namespace: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **namespace** | **String**| The namespace that contains the custom fields definition. For example, &#x60;zuora&#x60;.  | 
 **type** | **String**| The type of the custom fields definition. For example, &#x60;Contact&#x60;. Types of custom fields definitions are unique within the namespace.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

[**CustomFieldsDefinition**](CustomFieldsDefinition.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_custom_fields_definitions_in_global_namespace**
> GetCustomFieldsDefinitionsResponseNoNamespace g_et_custom_fields_definitions_in_global_namespace(authorization, , opts)

Get all custom fields definitions in the global namespace



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CustomFieldsApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Get all custom fields definitions in the global namespace
  result = api_instance.g_et_custom_fields_definitions_in_global_namespace(authorization, , opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CustomFieldsApi->g_et_custom_fields_definitions_in_global_namespace: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

[**GetCustomFieldsDefinitionsResponseNoNamespace**](GetCustomFieldsDefinitionsResponseNoNamespace.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_custom_fields_definitions_in_namespace**
> GetCustomFieldsDefinitionsResponse g_et_custom_fields_definitions_in_namespace(authorization, namespace, opts)

Get all custom fields definitions in namespace



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CustomFieldsApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

namespace = 'namespace_example' # String | The namespace. For example, `zuora`. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Get all custom fields definitions in namespace
  result = api_instance.g_et_custom_fields_definitions_in_namespace(authorization, namespace, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CustomFieldsApi->g_et_custom_fields_definitions_in_namespace: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **namespace** | **String**| The namespace. For example, &#x60;zuora&#x60;.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

[**GetCustomFieldsDefinitionsResponse**](GetCustomFieldsDefinitionsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_custom_fields_namespaces**
> GetCustomFieldsNamespacesResponse g_et_custom_fields_namespaces(authorization, , opts)

Get namespaces for custom fields definitions



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CustomFieldsApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Get namespaces for custom fields definitions
  result = api_instance.g_et_custom_fields_namespaces(authorization, , opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CustomFieldsApi->g_et_custom_fields_namespaces: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

[**GetCustomFieldsNamespacesResponse**](GetCustomFieldsNamespacesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_custom_fields_types_in_global_namespace**
> GetCustomFieldsTypesResponseNoNamespace g_et_custom_fields_types_in_global_namespace(authorization, , opts)

Get all custom fields types in the global namespace



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CustomFieldsApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Get all custom fields types in the global namespace
  result = api_instance.g_et_custom_fields_types_in_global_namespace(authorization, , opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CustomFieldsApi->g_et_custom_fields_types_in_global_namespace: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

[**GetCustomFieldsTypesResponseNoNamespace**](GetCustomFieldsTypesResponseNoNamespace.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_custom_fields_types_in_namespace**
> GetCustomFieldsTypesResponse g_et_custom_fields_types_in_namespace(authorization, namespace, opts)

Get all custom fields types in namespace



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CustomFieldsApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

namespace = 'namespace_example' # String | The namespace. For example, `zuora`. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Get all custom fields types in namespace
  result = api_instance.g_et_custom_fields_types_in_namespace(authorization, namespace, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CustomFieldsApi->g_et_custom_fields_types_in_namespace: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **namespace** | **String**| The namespace. For example, &#x60;zuora&#x60;.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

[**GetCustomFieldsTypesResponse**](GetCustomFieldsTypesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_custom_fields_definition_in_global_namespace**
> String p_ut_custom_fields_definition_in_global_namespace(authorization, type, body, opts)

Set schema of custom fields definition in the global namespace



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CustomFieldsApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

type = 'type_example' # String | The type of the custom fields definition. For example, `Usage`. Types of custom fields definitions are unique within the global namespace. 

body = Zuora::UpdateCustomFieldsDefinitionRequestNoNamespace.new # UpdateCustomFieldsDefinitionRequestNoNamespace | The schema for the custom fields definition. The schema must be non-empty. If you want to set an empty schema, use [Delete schema of custom fields definition in the global namespace](https://www.zuora.com/developer/api-reference/#operation/DELETE_CustomFieldsDefinitionInGlobalNamespace) instead.  The schema must conform to the [JSON Schema](http://json-schema.org/specification.html) specification.  If the value of the `type` path parameter is `Usage`, the schema must have `\"type\": \"object\"`. Each property in the schema must not have `\"type\": \"object\"` or `\"type\": \"array\"`. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
  if_match: 'if_match_example' # String | The expected ETag of the resource. You can use this header to perform a conditional request. Zuora responds with 412 Precondition Failed if the ETag of the resource does not match the value of this header.  
}

begin
  #Set schema of custom fields definition in the global namespace
  result = api_instance.p_ut_custom_fields_definition_in_global_namespace(authorization, type, body, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CustomFieldsApi->p_ut_custom_fields_definition_in_global_namespace: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **type** | **String**| The type of the custom fields definition. For example, &#x60;Usage&#x60;. Types of custom fields definitions are unique within the global namespace.  | 
 **body** | [**UpdateCustomFieldsDefinitionRequestNoNamespace**](UpdateCustomFieldsDefinitionRequestNoNamespace.md)| The schema for the custom fields definition. The schema must be non-empty. If you want to set an empty schema, use [Delete schema of custom fields definition in the global namespace](https://www.zuora.com/developer/api-reference/#operation/DELETE_CustomFieldsDefinitionInGlobalNamespace) instead.  The schema must conform to the [JSON Schema](http://json-schema.org/specification.html) specification.  If the value of the &#x60;type&#x60; path parameter is &#x60;Usage&#x60;, the schema must have &#x60;\&quot;type\&quot;: \&quot;object\&quot;&#x60;. Each property in the schema must not have &#x60;\&quot;type\&quot;: \&quot;object\&quot;&#x60; or &#x60;\&quot;type\&quot;: \&quot;array\&quot;&#x60;.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 
 **if_match** | **String**| The expected ETag of the resource. You can use this header to perform a conditional request. Zuora responds with 412 Precondition Failed if the ETag of the resource does not match the value of this header.   | [optional] 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_custom_fields_definition_in_namespace**
> String p_ut_custom_fields_definition_in_namespace(authorization, namespace, type, body, opts)

Set schema of custom fields definition in namespace



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CustomFieldsApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

namespace = 'namespace_example' # String | The namespace that contains the custom fields definition. For example, `zuora`. 

type = 'type_example' # String | The type of the custom fields definition. For example, `Contact`. Types of custom fields definitions are unique within the namespace. 

body = Zuora::UpdateCustomFieldsDefinitionRequest.new # UpdateCustomFieldsDefinitionRequest | The schema for the custom fields definition. The schema must be non-empty. If you want to set an empty schema, use [Delete schema of custom fields definition in namespace](https://www.zuora.com/developer/api-reference/#operation/DELETE_CustomFieldsDefinitionInNamespace) instead.  If the namespace is not `zuora`, the schema must conform to the [JSON Schema](http://json-schema.org/specification.html) specification.  If the namespace is `zuora`, the schema is based on draft-04 of the JSON Schema specification, but has the following Zuora-specific requirements:  * The schema must have `\"type\": \"object\"`. * Each property in the schema must contain a string keyword called `label`. The value of `label` specifies the name of the property in the Zuora user interface. * The schema may contain an array keyword called `readOnlyOnUI`. The value of `readOnlyOnUI` specifies which properties can be modified by users in the Zuora user interface. * The schema may contain an array keyword called `indexed`. The value of `indexed` specifies which properties are indexed for improved performance. Non-indexed properties are functionally identical to indexed properties, but have lower performance. You can specify up to 10 indexed properties. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
  if_match: 'if_match_example' # String | The expected ETag of the resource. You can use this header to perform a conditional request. Zuora responds with 412 Precondition Failed if the ETag of the resource does not match the value of this header.  
}

begin
  #Set schema of custom fields definition in namespace
  result = api_instance.p_ut_custom_fields_definition_in_namespace(authorization, namespace, type, body, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CustomFieldsApi->p_ut_custom_fields_definition_in_namespace: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **namespace** | **String**| The namespace that contains the custom fields definition. For example, &#x60;zuora&#x60;.  | 
 **type** | **String**| The type of the custom fields definition. For example, &#x60;Contact&#x60;. Types of custom fields definitions are unique within the namespace.  | 
 **body** | [**UpdateCustomFieldsDefinitionRequest**](UpdateCustomFieldsDefinitionRequest.md)| The schema for the custom fields definition. The schema must be non-empty. If you want to set an empty schema, use [Delete schema of custom fields definition in namespace](https://www.zuora.com/developer/api-reference/#operation/DELETE_CustomFieldsDefinitionInNamespace) instead.  If the namespace is not &#x60;zuora&#x60;, the schema must conform to the [JSON Schema](http://json-schema.org/specification.html) specification.  If the namespace is &#x60;zuora&#x60;, the schema is based on draft-04 of the JSON Schema specification, but has the following Zuora-specific requirements:  * The schema must have &#x60;\&quot;type\&quot;: \&quot;object\&quot;&#x60;. * Each property in the schema must contain a string keyword called &#x60;label&#x60;. The value of &#x60;label&#x60; specifies the name of the property in the Zuora user interface. * The schema may contain an array keyword called &#x60;readOnlyOnUI&#x60;. The value of &#x60;readOnlyOnUI&#x60; specifies which properties can be modified by users in the Zuora user interface. * The schema may contain an array keyword called &#x60;indexed&#x60;. The value of &#x60;indexed&#x60; specifies which properties are indexed for improved performance. Non-indexed properties are functionally identical to indexed properties, but have lower performance. You can specify up to 10 indexed properties.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 
 **if_match** | **String**| The expected ETag of the resource. You can use this header to perform a conditional request. Zuora responds with 412 Precondition Failed if the ETag of the resource does not match the value of this header.   | [optional] 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



