# SwaggerClient::RevenueRulesApi

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
require 'swagger_client'

api_instance = SwaggerClient::RevenueRulesApi.new

charge_key = "charge_key_example" # String | The unique ID of a product rate plan charge. For example, 8a8082e65ba86084015bb323d3c61d82. 


begin
  #Get revenue recognition rule by product rate plan charge
  result = api_instance.g_et_revenue_rec_ruleby_product_rate_plan_charge(charge_key)
  p result
rescue SwaggerClient::ApiError => e
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
require 'swagger_client'

api_instance = SwaggerClient::RevenueRulesApi.new

charge_key = "charge_key_example" # String | The unique ID of the subscription rate plan charge. For example, 402892793e173340013e173b81000012. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get revenue recognition rule by subscription charge
  result = api_instance.g_et_revenue_rec_rules(charge_key, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RevenueRulesApi->g_et_revenue_rec_rules: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **charge_key** | **String**| The unique ID of the subscription rate plan charge. For example, 402892793e173340013e173b81000012.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETRevenueRecognitionRuleAssociationType**](GETRevenueRecognitionRuleAssociationType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



