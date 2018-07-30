# Zuora::ChargeRevenueSummariesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_etcrs_by_charge_id**](ChargeRevenueSummariesApi.md#g_etcrs_by_charge_id) | **GET** /v1/charge-revenue-summaries/subscription-charges/{charge-key} | Get charge summary details by charge ID
[**g_etcrs_by_crs_number**](ChargeRevenueSummariesApi.md#g_etcrs_by_crs_number) | **GET** /v1/charge-revenue-summaries/{crs-number} | Get charge summary details by CRS number


# **g_etcrs_by_charge_id**
> GETChargeRSDetailType g_etcrs_by_charge_id(charge_key, opts)

Get charge summary details by charge ID

This REST API reference describes how to retrieve the details of a charge revenue summary by specifying the subscription charge ID. This response retrieves all revenue items associated with a charge revenue summary. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ChargeRevenueSummariesApi.new

charge_key = 'charge_key_example' # String | ID of the subscription rate plan charge; for example, 402892793e173340013e173b81000012. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get charge summary details by charge ID
  result = api_instance.g_etcrs_by_charge_id(charge_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ChargeRevenueSummariesApi->g_etcrs_by_charge_id: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **charge_key** | **String**| ID of the subscription rate plan charge; for example, 402892793e173340013e173b81000012.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GETChargeRSDetailType**](GETChargeRSDetailType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_etcrs_by_crs_number**
> GETChargeRSDetailType g_etcrs_by_crs_number(crs_number, opts)

Get charge summary details by CRS number

This REST API reference describes how to retrieve the details of a charge revenue summary by specifying the charge revenue summary number. The response includes all revenue items associated with the charge revenue summary. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::ChargeRevenueSummariesApi.new

crs_number = 'crs_number_example' # String | The charge revenue summary number. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get charge summary details by CRS number
  result = api_instance.g_etcrs_by_crs_number(crs_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling ChargeRevenueSummariesApi->g_etcrs_by_crs_number: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **crs_number** | **String**| The charge revenue summary number.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GETChargeRSDetailType**](GETChargeRSDetailType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



