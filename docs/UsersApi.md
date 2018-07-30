# Zuora::UsersApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_entities_user_accessible**](UsersApi.md#g_et_entities_user_accessible) | **GET** /v1/users/{username}/accessible-entities | Multi-entity: Get entities that a user can access
[**p_ut_accept_user_access**](UsersApi.md#p_ut_accept_user_access) | **PUT** /v1/users/{username}/accept-access | Multi-entity: Accept user access
[**p_ut_deny_user_access**](UsersApi.md#p_ut_deny_user_access) | **PUT** /v1/users/{username}/deny-access | Multi-entity: Deny user access
[**p_ut_send_user_access_requests**](UsersApi.md#p_ut_send_user_access_requests) | **PUT** /v1/users/{username}/request-access | Multi-entity: Send user access requests


# **g_et_entities_user_accessible**
> GETEntitiesUserAccessibleResponseType g_et_entities_user_accessible(username, opts)

Multi-entity: Get entities that a user can access

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves detailed information about all the entities that a user has permission to access.  ## User Access Permission You can make the call as any entity user. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsersApi.new

username = 'username_example' # String | Specify the login user name that you want to retrieve. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Multi-entity: Get entities that a user can access
  result = api_instance.g_et_entities_user_accessible(username, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsersApi->g_et_entities_user_accessible: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| Specify the login user name that you want to retrieve.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GETEntitiesUserAccessibleResponseType**](GETEntitiesUserAccessibleResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_accept_user_access**
> PUTAcceptUserAccessResponseType p_ut_accept_user_access(username, opts)

Multi-entity: Accept user access

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Accepts user access to an entity.  ## User Access Permission You must make the calls as an administrator of the entity that you want to accept the user access to.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsersApi.new

username = 'username_example' # String | Specify the login name of the user that you want to accept the access request for. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Multi-entity: Accept user access
  result = api_instance.p_ut_accept_user_access(username, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsersApi->p_ut_accept_user_access: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| Specify the login name of the user that you want to accept the access request for.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**PUTAcceptUserAccessResponseType**](PUTAcceptUserAccessResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_deny_user_access**
> PUTDenyUserAccessResponseType p_ut_deny_user_access(username, opts)

Multi-entity: Deny user access

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Denies a user access to an entity.   ## User Access Permission You must make the calls as an administrator of the entity that you want to deny the user access to. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsersApi.new

username = 'username_example' # String | Specify the login name of the user that you want to deny the access. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Multi-entity: Deny user access
  result = api_instance.p_ut_deny_user_access(username, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsersApi->p_ut_deny_user_access: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| Specify the login name of the user that you want to deny the access.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**PUTDenyUserAccessResponseType**](PUTDenyUserAccessResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_send_user_access_requests**
> PUTSendUserAccessRequestResponseType p_ut_send_user_access_requests(username, request, opts)

Multi-entity: Send user access requests

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Sends access requests to the entities that a user wants to access.  ## User Access Permission You must make the call as an administrator of the entity, in which the request user is created. Also, this administrator must have the permission to access the entities that the request user wants to access. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsersApi.new

username = 'username_example' # String | Specify the login name of the user who wants to access other entities. 

request = Zuora::PUTSendUserAccessRequestType.new # PUTSendUserAccessRequestType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Multi-entity: Send user access requests
  result = api_instance.p_ut_send_user_access_requests(username, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsersApi->p_ut_send_user_access_requests: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| Specify the login name of the user who wants to access other entities.  | 
 **request** | [**PUTSendUserAccessRequestType**](PUTSendUserAccessRequestType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**PUTSendUserAccessRequestResponseType**](PUTSendUserAccessRequestResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



