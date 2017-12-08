# Zuora::CatalogApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_catalog**](CatalogApi.md#get_catalog) | **GET** /v1/catalog/products | Get product catalog
[**put_catalog**](CatalogApi.md#put_catalog) | **PUT** /v1/catalog/products/{product-id}/share | Multi-entity: Share a Product with an Entity


# **get_catalog**
> GETCatalogType get_catalog(opts)

Get product catalog

This REST API reference describes how to retrieve the entire product catalog, including all products, features, and their corresponding rate plans, charges. Products are returned in reverse chronological order on the UpdatedDate field.   With rate plans and rate plan charges, the REST API has a maximum array size.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CatalogApi.new

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 10 # Integer | Number of rows returned per page. 
}

begin
  #Get product catalog
  result = api_instance.get_catalog(opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CatalogApi->get_catalog: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 10]

### Return type

[**GETCatalogType**](GETCatalogType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_catalog**
> CommonResponseType put_catalog(product_id, request, opts)

Multi-entity: Share a Product with an Entity

**Note:** The Multi-entity feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Shares a product with a target entity. Zuora synchronizes the shared products to the target entity after sharing. For more information about product sharing, see [Products Sharing Across Entities](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/C_Business_Objects_Sharing_Across_Entities/B_Products_Sharing_Across_Entities).  Note that:  - You must finish all the [prerequisites](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/C_Business_Objects_Sharing_Across_Entities/B_Products_Sharing_Across_Entities/Share_Products) before sharing products with other entities.   - Only source entity administrators have permission to share products with other entities. You must make the call as a source entity administrator.  - Currently, you can only share a product with one entity at a time. An error occurs if you try to share a product to more than one entity. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CatalogApi.new

product_id = "product_id_example" # String | The Id of the product you want to share. For example, 8a808255575bdae4015774e9602e16fe.

request = Zuora::PUTCatalogType.new # PUTCatalogType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Multi-entity: Share a Product with an Entity
  result = api_instance.put_catalog(product_id, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CatalogApi->put_catalog: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **product_id** | **String**| The Id of the product you want to share. For example, 8a808255575bdae4015774e9602e16fe. | 
 **request** | [**PUTCatalogType**](PUTCatalogType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



