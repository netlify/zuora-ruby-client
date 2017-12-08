# Zuora::UsersApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_entities_user_accessible**](UsersApi.md#get_entities_user_accessible) | **GET** /v1/users/{username}/accessible-entities | Multi-entity: Get entities that a user can access
[**put_accept_user_access**](UsersApi.md#put_accept_user_access) | **PUT** /v1/users/{username}/accept-access | Multi-entity: Accept user access
[**put_deny_user_access**](UsersApi.md#put_deny_user_access) | **PUT** /v1/users/{username}/deny-access | Multi-entity: Deny user access
[**put_send_user_access_requests**](UsersApi.md#put_send_user_access_requests) | **PUT** /v1/users/{username}/request-access | Multi-entity: Send user access requests


# **get_entities_user_accessible**
> GETEntitiesUserAccessibleResponseType get_entities_user_accessible(username, opts)

Multi-entity: Get entities that a user can access

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves detailed information about all the entities that a user has permission to access.  ## User Access Permission You can make the call as any entity user. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsersApi.new

username = "username_example" # String | Specify the login user name that you want to retrieve. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Multi-entity: Get entities that a user can access
  result = api_instance.get_entities_user_accessible(username, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsersApi->get_entities_user_accessible: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| Specify the login user name that you want to retrieve.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETEntitiesUserAccessibleResponseType**](GETEntitiesUserAccessibleResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_accept_user_access**
> PUTAcceptUserAccessResponseType put_accept_user_access(username, opts)

Multi-entity: Accept user access

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Accepts user access to an entity.  ## User Access Permission You must make the calls as an administrator of the entity that you want to accept the user access to.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsersApi.new

username = "username_example" # String | Specify the login name of the user that you want to accept the access request for. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Multi-entity: Accept user access
  result = api_instance.put_accept_user_access(username, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsersApi->put_accept_user_access: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| Specify the login name of the user that you want to accept the access request for.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**PUTAcceptUserAccessResponseType**](PUTAcceptUserAccessResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_deny_user_access**
> PUTDenyUserAccessResponseType put_deny_user_access(username, opts)

Multi-entity: Deny user access

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Denies a user access to an entity.   ## User Access Permission You must make the calls as an administrator of the entity that you want to deny the user access to. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsersApi.new

username = "username_example" # String | Specify the login name of the user that you want to deny the access. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Multi-entity: Deny user access
  result = api_instance.put_deny_user_access(username, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsersApi->put_deny_user_access: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| Specify the login name of the user that you want to deny the access.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**PUTDenyUserAccessResponseType**](PUTDenyUserAccessResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_send_user_access_requests**
> PUTSendUserAccessRequestResponseType put_send_user_access_requests(username, request, opts)

Multi-entity: Send user access requests

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Sends access requests to the entities that a user wants to access.  ## User Access Permission You must make the call as an administrator of the entity, in which the request user is created. Also, this administrator must have the permission to access the entities that the request user wants to access. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsersApi.new

username = "username_example" # String | Specify the login name of the user who wants to access other entities. 

request = Zuora::PUTSendUserAccessRequestType.new # PUTSendUserAccessRequestType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Multi-entity: Send user access requests
  result = api_instance.put_send_user_access_requests(username, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsersApi->put_send_user_access_requests: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| Specify the login name of the user who wants to access other entities.  | 
 **request** | [**PUTSendUserAccessRequestType**](PUTSendUserAccessRequestType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**PUTSendUserAccessRequestResponseType**](PUTSendUserAccessRequestResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



