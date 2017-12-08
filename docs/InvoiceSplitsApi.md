# Zuora::InvoiceSplitsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_get_invoice_split**](InvoiceSplitsApi.md#object_get_invoice_split) | **GET** /v1/object/invoice-split/{id} | CRUD: Retrieve InvoiceSplit


# **object_get_invoice_split**
> ProxyGetInvoiceSplit object_get_invoice_split(id, opts)

CRUD: Retrieve InvoiceSplit



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoiceSplitsApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  fields: "fields_example" # String | Object fields to return
}

begin
  #CRUD: Retrieve InvoiceSplit
  result = api_instance.object_get_invoice_split(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoiceSplitsApi->object_get_invoice_split: #{e}"
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

[**ProxyGetInvoiceSplit**](ProxyGetInvoiceSplit.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



