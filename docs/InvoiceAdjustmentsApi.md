# SwaggerClient::InvoiceAdjustmentsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_delete_invoice_adjustment**](InvoiceAdjustmentsApi.md#object_delete_invoice_adjustment) | **DELETE** /v1/object/invoice-adjustment/{id} | CRUD: Delete InvoiceAdjustment
[**object_get_invoice_adjustment**](InvoiceAdjustmentsApi.md#object_get_invoice_adjustment) | **GET** /v1/object/invoice-adjustment/{id} | CRUD: Retrieve InvoiceAdjustment
[**object_post_invoice_adjustment**](InvoiceAdjustmentsApi.md#object_post_invoice_adjustment) | **POST** /v1/object/invoice-adjustment | CRUD: Create InvoiceAdjustment
[**object_put_invoice_adjustment**](InvoiceAdjustmentsApi.md#object_put_invoice_adjustment) | **PUT** /v1/object/invoice-adjustment/{id} | CRUD: Update InvoiceAdjustment


# **object_delete_invoice_adjustment**
> ProxyDeleteResponse object_delete_invoice_adjustment(id, opts)

CRUD: Delete InvoiceAdjustment



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::InvoiceAdjustmentsApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Delete InvoiceAdjustment
  result = api_instance.object_delete_invoice_adjustment(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoiceAdjustmentsApi->object_delete_invoice_adjustment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyDeleteResponse**](ProxyDeleteResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_get_invoice_adjustment**
> ProxyGetInvoiceAdjustment object_get_invoice_adjustment(id, opts)

CRUD: Retrieve InvoiceAdjustment



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::InvoiceAdjustmentsApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  fields: "fields_example" # String | Object fields to return
}

begin
  #CRUD: Retrieve InvoiceAdjustment
  result = api_instance.object_get_invoice_adjustment(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoiceAdjustmentsApi->object_get_invoice_adjustment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetInvoiceAdjustment**](ProxyGetInvoiceAdjustment.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_post_invoice_adjustment**
> ProxyCreateOrModifyResponse object_post_invoice_adjustment(create_request, opts)

CRUD: Create InvoiceAdjustment



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::InvoiceAdjustmentsApi.new

create_request = SwaggerClient::ProxyCreateInvoiceAdjustment.new # ProxyCreateInvoiceAdjustment | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Create InvoiceAdjustment
  result = api_instance.object_post_invoice_adjustment(create_request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoiceAdjustmentsApi->object_post_invoice_adjustment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_request** | [**ProxyCreateInvoiceAdjustment**](ProxyCreateInvoiceAdjustment.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_put_invoice_adjustment**
> ProxyCreateOrModifyResponse object_put_invoice_adjustment(id, modify_request, opts)

CRUD: Update InvoiceAdjustment



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::InvoiceAdjustmentsApi.new

id = "id_example" # String | Object id

modify_request = SwaggerClient::ProxyModifyInvoiceAdjustment.new # ProxyModifyInvoiceAdjustment | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Update InvoiceAdjustment
  result = api_instance.object_put_invoice_adjustment(id, modify_request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoiceAdjustmentsApi->object_put_invoice_adjustment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifyInvoiceAdjustment**](ProxyModifyInvoiceAdjustment.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



