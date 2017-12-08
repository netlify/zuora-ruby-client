# Zuora::HostedPagesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_hosted_pages**](HostedPagesApi.md#get_hosted_pages) | **GET** /v1/hostedpages | Return hosted pages


# **get_hosted_pages**
> GetHostedPagesType get_hosted_pages(opts)

Return hosted pages

The hostedpages call returns the Payment Pages configuration metadata, specifically, page ID, page version, payment method type.  The following are the version-specific and general REST requests for Payment Pages:  * The request for Payment Pages 1.0 configuration information: `GET <BaseURL>/hostedpages?version=1` * The request for Payment Pages 2.0 configuration information: `GET <BaseURL>/hostedpages?version=2` * The request for all versions of Payment Pages configuration information: `GET <BaseURL>/hostedpages`  ## Notes If you do not have the corresponding tenant setting enabled, e.g., the request `version` parameter set to 2 with the Payment Pages 2.0 setting disabled, you will receive an error. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::HostedPagesApi.new

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
  version_number: "version_number_example" # String | Version of the Payment Pages for which you want to retrieve the configuration information. Specify 1 for Payment Pages 1.0 or 2 for Payment Pages 2.0. If omitted, information for all versions of Payment Pages are returned.  The response also depends on your tenant settings for Payment Pages 1.0 and Payment Pages 2.0. For example, if only the tenant setting for Payment Pages 2.0 is enabled, the response will only contain information for Payment Pages 2.0 forms even when this parameter is omitted. 
}

begin
  #Return hosted pages
  result = api_instance.get_hosted_pages(opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling HostedPagesApi->get_hosted_pages: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]
 **version_number** | **String**| Version of the Payment Pages for which you want to retrieve the configuration information. Specify 1 for Payment Pages 1.0 or 2 for Payment Pages 2.0. If omitted, information for all versions of Payment Pages are returned.  The response also depends on your tenant settings for Payment Pages 1.0 and Payment Pages 2.0. For example, if only the tenant setting for Payment Pages 2.0 is enabled, the response will only contain information for Payment Pages 2.0 forms even when this parameter is omitted.  | [optional] 

### Return type

[**GetHostedPagesType**](GetHostedPagesType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



