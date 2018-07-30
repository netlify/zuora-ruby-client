# Zuora::InvoiceItemsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_get_invoice_item**](InvoiceItemsApi.md#object_get_invoice_item) | **GET** /v1/object/invoice-item/{id} | CRUD: Retrieve InvoiceItem


# **object_get_invoice_item**
> ProxyGetInvoiceItem object_get_invoice_item(id, opts)

CRUD: Retrieve InvoiceItem



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoiceItemsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
}

begin
  #CRUD: Retrieve InvoiceItem
  result = api_instance.object_get_invoice_item(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoiceItemsApi->object_get_invoice_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetInvoiceItem**](ProxyGetInvoiceItem.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



