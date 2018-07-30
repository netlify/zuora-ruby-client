# Zuora::ContactsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_delete_contact**](ContactsApi.md#object_delete_contact) | **DELETE** /v1/object/contact/{id} | CRUD: Delete Contact
[**object_get_contact**](ContactsApi.md#object_get_contact) | **GET** /v1/object/contact/{id} | CRUD: Retrieve Contact
[**object_post_contact**](ContactsApi.md#object_post_contact) | **POST** /v1/object/contact | CRUD: Create Contact
[**object_put_contact**](ContactsApi.md#object_put_contact) | **PUT** /v1/object/contact/{id} | CRUD: Update Contact


# **object_delete_contact**
> ProxyDeleteResponse object_delete_contact(id, opts)

CRUD: Delete Contact



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ContactsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Delete Contact
  result = api_instance.object_delete_contact(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ContactsApi->object_delete_contact: #{e}"
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



# **object_get_contact**
> ProxyGetContact object_get_contact(id, opts)

CRUD: Retrieve Contact



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ContactsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
}

begin
  #CRUD: Retrieve Contact
  result = api_instance.object_get_contact(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ContactsApi->object_get_contact: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetContact**](ProxyGetContact.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_post_contact**
> ProxyCreateOrModifyResponse object_post_contact(create_request, opts)

CRUD: Create Contact



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ContactsApi.new

create_request = Zuora::ProxyCreateContact.new # ProxyCreateContact | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Create Contact
  result = api_instance.object_post_contact(create_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ContactsApi->object_post_contact: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_request** | [**ProxyCreateContact**](ProxyCreateContact.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_put_contact**
> ProxyCreateOrModifyResponse object_put_contact(id, modify_request, opts)

CRUD: Update Contact



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ContactsApi.new

id = 'id_example' # String | Object id

modify_request = Zuora::ProxyModifyContact.new # ProxyModifyContact | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Update Contact
  result = api_instance.object_put_contact(id, modify_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ContactsApi->object_put_contact: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifyContact**](ProxyModifyContact.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



