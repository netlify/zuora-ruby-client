# Zuora::InvoiceAdjustmentsApi

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
require 'zuora'

api_instance = Zuora::InvoiceAdjustmentsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Delete InvoiceAdjustment
  result = api_instance.object_delete_invoice_adjustment(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoiceAdjustmentsApi->object_delete_invoice_adjustment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

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
require 'zuora'

api_instance = Zuora::InvoiceAdjustmentsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
}

begin
  #CRUD: Retrieve InvoiceAdjustment
  result = api_instance.object_get_invoice_adjustment(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoiceAdjustmentsApi->object_get_invoice_adjustment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
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
require 'zuora'

api_instance = Zuora::InvoiceAdjustmentsApi.new

create_request = Zuora::ProxyCreateInvoiceAdjustment.new # ProxyCreateInvoiceAdjustment | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Create InvoiceAdjustment
  result = api_instance.object_post_invoice_adjustment(create_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoiceAdjustmentsApi->object_post_invoice_adjustment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_request** | [**ProxyCreateInvoiceAdjustment**](ProxyCreateInvoiceAdjustment.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

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
require 'zuora'

api_instance = Zuora::InvoiceAdjustmentsApi.new

id = 'id_example' # String | Object id

modify_request = Zuora::ProxyModifyInvoiceAdjustment.new # ProxyModifyInvoiceAdjustment | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Update InvoiceAdjustment
  result = api_instance.object_put_invoice_adjustment(id, modify_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoiceAdjustmentsApi->object_put_invoice_adjustment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifyInvoiceAdjustment**](ProxyModifyInvoiceAdjustment.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



