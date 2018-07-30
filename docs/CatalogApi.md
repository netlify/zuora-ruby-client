# Zuora::CatalogApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_catalog**](CatalogApi.md#g_et_catalog) | **GET** /v1/catalog/products | Get product catalog
[**p_ut_catalog**](CatalogApi.md#p_ut_catalog) | **PUT** /v1/catalog/products/{product-id}/share | Multi-entity: Share a Product with an Entity


# **g_et_catalog**
> GETCatalogType g_et_catalog(opts)

Get product catalog

This REST API reference describes how to retrieve the entire product catalog, including all products, features, and their corresponding rate plans, charges. Products are returned in reverse chronological order on the UpdatedDate field.   With rate plans and rate plan charges, the REST API has a maximum array size.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CatalogApi.new

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  page_size: 10 # Integer | Number of rows returned per page. 
}

begin
  #Get product catalog
  result = api_instance.g_et_catalog(opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CatalogApi->g_et_catalog: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 10]

### Return type

[**GETCatalogType**](GETCatalogType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_catalog**
> CommonResponseType p_ut_catalog(product_id, request, opts)

Multi-entity: Share a Product with an Entity

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Shares a product with a target entity. Zuora synchronizes the shared products to the target entity after sharing. For more information about product sharing, see [Products Sharing Across Entities](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/C_Business_Objects_Sharing_Across_Entities/B_Products_Sharing_Across_Entities).  Note that:  - You must finish all the [prerequisites](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/C_Business_Objects_Sharing_Across_Entities/B_Products_Sharing_Across_Entities/Share_Products) before sharing products with other entities.   - Only source entity administrators have permission to share products with other entities. You must make the call as a source entity administrator.  - Currently, you can only share a product with one entity at a time. An error occurs if you try to share a product to more than one entity. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CatalogApi.new

product_id = 'product_id_example' # String | The Id of the product you want to share. For example, 8a808255575bdae4015774e9602e16fe.

request = Zuora::PUTCatalogType.new # PUTCatalogType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Multi-entity: Share a Product with an Entity
  result = api_instance.p_ut_catalog(product_id, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CatalogApi->p_ut_catalog: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **product_id** | **String**| The Id of the product you want to share. For example, 8a808255575bdae4015774e9602e16fe. | 
 **request** | [**PUTCatalogType**](PUTCatalogType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



