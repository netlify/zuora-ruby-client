# Zuora::TaxationItemsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_taxation_item**](TaxationItemsApi.md#delete_taxation_item) | **DELETE** /v1/taxationitems/{id} | Delete taxation item
[**get_taxation_item**](TaxationItemsApi.md#get_taxation_item) | **GET** /v1/taxationitems/{id} | Get taxation item 
[**object_delete_taxation_item**](TaxationItemsApi.md#object_delete_taxation_item) | **DELETE** /v1/object/taxation-item/{id} | CRUD: Delete TaxationItem
[**object_get_taxation_item**](TaxationItemsApi.md#object_get_taxation_item) | **GET** /v1/object/taxation-item/{id} | CRUD: Retrieve TaxationItem
[**object_post_taxation_item**](TaxationItemsApi.md#object_post_taxation_item) | **POST** /v1/object/taxation-item | CRUD: Create TaxationItem
[**object_put_taxation_item**](TaxationItemsApi.md#object_put_taxation_item) | **PUT** /v1/object/taxation-item/{id} | CRUD: Update TaxationItem
[**put_taxation_item**](TaxationItemsApi.md#put_taxation_item) | **PUT** /v1/taxationitems/{id} | Update taxation item


# **delete_taxation_item**
> CommonResponseType delete_taxation_item(id, opts)

Delete taxation item

Deletes a specific taxation item by ID. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::TaxationItemsApi.new

id = "id_example" # String | The unique ID of a taxation item. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Delete taxation item
  result = api_instance.delete_taxation_item(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling TaxationItemsApi->delete_taxation_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique ID of a taxation item.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_taxation_item**
> GETTaxationItemType get_taxation_item(id, opts)

Get taxation item 

Retrieves the information about a specific taxation item by ID. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::TaxationItemsApi.new

id = "id_example" # String | The unique ID of a taxation item. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get taxation item 
  result = api_instance.get_taxation_item(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling TaxationItemsApi->get_taxation_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique ID of a taxation item.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

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

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
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
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

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

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  fields: "fields_example" # String | Object fields to return
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
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
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
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
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
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

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

id = "id_example" # String | Object id

modify_request = Zuora::ProxyModifyTaxationItem.new # ProxyModifyTaxationItem | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
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
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_taxation_item**
> GETTaxationItemType put_taxation_item(body, id, opts)

Update taxation item

Updates a specific taxation item by ID. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::TaxationItemsApi.new

body = Zuora::PUTTaxationItemType.new # PUTTaxationItemType | 

id = "id_example" # String | The unique ID of a taxation item. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Update taxation item
  result = api_instance.put_taxation_item(body, id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling TaxationItemsApi->put_taxation_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PUTTaxationItemType**](PUTTaxationItemType.md)|  | 
 **id** | **String**| The unique ID of a taxation item.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETTaxationItemType**](GETTaxationItemType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



