# Zuora::ConnectionsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**post_connections**](ConnectionsApi.md#post_connections) | **POST** /v1/connections | Establish connection to Zuora REST API service


# **post_connections**
> CommonResponseType post_connections(api_access_key_id, api_secret_access_key, content_type, opts)

Establish connection to Zuora REST API service

Establishes a connection to the Zuora REST API service based on a valid user credentials.  This call authenticates the user and returns an API session cookie that's used to authorize subsequent calls to the REST API. A call to `connections` is a required first step before using the Zuora REST API to access data.  The credentials must belong to a user account that has permission to access the API service.  As noted elsewhere, it's strongly recommended that an account used for Zuora API activity is never used to log into the Zuora UI.  Once an account is used to log into the UI, it may be subject to periodic forced password changes, which may eventually lead to authentication failures when using the API. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ConnectionsApi.new

api_access_key_id = "api_access_key_id_example" # String | Account username 

api_secret_access_key = "api_secret_access_key_example" # String | Account password 

content_type = "content_type_example" # String | Must be set to \"application/json\" 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Establish connection to Zuora REST API service
  result = api_instance.post_connections(api_access_key_id, api_secret_access_key, content_type, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ConnectionsApi->post_connections: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **api_access_key_id** | **String**| Account username  | 
 **api_secret_access_key** | **String**| Account password  | 
 **content_type** | **String**| Must be set to \&quot;application/json\&quot;  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



