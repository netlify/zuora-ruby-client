# SwaggerClient::RevenueEventsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_revenue_event_details**](RevenueEventsApi.md#g_et_revenue_event_details) | **GET** /v1/revenue-events/{event-number} | Get revenue event details
[**g_et_revenue_event_for_revenue_schedule**](RevenueEventsApi.md#g_et_revenue_event_for_revenue_schedule) | **GET** /v1/revenue-events/revenue-schedules/{rs-number} | Get revenue events for a revenue schedule


# **g_et_revenue_event_details**
> GETRevenueEventDetailType g_et_revenue_event_details(event_number, opts)

Get revenue event details

 This REST API reference describes how to get revenue event details by specifying the revenue event number. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RevenueEventsApi.new

event_number = "event_number_example" # String | The number associated with the revenue event.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get revenue event details
  result = api_instance.g_et_revenue_event_details(event_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RevenueEventsApi->g_et_revenue_event_details: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **event_number** | **String**| The number associated with the revenue event. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETRevenueEventDetailType**](GETRevenueEventDetailType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_revenue_event_for_revenue_schedule**
> GETRevenueEventDetailsType g_et_revenue_event_for_revenue_schedule(rs_number, opts)

Get revenue events for a revenue schedule

 This REST API reference describes how to get all revenue events in a revenue schedule by specifying the revenue schedule number. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RevenueEventsApi.new

rs_number = "rs_number_example" # String | Revenue schedule number. The revenue schedule number is always prefixed with \"RS\", for example, \"RS-00000001\".

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 8 # Integer | Number of rows returned per page. 
}

begin
  #Get revenue events for a revenue schedule
  result = api_instance.g_et_revenue_event_for_revenue_schedule(rs_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RevenueEventsApi->g_et_revenue_event_for_revenue_schedule: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rs_number** | **String**| Revenue schedule number. The revenue schedule number is always prefixed with \&quot;RS\&quot;, for example, \&quot;RS-00000001\&quot;. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 8]

### Return type

[**GETRevenueEventDetailsType**](GETRevenueEventDetailsType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



