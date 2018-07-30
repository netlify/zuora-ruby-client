# Zuora::SettingsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_revenue_automation_start_date**](SettingsApi.md#g_et_revenue_automation_start_date) | **GET** /v1/settings/finance/revenue-automation-start-date | Get the revenue automation start date


# **g_et_revenue_automation_start_date**
> GETRevenueStartDateSettingType g_et_revenue_automation_start_date(opts)

Get the revenue automation start date

This REST API reference describes how to get the revenue automation start date. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::SettingsApi.new

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get the revenue automation start date
  result = api_instance.g_et_revenue_automation_start_date(opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling SettingsApi->g_et_revenue_automation_start_date: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GETRevenueStartDateSettingType**](GETRevenueStartDateSettingType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



