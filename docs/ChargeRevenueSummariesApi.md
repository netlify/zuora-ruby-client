# Zuora::ChargeRevenueSummariesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_crs_by_charge_id**](ChargeRevenueSummariesApi.md#get_crs_by_charge_id) | **GET** /v1/charge-revenue-summaries/subscription-charges/{charge-key} | Get charge summary details by charge ID
[**get_crs_by_crs_number**](ChargeRevenueSummariesApi.md#get_crs_by_crs_number) | **GET** /v1/charge-revenue-summaries/{crs-number} | Get charge summary details by CRS number


# **get_crs_by_charge_id**
> GETChargeRSDetailType get_crs_by_charge_id(charge_key, opts)

Get charge summary details by charge ID

This REST API reference describes how to retrieve the details of a charge revenue summary by specifying the subscription charge ID. This response retrieves all revenue items associated with a charge revenue summary. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ChargeRevenueSummariesApi.new

charge_key = "charge_key_example" # String | ID of the subscription rate plan charge; for example, 402892793e173340013e173b81000012. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get charge summary details by charge ID
  result = api_instance.get_crs_by_charge_id(charge_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ChargeRevenueSummariesApi->get_crs_by_charge_id: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **charge_key** | **String**| ID of the subscription rate plan charge; for example, 402892793e173340013e173b81000012.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETChargeRSDetailType**](GETChargeRSDetailType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_crs_by_crs_number**
> GETChargeRSDetailType get_crs_by_crs_number(crs_number, opts)

Get charge summary details by CRS number

This REST API reference describes how to retrieve the details of a charge revenue summary by specifying the charge revenue summary number. The response includes all revenue items associated with the charge revenue summary. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ChargeRevenueSummariesApi.new

crs_number = "crs_number_example" # String | The charge revenue summary number. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get charge summary details by CRS number
  result = api_instance.get_crs_by_crs_number(crs_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ChargeRevenueSummariesApi->get_crs_by_crs_number: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **crs_number** | **String**| The charge revenue summary number.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETChargeRSDetailType**](GETChargeRSDetailType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



