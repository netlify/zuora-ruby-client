# Zuora::MassUpdaterApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_mass_updater**](MassUpdaterApi.md#get_mass_updater) | **GET** /v1/bulk/{bulk-key} | Get mass action result
[**post_mass_updater**](MassUpdaterApi.md#post_mass_updater) | **POST** /v1/bulk | Perform mass action
[**put_mass_updater**](MassUpdaterApi.md#put_mass_updater) | **PUT** /v1/bulk/{bulk-key}/stop | Stop mass action


# **get_mass_updater**
> GETMassUpdateType get_mass_updater(bulk_key, opts)

Get mass action result

This reference describes how to get information about the result of a mass action through the REST API.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::MassUpdaterApi.new

bulk_key = "bulk_key_example" # String | String of 32 characters that identifies a mass action. You get the bulk-key after performing a mass action through the REST API. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get mass action result
  result = api_instance.get_mass_updater(bulk_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling MassUpdaterApi->get_mass_updater: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bulk_key** | **String**| String of 32 characters that identifies a mass action. You get the bulk-key after performing a mass action through the REST API.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETMassUpdateType**](GETMassUpdateType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_mass_updater**
> POSTMassUpdateResponseType post_mass_updater(content_type, request, opts)

Perform mass action

This reference describes how to perform a mass action through the REST API.   Using this API method, you send a multipart/form-data request containing a `.csv` file with data about the mass action you want to perform. Zuora returns a key and then asynchronously processes the mass action. You can use the key to get details about the result of the mass action. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::MassUpdaterApi.new

content_type = "content_type_example" # String | Must be multipart/form-data. 

request = Zuora::POSTMassUpdateType.new # POSTMassUpdateType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Perform mass action
  result = api_instance.post_mass_updater(content_type, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling MassUpdaterApi->post_mass_updater: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **content_type** | **String**| Must be multipart/form-data.  | 
 **request** | [**POSTMassUpdateType**](POSTMassUpdateType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**POSTMassUpdateResponseType**](POSTMassUpdateResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_mass_updater**
> CommonResponseType put_mass_updater(bulk_key, opts)

Stop mass action

This reference describes how to stop a mass action through the REST API. You can stop a mass action when its status is Pending or Processing. After you have stopped a mass action, you can get the mass action result to see details of the mass action.  - If you stop a mass action when its status is Pending, no response file is generated because no records have been processed.  - If you stop a mass action when its status is Processing, a response file is generated. You can check the response file to see which records have been processed and which have not. In the response file, the **Success** column has the value `Y` (successful) or `N` (failed) for processed records, and a blank value for unprocessed records.  Records that have already been processed when a mass action is stopped are not rolled back. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::MassUpdaterApi.new

bulk_key = "bulk_key_example" # String | String of 32 characters that identifies a mass action. You get the bulk-key after performing a mass action through the REST API. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Stop mass action
  result = api_instance.put_mass_updater(bulk_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling MassUpdaterApi->put_mass_updater: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bulk_key** | **String**| String of 32 characters that identifies a mass action. You get the bulk-key after performing a mass action through the REST API.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



