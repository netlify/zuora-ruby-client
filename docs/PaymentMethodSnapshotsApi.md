# Zuora::PaymentMethodSnapshotsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_get_payment_method_snapshot**](PaymentMethodSnapshotsApi.md#object_get_payment_method_snapshot) | **GET** /v1/object/payment-method-snapshot/{id} | CRUD: Retrieve PaymentMethodSnapshot


# **object_get_payment_method_snapshot**
> ProxyGetPaymentMethodSnapshot object_get_payment_method_snapshot(id, opts)

CRUD: Retrieve PaymentMethodSnapshot

This REST API reference describes how to retrieve a Payment Method Snapshot.  A Payment Method Snapshot is a copy of the particular Payment Method used in a transaction. If the Payment Method is deleted, the Payment Method Snapshot continues to retain the data used in each of the past transactions.  ## Notes The following Payment Method fields are not available in Payment Method Snapshots:  * `Active` * `AchAddress1` * `AchAddress2` * `CreatedById` * `CreatedDate` * `UpdatedById` * `UpdatedDate`  The Payment Method Snapshot field `PaymentMethodId` is not available in Payment Methods. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodSnapshotsApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  fields: "fields_example" # String | Object fields to return
}

begin
  #CRUD: Retrieve PaymentMethodSnapshot
  result = api_instance.object_get_payment_method_snapshot(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentMethodSnapshotsApi->object_get_payment_method_snapshot: #{e}"
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

[**ProxyGetPaymentMethodSnapshot**](ProxyGetPaymentMethodSnapshot.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



