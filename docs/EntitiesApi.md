# SwaggerClient::EntitiesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**d_elete_entities**](EntitiesApi.md#d_elete_entities) | **DELETE** /v1/entities/{id} | Multi-entity: Delete entity
[**g_et_entities**](EntitiesApi.md#g_et_entities) | **GET** /v1/entities | Multi-entity: Get entities
[**g_et_entity_by_id**](EntitiesApi.md#g_et_entity_by_id) | **GET** /v1/entities/{id} | Multi-entity: Get entity by Id
[**p_ost_entities**](EntitiesApi.md#p_ost_entities) | **POST** /v1/entities | Multi-entity: Create entity
[**p_ut_entities**](EntitiesApi.md#p_ut_entities) | **PUT** /v1/entities/{id} | Multi-entity: Update entity
[**p_ut_provision_entity**](EntitiesApi.md#p_ut_provision_entity) | **PUT** /v1/entities/{id}/provision | Multi-entity: Provision entity


# **d_elete_entities**
> DELETEntityResponseType d_elete_entities(id, opts)

Multi-entity: Delete entity

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Removes an entity and its sub-entities from a multi-entity hierarchy. You can only remove unprovisioned entities. An error occurred when you remove a provisioned entity.  ## User Access Permission You must make the call as a global entity administrator.    

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::EntitiesApi.new

id = "id_example" # String | Specify the Id of the entity that you want to delete. You can get the entity Id from the GET Entities call.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Multi-entity: Delete entity
  result = api_instance.d_elete_entities(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling EntitiesApi->d_elete_entities: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Specify the Id of the entity that you want to delete. You can get the entity Id from the GET Entities call. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**DELETEntityResponseType**](DELETEntityResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_entities**
> GETEntitiesResponseType g_et_entities(opts)

Multi-entity: Get entities

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Retrieves detailed information of certain entities in a multi-entity hierarchy.   You can retrieve:   - Provisioned entities     - Unprovisioned entities     - Both provisioned and unprovisioned entities  ## User Access Permission  You can make the call as any entity user. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::EntitiesApi.new

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  provisioned: "provisioned_example" # String | Specify whether to retrieve provisioned or unprovisioned entities:  - `true`: Provisioned entities  - `false`: Unprovisioned entities   If you do not specify this field in the request, both the provisioned and unprovisioned entities are returned. 
}

begin
  #Multi-entity: Get entities
  result = api_instance.g_et_entities(opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling EntitiesApi->g_et_entities: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **provisioned** | **String**| Specify whether to retrieve provisioned or unprovisioned entities:  - &#x60;true&#x60;: Provisioned entities  - &#x60;false&#x60;: Unprovisioned entities   If you do not specify this field in the request, both the provisioned and unprovisioned entities are returned.  | [optional] 

### Return type

[**GETEntitiesResponseType**](GETEntitiesResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_entity_by_id**
> GETEntitiesResponseTypeWithId g_et_entity_by_id(id, opts)

Multi-entity: Get entity by Id

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves detailed information about a specified entity.  ## User Access Permission You can make the call as any entity user.      

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::EntitiesApi.new

id = "id_example" # String | Specify the Id of the entity that you want to retrieve. You can get the entity Id from the GET Entities call.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Multi-entity: Get entity by Id
  result = api_instance.g_et_entity_by_id(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling EntitiesApi->g_et_entity_by_id: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Specify the Id of the entity that you want to retrieve. You can get the entity Id from the GET Entities call. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETEntitiesResponseTypeWithId**](GETEntitiesResponseTypeWithId.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_entities**
> CreateEntityResponseType p_ost_entities(request, opts)

Multi-entity: Create entity

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Creates an entity in a multi-entity hierarchy.  ## User Access Permission You must make the call as a global entity administrator.  ## Notes * We recommend that you assign only one administrator to manage the entity hierarchy, because an administrator of the global entity by default can only access to the entities that are created by themselves. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::EntitiesApi.new

request = SwaggerClient::CreateEntityType.new # CreateEntityType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Multi-entity: Create entity
  result = api_instance.p_ost_entities(request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling EntitiesApi->p_ost_entities: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**CreateEntityType**](CreateEntityType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CreateEntityResponseType**](CreateEntityResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_entities**
> UpdateEntityResponseType p_ut_entities(id, request, opts)

Multi-entity: Update entity

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Edits the following information about an unprovisioned entity:   - Name    - Display name    - Locale    - Timezone  ## User Access Permission You must make the call as a global entity administrator.  ## Notes * You are not allowed to edit the locale and time zone of the provisioned entities through the REST API. * You are not allowed to edit the display name of the global entity. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::EntitiesApi.new

id = "id_example" # String | The Id of the entity that you want to edit. You can get the entity Id from the GET Entities call.

request = SwaggerClient::UpdateEntityType.new # UpdateEntityType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Multi-entity: Update entity
  result = api_instance.p_ut_entities(id, request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling EntitiesApi->p_ut_entities: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The Id of the entity that you want to edit. You can get the entity Id from the GET Entities call. | 
 **request** | [**UpdateEntityType**](UpdateEntityType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**UpdateEntityResponseType**](UpdateEntityResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_provision_entity**
> ProvisionEntityResponseType p_ut_provision_entity(id, opts)

Multi-entity: Provision entity

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Provisions an entity. You can only provision an entity if its parent entity is provisioned.  ## User Access Permission You must make the call as a global entity administrator.   ## Notes * Zuora does not allow you to remove a provisioned entity from the multi-entity hierarchy. So before you provision an entity, make sure that you put the entity in the correct place in the multi-entity hierarchy.  

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::EntitiesApi.new

id = "id_example" # String | Specify the Id of the entity that you want to provision.  You can get the entity Id from the GET Entities call.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Multi-entity: Provision entity
  result = api_instance.p_ut_provision_entity(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling EntitiesApi->p_ut_provision_entity: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Specify the Id of the entity that you want to provision.  You can get the entity Id from the GET Entities call. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProvisionEntityResponseType**](ProvisionEntityResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



