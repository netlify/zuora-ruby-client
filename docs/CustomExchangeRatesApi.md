# SwaggerClient::CustomExchangeRatesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_custom_exchange_rates**](CustomExchangeRatesApi.md#g_et_custom_exchange_rates) | **GET** /v1/custom-exchange-rates/{currency} | Get custom foreign currency exchange rates


# **g_et_custom_exchange_rates**
> GETCustomExchangeRatesType g_et_custom_exchange_rates(currency, start_date, end_date, opts)

Get custom foreign currency exchange rates

This feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   This reference describes how to query custom foreign exchange rates from Zuora. You can use this API method to query exchange rates only if you use a custom exchange rate provider and upload rates with the Import Foreign Exchange Rates mass action.  

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::CustomExchangeRatesApi.new

currency = "currency_example" # String | The target base currency of the tenant. The exchange rates in the response are calculated in relation to the target currency.  The value must be a three-letter currency code, for example, USD.  

start_date = "start_date_example" # String | Start date of the date range for which you want to get exchange rates.  The date must be in yyyy-mm-dd format, for example, 2016-01-15. The start date cannot be later than the end date. 

end_date = "end_date_example" # String | End date of the date range for which you want to get exchange rates.  The date must be in yyyy-mm-dd format, for example, 2016-01-16. The end date can be a maximum of 90 days after the start date. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get custom foreign currency exchange rates
  result = api_instance.g_et_custom_exchange_rates(currency, start_date, end_date, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling CustomExchangeRatesApi->g_et_custom_exchange_rates: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currency** | **String**| The target base currency of the tenant. The exchange rates in the response are calculated in relation to the target currency.  The value must be a three-letter currency code, for example, USD.   | 
 **start_date** | **String**| Start date of the date range for which you want to get exchange rates.  The date must be in yyyy-mm-dd format, for example, 2016-01-15. The start date cannot be later than the end date.  | 
 **end_date** | **String**| End date of the date range for which you want to get exchange rates.  The date must be in yyyy-mm-dd format, for example, 2016-01-16. The end date can be a maximum of 90 days after the start date.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETCustomExchangeRatesType**](GETCustomExchangeRatesType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



