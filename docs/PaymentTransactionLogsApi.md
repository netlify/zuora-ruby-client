# SwaggerClient::PaymentTransactionLogsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_get_payment_transaction_log**](PaymentTransactionLogsApi.md#object_get_payment_transaction_log) | **GET** /v1/object/payment-transaction-log/{id} | CRUD: Get payment transaction log


# **object_get_payment_transaction_log**
> ProxyGetPaymentTransactionLog object_get_payment_transaction_log(id, opts)

CRUD: Get payment transaction log

Retrieves information about a specific payment transaction log. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentTransactionLogsApi.new

id = "id_example" # String | The ID of a payment transaction log. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Get payment transaction log
  result = api_instance.object_get_payment_transaction_log(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentTransactionLogsApi->object_get_payment_transaction_log: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID of a payment transaction log.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyGetPaymentTransactionLog**](ProxyGetPaymentTransactionLog.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



