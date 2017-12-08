# Zuora::RevenueItemsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_revenue_items_by_charge_revenue_event_number**](RevenueItemsApi.md#get_revenue_items_by_charge_revenue_event_number) | **GET** /v1/revenue-items/revenue-events/{event-number} | Get revenue items by revenue event number
[**get_revenue_items_by_charge_revenue_summary_number**](RevenueItemsApi.md#get_revenue_items_by_charge_revenue_summary_number) | **GET** /v1/revenue-items/charge-revenue-summaries/{crs-number} | Get revenue items by charge revenue summary number
[**get_revenue_items_by_revenue_schedule**](RevenueItemsApi.md#get_revenue_items_by_revenue_schedule) | **GET** /v1/revenue-items/revenue-schedules/{rs-number} | Get revenue items by revenue schedule
[**put_custom_fieldson_revenue_items_by_revenue_event**](RevenueItemsApi.md#put_custom_fieldson_revenue_items_by_revenue_event) | **PUT** /v1/revenue-items/revenue-events/{event-number} | Update custom fields on revenue items by revenue event number
[**put_custom_fieldson_revenue_items_by_revenue_schedule**](RevenueItemsApi.md#put_custom_fieldson_revenue_items_by_revenue_schedule) | **PUT** /v1/revenue-items/revenue-schedules/{rs-number} | Update custom fields on revenue items by revenue schedule number


# **get_revenue_items_by_charge_revenue_event_number**
> GETRevenueItemsType get_revenue_items_by_charge_revenue_event_number(event_number, opts)

Get revenue items by revenue event number

This REST API reference describes how to get the details of each revenue item in a revenue event by specifying the revenue event number. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueItemsApi.new

event_number = "event_number_example" # String | The number associated with the revenue event.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 300 # Integer | Number of rows returned per page. 
}

begin
  #Get revenue items by revenue event number
  result = api_instance.get_revenue_items_by_charge_revenue_event_number(event_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueItemsApi->get_revenue_items_by_charge_revenue_event_number: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **event_number** | **String**| The number associated with the revenue event. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 300]

### Return type

[**GETRevenueItemsType**](GETRevenueItemsType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_revenue_items_by_charge_revenue_summary_number**
> GETRevenueItemsType get_revenue_items_by_charge_revenue_summary_number(crs_number, opts)

Get revenue items by charge revenue summary number

This REST API reference describes how to get the details for each revenue item in a charge revenue summary by specifying the charge revenue summary number. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueItemsApi.new

crs_number = "crs_number_example" # String | The charge revenue summary number.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 300 # Integer | Number of rows returned per page. 
}

begin
  #Get revenue items by charge revenue summary number
  result = api_instance.get_revenue_items_by_charge_revenue_summary_number(crs_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueItemsApi->get_revenue_items_by_charge_revenue_summary_number: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **crs_number** | **String**| The charge revenue summary number. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 300]

### Return type

[**GETRevenueItemsType**](GETRevenueItemsType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_revenue_items_by_revenue_schedule**
> GETRsRevenueItemsType get_revenue_items_by_revenue_schedule(rs_number, opts)

Get revenue items by revenue schedule

This REST API reference describes how to get the details for each revenue items in a revenue schedule by specifying the revenue schedule number. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueItemsApi.new

rs_number = "rs_number_example" # String | Revenue schedule number. The revenue schedule number is always prefixed with \"RS\", for example, \"RS-00000001\".

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 300 # Integer | Number of rows returned per page. 
}

begin
  #Get revenue items by revenue schedule
  result = api_instance.get_revenue_items_by_revenue_schedule(rs_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueItemsApi->get_revenue_items_by_revenue_schedule: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rs_number** | **String**| Revenue schedule number. The revenue schedule number is always prefixed with \&quot;RS\&quot;, for example, \&quot;RS-00000001\&quot;. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 300]

### Return type

[**GETRsRevenueItemsType**](GETRsRevenueItemsType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_custom_fieldson_revenue_items_by_revenue_event**
> CommonResponseType put_custom_fieldson_revenue_items_by_revenue_event(event_number, request, opts)

Update custom fields on revenue items by revenue event number

This REST API reference describes how to update custom fields on revenue items by specifying the revenue event number. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueItemsApi.new

event_number = "event_number_example" # String | The number associated with the revenue event.

request = Zuora::PUTEventRIDetailType.new # PUTEventRIDetailType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Update custom fields on revenue items by revenue event number
  result = api_instance.put_custom_fieldson_revenue_items_by_revenue_event(event_number, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueItemsApi->put_custom_fieldson_revenue_items_by_revenue_event: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **event_number** | **String**| The number associated with the revenue event. | 
 **request** | [**PUTEventRIDetailType**](PUTEventRIDetailType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_custom_fieldson_revenue_items_by_revenue_schedule**
> CommonResponseType put_custom_fieldson_revenue_items_by_revenue_schedule(rs_number, request, opts)

Update custom fields on revenue items by revenue schedule number

This REST API reference describes how to update custom fields on revenue Items by specifying the revenue schedule number. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueItemsApi.new

rs_number = "rs_number_example" # String | Revenue schedule number. The revenue schedule number is always prefixed with \"RS\", for example, \"RS-00000001\".

request = Zuora::PUTScheduleRIDetailType.new # PUTScheduleRIDetailType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Update custom fields on revenue items by revenue schedule number
  result = api_instance.put_custom_fieldson_revenue_items_by_revenue_schedule(rs_number, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueItemsApi->put_custom_fieldson_revenue_items_by_revenue_schedule: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rs_number** | **String**| Revenue schedule number. The revenue schedule number is always prefixed with \&quot;RS\&quot;, for example, \&quot;RS-00000001\&quot;. | 
 **request** | [**PUTScheduleRIDetailType**](PUTScheduleRIDetailType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



