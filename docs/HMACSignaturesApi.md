# SwaggerClient::HMACSignaturesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**p_osthmac_signatures**](HMACSignaturesApi.md#p_osthmac_signatures) | **POST** /v1/hmac-signatures | Return HMAC signatures


# **p_osthmac_signatures**
> POSTHMACSignatureResponseType p_osthmac_signatures(request, opts)

Return HMAC signatures

This REST API reference describes how to return unique signature and token values that used to process a CORS enabled API call. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::HMACSignaturesApi.new

request = SwaggerClient::POSTHMACSignatureType.new # POSTHMACSignatureType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Return HMAC signatures
  result = api_instance.p_osthmac_signatures(request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling HMACSignaturesApi->p_osthmac_signatures: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTHMACSignatureType**](POSTHMACSignatureType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**POSTHMACSignatureResponseType**](POSTHMACSignatureResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



