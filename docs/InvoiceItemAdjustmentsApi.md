# SwaggerClient::InvoiceItemAdjustmentsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_delete_invoice_item_adjustment**](InvoiceItemAdjustmentsApi.md#object_delete_invoice_item_adjustment) | **DELETE** /v1/object/invoice-item-adjustment/{id} | CRUD: Delete InvoiceItemAdjustment
[**object_get_invoice_item_adjustment**](InvoiceItemAdjustmentsApi.md#object_get_invoice_item_adjustment) | **GET** /v1/object/invoice-item-adjustment/{id} | CRUD: Retrieve InvoiceItemAdjustment


# **object_delete_invoice_item_adjustment**
> ProxyDeleteResponse object_delete_invoice_item_adjustment(id, opts)

CRUD: Delete InvoiceItemAdjustment



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::InvoiceItemAdjustmentsApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Delete InvoiceItemAdjustment
  result = api_instance.object_delete_invoice_item_adjustment(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoiceItemAdjustmentsApi->object_delete_invoice_item_adjustment: #{e}"
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



# **object_get_invoice_item_adjustment**
> ProxyGetInvoiceItemAdjustment object_get_invoice_item_adjustment(id, opts)

CRUD: Retrieve InvoiceItemAdjustment



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::InvoiceItemAdjustmentsApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  fields: "fields_example" # String | Object fields to return
}

begin
  #CRUD: Retrieve InvoiceItemAdjustment
  result = api_instance.object_get_invoice_item_adjustment(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoiceItemAdjustmentsApi->object_get_invoice_item_adjustment: #{e}"
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

[**ProxyGetInvoiceItemAdjustment**](ProxyGetInvoiceItemAdjustment.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



