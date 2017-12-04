# SwaggerClient::RSASignaturesApi

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
require 'swagger_client'

api_instance = SwaggerClient::RSASignaturesApi.new

request = SwaggerClient::POSTDecryptionType.new # POSTDecryptionType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Decrypt RSA signature
  result = api_instance.p_ost_decrypt_rsa_signatures(request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RSASignaturesApi->p_ost_decrypt_rsa_signatures: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTDecryptionType**](POSTDecryptionType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

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
require 'swagger_client'

api_instance = SwaggerClient::RSASignaturesApi.new

request = SwaggerClient::POSTRSASignatureType.new # POSTRSASignatureType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Generate RSA signature
  result = api_instance.p_ostrsa_signatures(request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RSASignaturesApi->p_ostrsa_signatures: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTRSASignatureType**](POSTRSASignatureType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**POSTRSASignatureResponseType**](POSTRSASignatureResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



