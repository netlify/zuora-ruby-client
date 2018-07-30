# Zuora::RevenueRulesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_revenue_rec_ruleby_product_rate_plan_charge**](RevenueRulesApi.md#g_et_revenue_rec_ruleby_product_rate_plan_charge) | **GET** /v1/revenue-recognition-rules/product-charges/{charge-key} | Get revenue recognition rule by product rate plan charge
[**g_et_revenue_rec_rules**](RevenueRulesApi.md#g_et_revenue_rec_rules) | **GET** /v1/revenue-recognition-rules/subscription-charges/{charge-key} | Get revenue recognition rule by subscription charge


# **g_et_revenue_rec_ruleby_product_rate_plan_charge**
> GETRevenueRecognitionRuleAssociationType g_et_revenue_rec_ruleby_product_rate_plan_charge(charge_key)

Get revenue recognition rule by product rate plan charge

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the revenue recognition rule associated with a production rate plan charge by specifying the charge ID. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueRulesApi.new

charge_key = 'charge_key_example' # String | The unique ID of a product rate plan charge. For example, 8a8082e65ba86084015bb323d3c61d82. 


begin
  #Get revenue recognition rule by product rate plan charge
  result = api_instance.g_et_revenue_rec_ruleby_product_rate_plan_charge(charge_key)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueRulesApi->g_et_revenue_rec_ruleby_product_rate_plan_charge: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **charge_key** | **String**| The unique ID of a product rate plan charge. For example, 8a8082e65ba86084015bb323d3c61d82.  | 

### Return type

[**GETRevenueRecognitionRuleAssociationType**](GETRevenueRecognitionRuleAssociationType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_revenue_rec_rules**
> GETRevenueRecognitionRuleAssociationType g_et_revenue_rec_rules(charge_key, opts)

Get revenue recognition rule by subscription charge

Retrieves the revenue recognition rule associated with a subscription charge by specifying the charge ID. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueRulesApi.new

charge_key = 'charge_key_example' # String | The unique ID of the subscription rate plan charge. For example, 402892793e173340013e173b81000012. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get revenue recognition rule by subscription charge
  result = api_instance.g_et_revenue_rec_rules(charge_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueRulesApi->g_et_revenue_rec_rules: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **charge_key** | **String**| The unique ID of the subscription rate plan charge. For example, 402892793e173340013e173b81000012.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GETRevenueRecognitionRuleAssociationType**](GETRevenueRecognitionRuleAssociationType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



