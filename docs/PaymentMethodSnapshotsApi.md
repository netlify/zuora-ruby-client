# Zuora::PaymentMethodSnapshotsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**object_delete_payment_method_snapshot**](PaymentMethodSnapshotsApi.md#object_delete_payment_method_snapshot) | **DELETE** /v1/object/payment-method-snapshot/{id} | CRUD: Delete PaymentMethodSnapshot
[**object_get_payment_method_snapshot**](PaymentMethodSnapshotsApi.md#object_get_payment_method_snapshot) | **GET** /v1/object/payment-method-snapshot/{id} | CRUD: Retrieve PaymentMethodSnapshot


# **object_delete_payment_method_snapshot**
> ProxyDeleteResponse object_delete_payment_method_snapshot(id, opts)

CRUD: Delete PaymentMethodSnapshot

This REST API reference describes how to delete a Payment Method Snapshot. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodSnapshotsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Delete PaymentMethodSnapshot
  result = api_instance.object_delete_payment_method_snapshot(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentMethodSnapshotsApi->object_delete_payment_method_snapshot: #{e}"
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



# **object_get_payment_method_snapshot**
> ProxyGetPaymentMethodSnapshot object_get_payment_method_snapshot(id, opts)

CRUD: Retrieve PaymentMethodSnapshot

This REST API reference describes how to retrieve a Payment Method Snapshot.  A Payment Method Snapshot is a copy of the particular Payment Method used in a transaction. If the Payment Method is deleted, the Payment Method Snapshot continues to retain the data used in each of the past transactions.  ## Notes The following Payment Method fields are not available in Payment Method Snapshots:  * `Active` * `AchAddress1` * `AchAddress2` * `CreatedById` * `CreatedDate` * `UpdatedById` * `UpdatedDate`  The Payment Method Snapshot field `PaymentMethodId` is not available in Payment Methods. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodSnapshotsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
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
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetPaymentMethodSnapshot**](ProxyGetPaymentMethodSnapshot.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



