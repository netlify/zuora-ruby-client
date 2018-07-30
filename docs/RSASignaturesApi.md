# Zuora::RSASignaturesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**p_ost_decrypt_rsa_signatures**](RSASignaturesApi.md#p_ost_decrypt_rsa_signatures) | **POST** /v1/rsa-signatures/decrypt | Decrypt RSA signature
[**p_ostrsa_signatures**](RSASignaturesApi.md#p_ostrsa_signatures) | **POST** /v1/rsa-signatures | Generate RSA signature


# **p_ost_decrypt_rsa_signatures**
> POSTDecryptResponseType p_ost_decrypt_rsa_signatures(request, opts)

Decrypt RSA signature

 The REST API used in Payment Pages 2.0 are CORS (Cross-Origin Resource Sharing) enabled and therefore requires a digital signature. You use rsa_signatures to generate the required digital signature and token for a Payment Pages 2.0 form, and then you use the decrypt REST service to decrypt the signature to validate the signature and key.  This REST service should be used only when you implement Payment Pages 2.0.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RSASignaturesApi.new

request = Zuora::POSTDecryptionType.new # POSTDecryptionType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Decrypt RSA signature
  result = api_instance.p_ost_decrypt_rsa_signatures(request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RSASignaturesApi->p_ost_decrypt_rsa_signatures: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTDecryptionType**](POSTDecryptionType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**POSTDecryptResponseType**](POSTDecryptResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ostrsa_signatures**
> POSTRSASignatureResponseType p_ostrsa_signatures(request, opts)

Generate RSA signature

 The REST API used in Payment Pages 2.0 are CORS (Cross-Origin Resource Sharing) enabled and therefore requires a digital signature. The POST rsa_signatures call generates and returns the required digital signature and token for a Payment Pages 2.0 form. You need to pass the generated signature to your client for it to access Payment Pages 2.0.     This REST service should be used only when you implement Payment Pages 2.0.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RSASignaturesApi.new

request = Zuora::POSTRSASignatureType.new # POSTRSASignatureType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Generate RSA signature
  result = api_instance.p_ostrsa_signatures(request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RSASignaturesApi->p_ostrsa_signatures: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTRSASignatureType**](POSTRSASignatureType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**POSTRSASignatureResponseType**](POSTRSASignatureResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



