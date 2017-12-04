# SwaggerClient::PaymentsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**d_elete_payment**](PaymentsApi.md#d_elete_payment) | **DELETE** /v1/payments/{paymentId} | Delete payment
[**g_et_payment**](PaymentsApi.md#g_et_payment) | **GET** /v1/payments/{paymentId} | Get payment
[**g_et_payment_item_part**](PaymentsApi.md#g_et_payment_item_part) | **GET** /v1/payments/{paymentId}/parts/{partid}/itemparts/{itempartid} | Get payment part item
[**g_et_payment_item_parts**](PaymentsApi.md#g_et_payment_item_parts) | **GET** /v1/payments/{paymentId}/parts/{partid}/itemparts | Get payment part items
[**g_et_payment_part**](PaymentsApi.md#g_et_payment_part) | **GET** /v1/payments/{paymentId}/parts/{partid} | Get payment part
[**g_et_payment_parts**](PaymentsApi.md#g_et_payment_parts) | **GET** /v1/payments/{paymentId}/parts | Get payment parts
[**g_et_retrieve_all_payments**](PaymentsApi.md#g_et_retrieve_all_payments) | **GET** /v1/payments | Get all payments
[**object_delete_payment**](PaymentsApi.md#object_delete_payment) | **DELETE** /v1/object/payment/{id} | CRUD: Delete payment
[**object_get_payment**](PaymentsApi.md#object_get_payment) | **GET** /v1/object/payment/{id} | CRUD: Get payment
[**object_post_payment**](PaymentsApi.md#object_post_payment) | **POST** /v1/object/payment | CRUD: Create payment
[**object_put_payment**](PaymentsApi.md#object_put_payment) | **PUT** /v1/object/payment/{id} | CRUD: Update payment
[**p_ost_create_payment**](PaymentsApi.md#p_ost_create_payment) | **POST** /v1/payments | Create payment
[**p_ost_refund_payment**](PaymentsApi.md#p_ost_refund_payment) | **POST** /v1/payments/{paymentId}/refunds | Refund payment
[**p_ut_apply_payment**](PaymentsApi.md#p_ut_apply_payment) | **PUT** /v1/payments/{paymentId}/apply | Apply payment
[**p_ut_cancel_payment**](PaymentsApi.md#p_ut_cancel_payment) | **PUT** /v1/payments/{paymentId}/cancel | Cancel payment
[**p_ut_transfer_payment**](PaymentsApi.md#p_ut_transfer_payment) | **PUT** /v1/payments/{paymentId}/transfer | Transfer payment
[**p_ut_unapply_payment**](PaymentsApi.md#p_ut_unapply_payment) | **PUT** /v1/payments/{paymentId}/unapply | Unapply payment
[**p_ut_update_payment**](PaymentsApi.md#p_ut_update_payment) | **PUT** /v1/payments/{paymentId} | Update payment


# **d_elete_payment**
> CommonResponseType d_elete_payment(payment_id, opts)

Delete payment

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Deletes a payment. Only payments with the Cancelled status can be deleted.  

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

payment_id = "payment_id_example" # String | The unique ID of an unapplied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Delete payment
  result = api_instance.d_elete_payment(payment_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->d_elete_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payment_id** | **String**| The unique ID of an unapplied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_payment**
> GETARPaymentType g_et_payment(payment_id, opts)

Get payment

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about one specific payment. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

payment_id = "payment_id_example" # String | The unique ID of a payment. For example, 8a8082e65b27f6c3015b89e4344c16b1. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get payment
  result = api_instance.g_et_payment(payment_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->g_et_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payment_id** | **String**| The unique ID of a payment. For example, 8a8082e65b27f6c3015b89e4344c16b1.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETARPaymentType**](GETARPaymentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_payment_item_part**
> GETPaymentItemPartType g_et_payment_item_part(partid, itempartid, payment_id, opts)

Get payment part item

**Note:** The Invoice Item Settlement feature is in **Limited Availability**, and it must be used together with other Advanced AR Settlement features (Unapplied Payments, and Credit and Debit memos). If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the information about a specific payment part item. A payment part item is a single line item in a payment part. A payment part can consist of several different types of items. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

partid = "partid_example" # String | The unique ID of a specific payment part. You can get the payment part ID from the response of [Get payment parts](https://www.zuora.com/developer/api-reference/#operation/GET_PaymentParts). 

itempartid = "itempartid_example" # String | The unique ID of a specific payment part item. You can get the payment part item ID from the response of [Get payment part items](https://www.zuora.com/developer/api-reference/#operation/GET_PayemntItemParts). 

payment_id = "payment_id_example" # String | The unique ID of a payment. For example, 8a8082e65b27f6c3015b89e4344c16b1. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get payment part item
  result = api_instance.g_et_payment_item_part(partid, itempartid, payment_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->g_et_payment_item_part: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partid** | **String**| The unique ID of a specific payment part. You can get the payment part ID from the response of [Get payment parts](https://www.zuora.com/developer/api-reference/#operation/GET_PaymentParts).  | 
 **itempartid** | **String**| The unique ID of a specific payment part item. You can get the payment part item ID from the response of [Get payment part items](https://www.zuora.com/developer/api-reference/#operation/GET_PayemntItemParts).  | 
 **payment_id** | **String**| The unique ID of a payment. For example, 8a8082e65b27f6c3015b89e4344c16b1.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETPaymentItemPartType**](GETPaymentItemPartType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_payment_item_parts**
> GETPaymentItemPartCollectionType g_et_payment_item_parts(partid, payment_id, opts)

Get payment part items

**Note:** The Invoice Item Settlement feature is in **Limited Availability**, and it must be used together with other Advanced AR Settlement features (Unapplied Payments, and Credit and Debit memos). If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about all items of a payment part. A payment part item is a single line item in a payment part. A payment part can consist of several different types of items. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

partid = "partid_example" # String | The unique ID of a specific payment part. You can get the payment part ID from the response of [Get payment parts](https://www.zuora.com/developer/api-reference/#operation/GET_PaymentParts). 

payment_id = "payment_id_example" # String | The unique ID of a payment. For example, 8a8082e65b27f6c3015b89e4344c16b1. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
}

begin
  #Get payment part items
  result = api_instance.g_et_payment_item_parts(partid, payment_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->g_et_payment_item_parts: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partid** | **String**| The unique ID of a specific payment part. You can get the payment part ID from the response of [Get payment parts](https://www.zuora.com/developer/api-reference/#operation/GET_PaymentParts).  | 
 **payment_id** | **String**| The unique ID of a payment. For example, 8a8082e65b27f6c3015b89e4344c16b1.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]

### Return type

[**GETPaymentItemPartCollectionType**](GETPaymentItemPartCollectionType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_payment_part**
> GETPaymentPartType g_et_payment_part(partid, payment_id, opts)

Get payment part

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about a specific payment part. A payment can consist of an unapplied part, and several parts applied to invoices and debit memos. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

partid = "partid_example" # String | The unique ID of a specific payment part. You can get the payment part ID from the response of [Get payment parts](https://www.zuora.com/developer/api-reference/#operation/GET_PaymentParts). 

payment_id = "payment_id_example" # String | The unique ID of a payment. For example, 8a8082e65b27f6c3015b89e4344c16b1. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get payment part
  result = api_instance.g_et_payment_part(partid, payment_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->g_et_payment_part: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partid** | **String**| The unique ID of a specific payment part. You can get the payment part ID from the response of [Get payment parts](https://www.zuora.com/developer/api-reference/#operation/GET_PaymentParts).  | 
 **payment_id** | **String**| The unique ID of a payment. For example, 8a8082e65b27f6c3015b89e4344c16b1.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETPaymentPartType**](GETPaymentPartType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_payment_parts**
> GETPaymentPartsCollectionType g_et_payment_parts(payment_id, opts)

Get payment parts

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about all parts of a payment. A payment can consist of an unapplied part, and several parts applied to invoices and debit memos. You can use this operation to get all the applied and unapplied portions of a payment. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

payment_id = "payment_id_example" # String | The unique ID of a payment. For example, 8a8082e65b27f6c3015b89e4344c16b1. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
}

begin
  #Get payment parts
  result = api_instance.g_et_payment_parts(payment_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->g_et_payment_parts: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payment_id** | **String**| The unique ID of a payment. For example, 8a8082e65b27f6c3015b89e4344c16b1.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]

### Return type

[**GETPaymentPartsCollectionType**](GETPaymentPartsCollectionType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_retrieve_all_payments**
> PaymentCollectionResponseType g_et_retrieve_all_payments(opts)

Get all payments

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about all payments from all your customer accounts. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
  fields_filterable: "fields_filterable_example", # String | This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.   A single filter uses the following form:   *fieldsFilterable* `=` *field_value*              Filters can be combined by using `&`. For example: *fieldsFilterable* `=` *field_value* & *fieldsFilterable* `=` *field_value*  *fieldsFilterable* indicates the name of a supported field that you can use to filter the response data. The supported filterable fields of this operation are as below:    - number   - status   - type   - accountId   - amount   - appliedAmount   - unappliedAmount   - refundAmount   - creditBalanceAmount   - currency   - effectiveDate   - createdDate   - createdById   - updatedDate   - updatedById   *field_value* indicates a valid value of the filterable field. If the type of the field value is string, you can set the field to `null` value for filtering. Then, you can get the response data with this field value being 'null'. For more information about these fields, see the field descriptions in the **Responses** section.     Examples:  - /payments?status=Processed  - /payments?currency=USD&status=Processed  - /payments?status=Processed&type=External&sort=+number 
  sort: "sort_example" # String | This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.    - The `-` operator indicates an ascending order.   - The `+` operator indicates a descending order.  By default, the response data is displayed in descending order by payment number.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - number   - accountId   - amount   - appliedAmount   - unappliedAmount   - refundAmount   - creditBalanceAmount   - effectiveDate   - createdDate   - createdById   - updatedDate   - updatedById    Examples:  - /payments?sort=+number  - /payments?status=Processed&sort=-number,+amount 
}

begin
  #Get all payments
  result = api_instance.g_et_retrieve_all_payments(opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->g_et_retrieve_all_payments: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]
 **fields_filterable** | **String**| This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.   A single filter uses the following form:   *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value*              Filters can be combined by using &#x60;&amp;&#x60;. For example: *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value* &amp; *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value*  *fieldsFilterable* indicates the name of a supported field that you can use to filter the response data. The supported filterable fields of this operation are as below:    - number   - status   - type   - accountId   - amount   - appliedAmount   - unappliedAmount   - refundAmount   - creditBalanceAmount   - currency   - effectiveDate   - createdDate   - createdById   - updatedDate   - updatedById   *field_value* indicates a valid value of the filterable field. If the type of the field value is string, you can set the field to &#x60;null&#x60; value for filtering. Then, you can get the response data with this field value being &#39;null&#39;. For more information about these fields, see the field descriptions in the **Responses** section.     Examples:  - /payments?status&#x3D;Processed  - /payments?currency&#x3D;USD&amp;status&#x3D;Processed  - /payments?status&#x3D;Processed&amp;type&#x3D;External&amp;sort&#x3D;+number  | [optional] 
 **sort** | **String**| This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.    - The &#x60;-&#x60; operator indicates an ascending order.   - The &#x60;+&#x60; operator indicates a descending order.  By default, the response data is displayed in descending order by payment number.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - number   - accountId   - amount   - appliedAmount   - unappliedAmount   - refundAmount   - creditBalanceAmount   - effectiveDate   - createdDate   - createdById   - updatedDate   - updatedById    Examples:  - /payments?sort&#x3D;+number  - /payments?status&#x3D;Processed&amp;sort&#x3D;-number,+amount  | [optional] 

### Return type

[**PaymentCollectionResponseType**](PaymentCollectionResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_delete_payment**
> ProxyDeleteResponse object_delete_payment(id, opts)

CRUD: Delete payment

Deletes a payment. Only payments with the Cancelled status can be deleted.  

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

id = "id_example" # String | The unique ID of the payment to be deleted. For example, 2c92c0f85d4e95ae015d4f7e5d690622. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Delete payment
  result = api_instance.object_delete_payment(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->object_delete_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique ID of the payment to be deleted. For example, 2c92c0f85d4e95ae015d4f7e5d690622.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyDeleteResponse**](ProxyDeleteResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_get_payment**
> ProxyGetPayment object_get_payment(id, opts)

CRUD: Get payment

Retrives the information about one specific payment.  

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

id = "id_example" # String | The unique ID of a payment. For example, 2c92c095592623ea01596621ada84352. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Get payment
  result = api_instance.object_get_payment(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->object_get_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique ID of a payment. For example, 2c92c095592623ea01596621ada84352.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyGetPayment**](ProxyGetPayment.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_post_payment**
> ProxyCreateOrModifyResponse object_post_payment(create_request, opts)

CRUD: Create payment

Creates a payment. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

create_request = SwaggerClient::ProxyCreatePayment.new # ProxyCreatePayment | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Create payment
  result = api_instance.object_post_payment(create_request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->object_post_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_request** | [**ProxyCreatePayment**](ProxyCreatePayment.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_put_payment**
> ProxyCreateOrModifyResponse object_put_payment(id, modify_request, opts)

CRUD: Update payment

Updates a payment.  

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

id = "id_example" # String | The unique ID of a payment. For example, 2c92c095592623ea01596621ada84352. 

modify_request = SwaggerClient::ProxyModifyPayment.new # ProxyModifyPayment | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Update payment
  result = api_instance.object_put_payment(id, modify_request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->object_put_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The unique ID of a payment. For example, 2c92c095592623ea01596621ada84352.  | 
 **modify_request** | [**ProxyModifyPayment**](ProxyModifyPayment.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_create_payment**
> GETARPaymentType p_ost_create_payment(body, opts)

Create payment

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Creates a payment for the following scenarios:  - A full payment on an invoice or debit memo - A partial payment - A payment for several invoices and debit memos - An unapplied payment   If you do not know to which customer account the payment belongs, you can create a payment without specifying a customer account.  For more information, see [Create Payments](https://knowledgecenter.zuora.com/CB_Billing/Advanced_AR_Settlement/A_Unapplied_Payments/Management_of_Unapplied_Payments/AA_Create_Payments) and [Create Payments Without Specifying Customer Accounts](https://knowledgecenter.zuora.com/CB_Billing/Advanced_AR_Settlement/A_Unapplied_Payments/Management_of_Unapplied_Payments/AA_Create_Payments_Without_Specifying_Customer_Accounts).      

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

body = SwaggerClient::CreatePaymentType.new # CreatePaymentType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create payment
  result = api_instance.p_ost_create_payment(body, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->p_ost_create_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CreatePaymentType**](CreatePaymentType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETARPaymentType**](GETARPaymentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_refund_payment**
> GETRefundPaymentType p_ost_refund_payment(body, payment_id, opts)

Refund payment

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Refunds a full or partial unapplied payment to your customers. To refund applied payments, you must unapply the applied payments from the invoices or debit memos, and then refund the unapplied payments to customers.  For more information, see [Refund Payments](https://knowledgecenter.zuora.com/CB_Billing/Advanced_AR_Settlement/A_Unapplied_Payments/Management_of_Unapplied_Payments/Z_Refund_Payments). 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

body = SwaggerClient::PostRefundType.new # PostRefundType | 

payment_id = "payment_id_example" # String | The unique ID of an unapplied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Refund payment
  result = api_instance.p_ost_refund_payment(body, payment_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->p_ost_refund_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PostRefundType**](PostRefundType.md)|  | 
 **payment_id** | **String**| The unique ID of an unapplied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETRefundPaymentType**](GETRefundPaymentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_apply_payment**
> GETARPaymentType p_ut_apply_payment(body, payment_id, opts)

Apply payment

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Applies an unapplied payment to invoices and debit memos.  For more information, see [Apply Unapplied Payments to Invoices and Debit Memos](https://knowledgecenter.zuora.com/CB_Billing/Advanced_AR_Settlement/A_Unapplied_Payments/Management_of_Unapplied_Payments/Apply_Unapplied_Payments_to_Invoices_and_Debit_Memos). 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

body = SwaggerClient::ApplyPaymentType.new # ApplyPaymentType | 

payment_id = "payment_id_example" # String | The unique ID of an unapplied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Apply payment
  result = api_instance.p_ut_apply_payment(body, payment_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->p_ut_apply_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ApplyPaymentType**](ApplyPaymentType.md)|  | 
 **payment_id** | **String**| The unique ID of an unapplied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETARPaymentType**](GETARPaymentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_cancel_payment**
> GETARPaymentType p_ut_cancel_payment(payment_id, opts)

Cancel payment

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Cancels a payment. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

payment_id = "payment_id_example" # String | The unique ID of an unapplied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Cancel payment
  result = api_instance.p_ut_cancel_payment(payment_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->p_ut_cancel_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payment_id** | **String**| The unique ID of an unapplied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETARPaymentType**](GETARPaymentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_transfer_payment**
> GETARPaymentType p_ut_transfer_payment(body, payment_id, opts)

Transfer payment

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Transfers an unapplied payment.  For more information, see [Transfer Unapplied Payments](https://knowledgecenter.zuora.com/CB_Billing/Advanced_AR_Settlement/A_Unapplied_Payments/Management_of_Unapplied_Payments/Transfer_Unapplied_Payments). 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

body = SwaggerClient::TransferPaymentType.new # TransferPaymentType | 

payment_id = "payment_id_example" # String | The unique ID of an unapplied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Transfer payment
  result = api_instance.p_ut_transfer_payment(body, payment_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->p_ut_transfer_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TransferPaymentType**](TransferPaymentType.md)|  | 
 **payment_id** | **String**| The unique ID of an unapplied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETARPaymentType**](GETARPaymentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_unapply_payment**
> GETARPaymentType p_ut_unapply_payment(body, payment_id, opts)

Unapply payment

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Unapplies an applied payment from invoices and debit memos.  For more information, see [Unapply Payments from Invoices and Debit Memos](https://knowledgecenter.zuora.com/CB_Billing/Advanced_AR_Settlement/A_Unapplied_Payments/Management_of_Unapplied_Payments/Unapply_Payments_from_Invoices_and_Debit_Memos). 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

body = SwaggerClient::UnapplyPaymentType.new # UnapplyPaymentType | 

payment_id = "payment_id_example" # String | The unique ID of an applied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Unapply payment
  result = api_instance.p_ut_unapply_payment(body, payment_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->p_ut_unapply_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UnapplyPaymentType**](UnapplyPaymentType.md)|  | 
 **payment_id** | **String**| The unique ID of an applied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETARPaymentType**](GETARPaymentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_update_payment**
> GETARPaymentType p_ut_update_payment(body, payment_id, opts)

Update payment

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Updates a payment. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::PaymentsApi.new

body = SwaggerClient::UpdatePaymentType.new # UpdatePaymentType | 

payment_id = "payment_id_example" # String | The unique ID of an unapplied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Update payment
  result = api_instance.p_ut_update_payment(body, payment_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentsApi->p_ut_update_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UpdatePaymentType**](UpdatePaymentType.md)|  | 
 **payment_id** | **String**| The unique ID of an unapplied payment. For example, 8a8082e65b27f6c3015b89e4344c16b1.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETARPaymentType**](GETARPaymentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



