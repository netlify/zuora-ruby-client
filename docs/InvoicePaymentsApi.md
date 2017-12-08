# Zuora::InvoicePaymentsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_get_invoice_payment**](InvoicePaymentsApi.md#object_get_invoice_payment) | **GET** /v1/object/invoice-payment/{id} | CRUD: Retrieve InvoicePayment
[**object_post_invoice_payment**](InvoicePaymentsApi.md#object_post_invoice_payment) | **POST** /v1/object/invoice-payment | CRUD: Create InvoicePayment
[**object_put_invoice_payment**](InvoicePaymentsApi.md#object_put_invoice_payment) | **PUT** /v1/object/invoice-payment/{id} | CRUD: Update InvoicePayment


# **object_get_invoice_payment**
> ProxyGetInvoicePayment object_get_invoice_payment(id, opts)

CRUD: Retrieve InvoicePayment



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoicePaymentsApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  fields: "fields_example" # String | Object fields to return
}

begin
  #CRUD: Retrieve InvoicePayment
  result = api_instance.object_get_invoice_payment(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoicePaymentsApi->object_get_invoice_payment: #{e}"
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

[**ProxyGetInvoicePayment**](ProxyGetInvoicePayment.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_post_invoice_payment**
> ProxyCreateOrModifyResponse object_post_invoice_payment(create_request, opts)

CRUD: Create InvoicePayment



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoicePaymentsApi.new

create_request = Zuora::ProxyCreateInvoicePayment.new # ProxyCreateInvoicePayment | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Create InvoicePayment
  result = api_instance.object_post_invoice_payment(create_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoicePaymentsApi->object_post_invoice_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_request** | [**ProxyCreateInvoicePayment**](ProxyCreateInvoicePayment.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_put_invoice_payment**
> ProxyCreateOrModifyResponse object_put_invoice_payment(id, modify_request, opts)

CRUD: Update InvoicePayment



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoicePaymentsApi.new

id = "id_example" # String | Object id

modify_request = Zuora::ProxyModifyInvoicePayment.new # ProxyModifyInvoicePayment | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Update InvoicePayment
  result = api_instance.object_put_invoice_payment(id, modify_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoicePaymentsApi->object_put_invoice_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifyInvoicePayment**](ProxyModifyInvoicePayment.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



