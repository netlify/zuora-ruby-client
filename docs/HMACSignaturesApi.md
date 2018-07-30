# Zuora::HMACSignaturesApi

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
require 'zuora'

api_instance = Zuora::HMACSignaturesApi.new

request = Zuora::POSTHMACSignatureType.new # POSTHMACSignatureType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Return HMAC signatures
  result = api_instance.p_osthmac_signatures(request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling HMACSignaturesApi->p_osthmac_signatures: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTHMACSignatureType**](POSTHMACSignatureType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**POSTHMACSignatureResponseType**](POSTHMACSignatureResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



