# Zuora::AmendmentsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_amendments_by_key**](AmendmentsApi.md#get_amendments_by_key) | **GET** /v1/amendments/{amendment-key} | Get amendments by key
[**get_amendments_by_subscription_id**](AmendmentsApi.md#get_amendments_by_subscription_id) | **GET** /v1/amendments/subscriptions/{subscription-id} | Get amendments by subscription ID
[**object_delete_amendment**](AmendmentsApi.md#object_delete_amendment) | **DELETE** /v1/object/amendment/{id} | CRUD: Delete amendment
[**object_get_amendment**](AmendmentsApi.md#object_get_amendment) | **GET** /v1/object/amendment/{id} | CRUD: Get amendment
[**object_post_amendment**](AmendmentsApi.md#object_post_amendment) | **POST** /v1/object/amendment | CRUD: Create amendment
[**object_put_amendment**](AmendmentsApi.md#object_put_amendment) | **PUT** /v1/object/amendment/{id} | CRUD: Update amendment


# **get_amendments_by_key**
> GETAmendmentType get_amendments_by_key(amendment_key, opts)

Get amendments by key

Retrieves detailed information about the specified subscription amendment.

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AmendmentsApi.new

amendment_key = "amendment_key_example" # String | Can be the amendment ID or the amendment code.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get amendments by key
  result = api_instance.get_amendments_by_key(amendment_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AmendmentsApi->get_amendments_by_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **amendment_key** | **String**| Can be the amendment ID or the amendment code. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETAmendmentType**](GETAmendmentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_amendments_by_subscription_id**
> GETAmendmentType get_amendments_by_subscription_id(subscription_id, opts)

Get amendments by subscription ID

Retrieves detailed information about the amendment with the specified subscription.

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AmendmentsApi.new

subscription_id = "subscription_id_example" # String | The ID of the subscription whose amendment changes you want to retrieve.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get amendments by subscription ID
  result = api_instance.get_amendments_by_subscription_id(subscription_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AmendmentsApi->get_amendments_by_subscription_id: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_id** | **String**| The ID of the subscription whose amendment changes you want to retrieve. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETAmendmentType**](GETAmendmentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_delete_amendment**
> ProxyDeleteResponse object_delete_amendment(id, opts)

CRUD: Delete amendment

**Note:** This feature is unavailable if you have the Orders feature enabled. See [Orders Migration Guidance](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AB_Orders_Migration_Guidance) for more information. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AmendmentsApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Delete amendment
  result = api_instance.object_delete_amendment(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AmendmentsApi->object_delete_amendment: #{e}"
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



# **object_get_amendment**
> ProxyGetAmendment object_get_amendment(id, opts)

CRUD: Get amendment



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AmendmentsApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  fields: "fields_example" # String | Object fields to return
}

begin
  #CRUD: Get amendment
  result = api_instance.object_get_amendment(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AmendmentsApi->object_get_amendment: #{e}"
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

[**ProxyGetAmendment**](ProxyGetAmendment.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_post_amendment**
> ProxyCreateOrModifyResponse object_post_amendment(create_request, opts)

CRUD: Create amendment

## Notes * This feature is unavailable if you have the Orders feature enabled. See [Orders Migration Guidance](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AB_Orders_Migration_Guidance) for more information. * This operation has some limitations. If you do not have the Orders feature enabled, Zuora recommends that you use [Update subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription) to amend subscriptions. If you need to create an Amendment object, Zuora recommends that you use [Amend](https://www.zuora.com/developer/api-reference/#operation/Action_POSTamend) instead of CRUD: Create Amendment. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AmendmentsApi.new

create_request = Zuora::ProxyCreateAmendment.new # ProxyCreateAmendment | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Create amendment
  result = api_instance.object_post_amendment(create_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AmendmentsApi->object_post_amendment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_request** | [**ProxyCreateAmendment**](ProxyCreateAmendment.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_put_amendment**
> ProxyCreateOrModifyResponse object_put_amendment(id, modify_request, opts)

CRUD: Update amendment

**Note:** This feature is unavailable if you have the Orders feature enabled. See [Orders Migration Guidance](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AB_Orders_Migration_Guidance) for more information. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AmendmentsApi.new

id = "id_example" # String | Object id

modify_request = Zuora::ProxyModifyAmendment.new # ProxyModifyAmendment | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Update amendment
  result = api_instance.object_put_amendment(id, modify_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AmendmentsApi->object_put_amendment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifyAmendment**](ProxyModifyAmendment.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



