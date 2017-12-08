# Zuora::UnitOfMeasureApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_delete_unit_of_measure**](UnitOfMeasureApi.md#object_delete_unit_of_measure) | **DELETE** /v1/object/unit-of-measure/{id} | CRUD: Delete UnitOfMeasure
[**object_get_unit_of_measure**](UnitOfMeasureApi.md#object_get_unit_of_measure) | **GET** /v1/object/unit-of-measure/{id} | CRUD: Retrieve UnitOfMeasure
[**object_post_unit_of_measure**](UnitOfMeasureApi.md#object_post_unit_of_measure) | **POST** /v1/object/unit-of-measure | CRUD: Create UnitOfMeasure
[**object_put_unit_of_measure**](UnitOfMeasureApi.md#object_put_unit_of_measure) | **PUT** /v1/object/unit-of-measure/{id} | CRUD: Update UnitOfMeasure


# **object_delete_unit_of_measure**
> ProxyDeleteResponse object_delete_unit_of_measure(id, opts)

CRUD: Delete UnitOfMeasure



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UnitOfMeasureApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Delete UnitOfMeasure
  result = api_instance.object_delete_unit_of_measure(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UnitOfMeasureApi->object_delete_unit_of_measure: #{e}"
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



# **object_get_unit_of_measure**
> ProxyGetUnitOfMeasure object_get_unit_of_measure(id, opts)

CRUD: Retrieve UnitOfMeasure



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UnitOfMeasureApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  fields: "fields_example" # String | Object fields to return
}

begin
  #CRUD: Retrieve UnitOfMeasure
  result = api_instance.object_get_unit_of_measure(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UnitOfMeasureApi->object_get_unit_of_measure: #{e}"
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

[**ProxyGetUnitOfMeasure**](ProxyGetUnitOfMeasure.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_post_unit_of_measure**
> ProxyCreateOrModifyResponse object_post_unit_of_measure(create_request, opts)

CRUD: Create UnitOfMeasure



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UnitOfMeasureApi.new

create_request = Zuora::ProxyCreateUnitOfMeasure.new # ProxyCreateUnitOfMeasure | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Create UnitOfMeasure
  result = api_instance.object_post_unit_of_measure(create_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UnitOfMeasureApi->object_post_unit_of_measure: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_request** | [**ProxyCreateUnitOfMeasure**](ProxyCreateUnitOfMeasure.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_put_unit_of_measure**
> ProxyCreateOrModifyResponse object_put_unit_of_measure(id, modify_request, opts)

CRUD: Update UnitOfMeasure



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UnitOfMeasureApi.new

id = "id_example" # String | Object id

modify_request = Zuora::ProxyModifyUnitOfMeasure.new # ProxyModifyUnitOfMeasure | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Update UnitOfMeasure
  result = api_instance.object_put_unit_of_measure(id, modify_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UnitOfMeasureApi->object_put_unit_of_measure: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifyUnitOfMeasure**](ProxyModifyUnitOfMeasure.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



