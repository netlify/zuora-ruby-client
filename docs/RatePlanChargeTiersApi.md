# SwaggerClient::RatePlanChargeTiersApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_get_rate_plan_charge_tier**](RatePlanChargeTiersApi.md#object_get_rate_plan_charge_tier) | **GET** /v1/object/rate-plan-charge-tier/{id} | CRUD: Retrieve RatePlanChargeTier


# **object_get_rate_plan_charge_tier**
> ProxyGetRatePlanChargeTier object_get_rate_plan_charge_tier(id, opts)

CRUD: Retrieve RatePlanChargeTier



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RatePlanChargeTiersApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  fields: "fields_example" # String | Object fields to return
}

begin
  #CRUD: Retrieve RatePlanChargeTier
  result = api_instance.object_get_rate_plan_charge_tier(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RatePlanChargeTiersApi->object_get_rate_plan_charge_tier: #{e}"
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

[**ProxyGetRatePlanChargeTier**](ProxyGetRatePlanChargeTier.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



