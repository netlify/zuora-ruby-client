# Zuora::SettingsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_revenue_automation_start_date**](SettingsApi.md#get_revenue_automation_start_date) | **GET** /v1/settings/finance/revenue-automation-start-date | Get the revenue automation start date


# **get_revenue_automation_start_date**
> GETRevenueStartDateSettingType get_revenue_automation_start_date(opts)

Get the revenue automation start date

This REST API reference describes how to get the revenue automation start date. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::SettingsApi.new

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get the revenue automation start date
  result = api_instance.get_revenue_automation_start_date(opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling SettingsApi->get_revenue_automation_start_date: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETRevenueStartDateSettingType**](GETRevenueStartDateSettingType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



