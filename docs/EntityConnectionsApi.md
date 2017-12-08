# Zuora::EntityConnectionsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_entity_connections**](EntityConnectionsApi.md#get_entity_connections) | **GET** /v1/entity-connections | Multi-entity: Get connections
[**post_entity_connections**](EntityConnectionsApi.md#post_entity_connections) | **POST** /v1/entity-connections | Multi-entity: Initiate connection
[**put_entity_connections_accept**](EntityConnectionsApi.md#put_entity_connections_accept) | **PUT** /v1/entity-connections/{connection-id}/accept | Multi-entity: Accept connection
[**put_entity_connections_deny**](EntityConnectionsApi.md#put_entity_connections_deny) | **PUT** /v1/entity-connections/{connection-id}/deny | Multi-entity: Deny connection
[**put_entity_connections_disconnect**](EntityConnectionsApi.md#put_entity_connections_disconnect) | **PUT** /v1/entity-connections/{connection-id}/disconnect | Multi-entity: Disconnect connection


# **get_entity_connections**
> GETEntityConnectionsResponseType get_entity_connections(opts)

Multi-entity: Get connections

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves information about certain connections for a specified entity. You can specify the entity to retrieve in the `entityId` or `entityName` request header.  You can retrieve:  - Inbound connections  - Outbound connections  - Both inbound and outbound connections  ## User Access Permission You can make the call as any entity user.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::EntityConnectionsApi.new

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 30, # Integer | Number of rows returned per page. 
  type: "type_example" # String | Specifies whether to retrieve inbound or outbound connections for an entity.  Possible values:  - `inbound`: All the incoming connections to the entity.  - `outbound`: All the outgoing connections from the entity.  If you do not specify this field in the request, both the inbound and outbound connections are returned. 
}

begin
  #Multi-entity: Get connections
  result = api_instance.get_entity_connections(opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling EntityConnectionsApi->get_entity_connections: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 30]
 **type** | **String**| Specifies whether to retrieve inbound or outbound connections for an entity.  Possible values:  - &#x60;inbound&#x60;: All the incoming connections to the entity.  - &#x60;outbound&#x60;: All the outgoing connections from the entity.  If you do not specify this field in the request, both the inbound and outbound connections are returned.  | [optional] 

### Return type

[**GETEntityConnectionsResponseType**](GETEntityConnectionsResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_entity_connections**
> POSTEntityConnectionsResponseType post_entity_connections(opts)

Multi-entity: Initiate connection

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Initiates a connection request from a source entity to a target entity.  ## User Access Permission You must make the call as a source entity administrator. Also, this administrator must have permission to access to the target entity. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::EntityConnectionsApi.new

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  request: Zuora::POSTEntityConnectionsType.new # POSTEntityConnectionsType | 
}

begin
  #Multi-entity: Initiate connection
  result = api_instance.post_entity_connections(opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling EntityConnectionsApi->post_entity_connections: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **request** | [**POSTEntityConnectionsType**](POSTEntityConnectionsType.md)|  | [optional] 

### Return type

[**POSTEntityConnectionsResponseType**](POSTEntityConnectionsResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_entity_connections_accept**
> PUTEntityConnectionsAcceptResponseType put_entity_connections_accept(connection_id, opts)

Multi-entity: Accept connection

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Accepts a connection request.  ## User Access Permission You must make the call as an entity administrator to accept a connection request. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::EntityConnectionsApi.new

connection_id = "connection_id_example" # String | The ID of the connection that you want to accept. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Multi-entity: Accept connection
  result = api_instance.put_entity_connections_accept(connection_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling EntityConnectionsApi->put_entity_connections_accept: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connection_id** | **String**| The ID of the connection that you want to accept.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**PUTEntityConnectionsAcceptResponseType**](PUTEntityConnectionsAcceptResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_entity_connections_deny**
> PUTEntityConnectionsDenyResponseType put_entity_connections_deny(connection_id, opts)

Multi-entity: Deny connection

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Denies a connection request.  ## User Access Permission You must make the call as an entity administrator to deny a connection request. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::EntityConnectionsApi.new

connection_id = "connection_id_example" # String | The ID of the connection that you want to deny. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Multi-entity: Deny connection
  result = api_instance.put_entity_connections_deny(connection_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling EntityConnectionsApi->put_entity_connections_deny: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connection_id** | **String**| The ID of the connection that you want to deny.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**PUTEntityConnectionsDenyResponseType**](PUTEntityConnectionsDenyResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_entity_connections_disconnect**
> PUTEntityConnectionsDisconnectResponseType put_entity_connections_disconnect(connection_id, opts)

Multi-entity: Disconnect connection

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Disconnects an established connection request.  ## User Access Permission You must make the call as an administrator of the target entity or source entity. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::EntityConnectionsApi.new

connection_id = "connection_id_example" # String | The ID of the connection that you want to disconnect. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Multi-entity: Disconnect connection
  result = api_instance.put_entity_connections_disconnect(connection_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling EntityConnectionsApi->put_entity_connections_disconnect: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connection_id** | **String**| The ID of the connection that you want to disconnect.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**PUTEntityConnectionsDisconnectResponseType**](PUTEntityConnectionsDisconnectResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



