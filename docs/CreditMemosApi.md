# Zuora::CreditMemosApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_credit_memo**](CreditMemosApi.md#delete_credit_memo) | **DELETE** /v1/creditmemos/{creditMemoId} | Delete credit memo
[**get_breakdown_credit_memo_by_order**](CreditMemosApi.md#get_breakdown_credit_memo_by_order) | **GET** /v1/creditmemos/{creditMemoNumber}/amountBreakdownByOrder | Get breakdown of credit memo by order
[**get_credit_memo**](CreditMemosApi.md#get_credit_memo) | **GET** /v1/creditmemos/{creditMemoId} | Get credit memo
[**get_credit_memo_item**](CreditMemosApi.md#get_credit_memo_item) | **GET** /v1/creditmemos/{creditMemoId}/items/{cmitemid} | Get credit memo item
[**get_credit_memo_item_part**](CreditMemosApi.md#get_credit_memo_item_part) | **GET** /v1/creditmemos/{creditMemoId}/parts/{partid}/itemparts/{itempartid} | Get credit memo part item
[**get_credit_memo_item_parts**](CreditMemosApi.md#get_credit_memo_item_parts) | **GET** /v1/creditmemos/{creditMemoId}/parts/{partid}/itemparts | Get credit memo part items
[**get_credit_memo_items**](CreditMemosApi.md#get_credit_memo_items) | **GET** /v1/creditmemos/{creditMemoId}/items | Get credit memo items
[**get_credit_memo_part**](CreditMemosApi.md#get_credit_memo_part) | **GET** /v1/creditmemos/{creditMemoId}/parts/{partid} | Get credit memo part
[**get_credit_memo_parts**](CreditMemosApi.md#get_credit_memo_parts) | **GET** /v1/creditmemos/{creditMemoId}/parts | Get credit memo parts
[**get_credit_memos**](CreditMemosApi.md#get_credit_memos) | **GET** /v1/creditmemos | Get credit memos
[**post_credit_memo_from_prpc**](CreditMemosApi.md#post_credit_memo_from_prpc) | **POST** /v1/creditmemos | Create credit memo from charge
[**post_credit_memo_pdf**](CreditMemosApi.md#post_credit_memo_pdf) | **POST** /v1/creditmemos/{creditMemoId}/pdfs | Create credit memo PDF
[**post_email_credit_memo**](CreditMemosApi.md#post_email_credit_memo) | **POST** /v1/creditmemos/{creditMemoId}/emails | Email credit memo
[**post_refund_credit_memo**](CreditMemosApi.md#post_refund_credit_memo) | **POST** /v1/creditmemos/{creditmemoId}/refunds | Refund credit memo
[**post_cm_taxation_items**](CreditMemosApi.md#post_cm_taxation_items) | **POST** /v1/creditmemos/{creditMemoId}/taxationitems | Create taxation items for credit memo
[**put_apply_credit_memo**](CreditMemosApi.md#put_apply_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/apply | Apply credit memo
[**put_cancel_credit_memo**](CreditMemosApi.md#put_cancel_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/cancel | Cancel credit memo
[**put_post_credit_memo**](CreditMemosApi.md#put_post_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/post | Post credit memo
[**put_unapply_credit_memo**](CreditMemosApi.md#put_unapply_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/unapply | Unapply credit memo
[**put_update_credit_memo**](CreditMemosApi.md#put_update_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId} | Update credit memo


# **delete_credit_memo**
> CommonResponseType delete_credit_memo(credit_memo_id, opts)

Delete credit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Deletes a credit memo. Only credit memos with the Cancelled status can be deleted.   You can delete a credit memo only if you have the user permission. See [Billing Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles) for more information. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Delete credit memo
  result = api_instance.delete_credit_memo(credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->delete_credit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_breakdown_credit_memo_by_order**
> GetCreditMemoAmountBreakdownByOrderResponse get_breakdown_credit_memo_by_order(credit_memo_number, opts)

Get breakdown of credit memo by order

**Note:** This operation is only available if you have the [Advanced AR Settlement](https://knowledgecenter.zuora.com/CB_Billing/Advanced_AR_Settlement) and [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) features enabled. If you wish to have access to the features, submit a request at [Zuora Global Support](http://support.zuora.com/). If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.   Retrieves a specified credit memo that is broken down by orders. The credit memo items might be broken down into a list of order rated items. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

credit_memo_number = "credit_memo_number_example" # String | Number of credit memo to be broken down.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get breakdown of credit memo by order
  result = api_instance.get_breakdown_credit_memo_by_order(credit_memo_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->get_breakdown_credit_memo_by_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **credit_memo_number** | **String**| Number of credit memo to be broken down. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GetCreditMemoAmountBreakdownByOrderResponse**](GetCreditMemoAmountBreakdownByOrderResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_credit_memo**
> GETCreditMemoType get_credit_memo(credit_memo_id, opts)

Get credit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about a specific credit memo. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get credit memo
  result = api_instance.get_credit_memo(credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->get_credit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETCreditMemoType**](GETCreditMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_credit_memo_item**
> GETCreditMemoItemType get_credit_memo_item(cmitemid, credit_memo_id, opts)

Get credit memo item

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the information about a specific item of a credit memo. A credit memo item is a single line item in a credit memo. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

cmitemid = "cmitemid_example" # String | The unique ID of a credit memo item. You can get the credit memo item ID from the response of [Get credit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoItems). 

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get credit memo item
  result = api_instance.get_credit_memo_item(cmitemid, credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->get_credit_memo_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cmitemid** | **String**| The unique ID of a credit memo item. You can get the credit memo item ID from the response of [Get credit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoItems).  | 
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETCreditMemoItemType**](GETCreditMemoItemType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_credit_memo_item_part**
> GETCreditMemoItemPartType get_credit_memo_item_part(partid, itempartid, credit_memo_id, opts)

Get credit memo part item

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the information about a specific credit memo part item.  A credit memo part item is a single line item in a credit memo part. A credit memo part can consist of several different types of items. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

partid = "partid_example" # String | The unique ID of a specific credit memo part. You can get the credit memo part ID from the response of [Get credit memo parts](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoParts). 

itempartid = "itempartid_example" # String | The unique ID of a specific credit memo part item. You can get the credit memo part item ID from the response of [Get credit memo part items](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoItemParts). 

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get credit memo part item
  result = api_instance.get_credit_memo_item_part(partid, itempartid, credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->get_credit_memo_item_part: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partid** | **String**| The unique ID of a specific credit memo part. You can get the credit memo part ID from the response of [Get credit memo parts](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoParts).  | 
 **itempartid** | **String**| The unique ID of a specific credit memo part item. You can get the credit memo part item ID from the response of [Get credit memo part items](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoItemParts).  | 
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETCreditMemoItemPartType**](GETCreditMemoItemPartType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_credit_memo_item_parts**
> GETCreditMemoItemPartsCollectionType get_credit_memo_item_parts(partid, credit_memo_id, opts)

Get credit memo part items

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about all items of a credit memo part. A credit memo part item is a single line item in a credit memo part. A credit memo part can consist of several different types of items. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

partid = "partid_example" # String | The unique ID of a specific credit memo part. You can get the credit memo part ID from the response of [Get credit memo parts](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoParts). . 

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
}

begin
  #Get credit memo part items
  result = api_instance.get_credit_memo_item_parts(partid, credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->get_credit_memo_item_parts: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partid** | **String**| The unique ID of a specific credit memo part. You can get the credit memo part ID from the response of [Get credit memo parts](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoParts). .  | 
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]

### Return type

[**GETCreditMemoItemPartsCollectionType**](GETCreditMemoItemPartsCollectionType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_credit_memo_items**
> GETCreditMemoItemsListType get_credit_memo_items(credit_memo_id, opts)

Get credit memo items

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about all items of a credit memo. A credit memo item is a single line item in a credit memo.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
  fields_filterable: "fields_filterable_example", # String | This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.   A single filter uses the following form:   *fieldsFilterable* `=` *field_value*              Filters can be combined by using `&`. For example: *fieldsFilterable* `=` *field_value* `&` *fieldsFilterable* `=` *field_value*  *fieldsFilterable* indicates the name of a supported field that you can use to filter the response data. The supported filterable fields of this operation are as below:    - id   - amount   - appliedAmount   - refundAmount   - sku   - skuName   - serviceStartDate   - serviceEndDate   - sourceItemId   - createdDate   - createdById   - updatedDate   - updatedById   - subscriptionId   *field_value* indicates a valid value of the filterable field. If the type of the field value is string, you can set the field to `null` value for filtering. Then, you can get the response data with this field value being 'null'. For more information about these fields, see the field descriptions in the **Responses** section.     Examples:  - /creditmemos/402890245c7ca371015c7cb40ac30015/items?amount=100  - /creditmemos/402890245c7ca371015c7cb40ac30015/items?amount=100&sort=createdDate 
  sort: "sort_example" # String | This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.    - The `-` operator indicates an ascending order.   - The `+` operator indicates a descending order.  By default, the response data is displayed in descending order by updated date.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - id   - amount   - appliedAmount   - refundAmount   - sku   - skuName   - serviceStartDate   - serviceEndDate   - sourceItemId   - createdDate   - createdById   - updatedDate   - updatedById   - subscriptionId    Examples:  - /creditmemos/402890245c7ca371015c7cb40ac30015/items?sort=createdDate  - /creditmemos/402890245c7ca371015c7cb40ac30015/items?amount=100&sort=createdDate 
}

begin
  #Get credit memo items
  result = api_instance.get_credit_memo_items(credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->get_credit_memo_items: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]
 **fields_filterable** | **String**| This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.   A single filter uses the following form:   *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value*              Filters can be combined by using &#x60;&amp;&#x60;. For example: *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value* &#x60;&amp;&#x60; *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value*  *fieldsFilterable* indicates the name of a supported field that you can use to filter the response data. The supported filterable fields of this operation are as below:    - id   - amount   - appliedAmount   - refundAmount   - sku   - skuName   - serviceStartDate   - serviceEndDate   - sourceItemId   - createdDate   - createdById   - updatedDate   - updatedById   - subscriptionId   *field_value* indicates a valid value of the filterable field. If the type of the field value is string, you can set the field to &#x60;null&#x60; value for filtering. Then, you can get the response data with this field value being &#39;null&#39;. For more information about these fields, see the field descriptions in the **Responses** section.     Examples:  - /creditmemos/402890245c7ca371015c7cb40ac30015/items?amount&#x3D;100  - /creditmemos/402890245c7ca371015c7cb40ac30015/items?amount&#x3D;100&amp;sort&#x3D;createdDate  | [optional] 
 **sort** | **String**| This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.    - The &#x60;-&#x60; operator indicates an ascending order.   - The &#x60;+&#x60; operator indicates a descending order.  By default, the response data is displayed in descending order by updated date.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - id   - amount   - appliedAmount   - refundAmount   - sku   - skuName   - serviceStartDate   - serviceEndDate   - sourceItemId   - createdDate   - createdById   - updatedDate   - updatedById   - subscriptionId    Examples:  - /creditmemos/402890245c7ca371015c7cb40ac30015/items?sort&#x3D;createdDate  - /creditmemos/402890245c7ca371015c7cb40ac30015/items?amount&#x3D;100&amp;sort&#x3D;createdDate  | [optional] 

### Return type

[**GETCreditMemoItemsListType**](GETCreditMemoItemsListType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_credit_memo_part**
> GETCreditMemoPartType get_credit_memo_part(partid, credit_memo_id, opts)

Get credit memo part

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about a specific credit memo part. A credit memo can consist of an unapplied part, and several parts applied to invoices and debit memos. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

partid = "partid_example" # String | The unique ID of a specific credit memo part. You can get the credit memo part ID from the response of [Get credit memo parts](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoParts). 

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get credit memo part
  result = api_instance.get_credit_memo_part(partid, credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->get_credit_memo_part: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partid** | **String**| The unique ID of a specific credit memo part. You can get the credit memo part ID from the response of [Get credit memo parts](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoParts).  | 
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETCreditMemoPartType**](GETCreditMemoPartType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_credit_memo_parts**
> GETCreditMemoPartsCollectionType get_credit_memo_parts(credit_memo_id, opts)

Get credit memo parts

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about all parts of a credit memo. A credit memo can consist of an unapplied part, and several parts applied to invoices and debit memos. You can use this operation to get all the applied and unapplied portions of a credit memo. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
}

begin
  #Get credit memo parts
  result = api_instance.get_credit_memo_parts(credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->get_credit_memo_parts: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]

### Return type

[**GETCreditMemoPartsCollectionType**](GETCreditMemoPartsCollectionType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_credit_memos**
> GETCreditMemoCollectionType get_credit_memos(opts)

Get credit memos

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about all credit memos. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
  fields_filterable: "fields_filterable_example", # String | This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.   A single filter uses the following form:   *fieldsFilterable* `=` *field_value*              Filters can be combined by using `&`. For example: *fieldsFilterable* `=` *field_value* `&` *fieldsFilterable* `=` *field_value*  *fieldsFilterable* indicates the name of a supported field that you can use to filter the response data. The supported filterable fields of this operation are as below:    - number   - accountId    - currency   - creditMemoDate   - targetDate   - status   - amount   - taxAmount   - totalTaxExemptAmount   - unappliedAmount   - refundAmount   - appliedAmount   - referredInvoiceId   - transferredToAccounting   - createdDate   - createdById   - updatedDate   - updatedById   - autoApplyUponPosting   - excludeFromAutoApplyRules   *field_value* indicates a valid value of the filterable field. If the type of the field value is string, you can set the field to `null` value for filtering. Then, you can get the response data with this field value being 'null'. For more information about these fields, see the field descriptions in the **Responses** section.     Examples:  - /creditmemos?status=Processed  - /creditmemos?referredInvoiceId=null&status=Draft  - /creditmemos?status=Processed&type=External&sort=+number 
  sort: "sort_example" # String | This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.    - The `-` operator indicates an ascending order.   - The `+` operator indicates a descending order.  By default, the response data is displayed in descending order by credit memo number.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - number   - accountId    - creditMemoDate   - targetDate   - status   - amount   - taxAmount   - totalTaxExemptAmount   - unappliedAmount   - refundAmount   - appliedAmount   - referredInvoiceId   - transferredToAccounting   - createdDate   - createdById   - updatedDate     Examples:  - /creditmemos?sort=+number  - /creditmemos?status=Processed&sort=-number,+amount 
}

begin
  #Get credit memos
  result = api_instance.get_credit_memos(opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->get_credit_memos: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]
 **fields_filterable** | **String**| This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.   A single filter uses the following form:   *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value*              Filters can be combined by using &#x60;&amp;&#x60;. For example: *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value* &#x60;&amp;&#x60; *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value*  *fieldsFilterable* indicates the name of a supported field that you can use to filter the response data. The supported filterable fields of this operation are as below:    - number   - accountId    - currency   - creditMemoDate   - targetDate   - status   - amount   - taxAmount   - totalTaxExemptAmount   - unappliedAmount   - refundAmount   - appliedAmount   - referredInvoiceId   - transferredToAccounting   - createdDate   - createdById   - updatedDate   - updatedById   - autoApplyUponPosting   - excludeFromAutoApplyRules   *field_value* indicates a valid value of the filterable field. If the type of the field value is string, you can set the field to &#x60;null&#x60; value for filtering. Then, you can get the response data with this field value being &#39;null&#39;. For more information about these fields, see the field descriptions in the **Responses** section.     Examples:  - /creditmemos?status&#x3D;Processed  - /creditmemos?referredInvoiceId&#x3D;null&amp;status&#x3D;Draft  - /creditmemos?status&#x3D;Processed&amp;type&#x3D;External&amp;sort&#x3D;+number  | [optional] 
 **sort** | **String**| This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.    - The &#x60;-&#x60; operator indicates an ascending order.   - The &#x60;+&#x60; operator indicates a descending order.  By default, the response data is displayed in descending order by credit memo number.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - number   - accountId    - creditMemoDate   - targetDate   - status   - amount   - taxAmount   - totalTaxExemptAmount   - unappliedAmount   - refundAmount   - appliedAmount   - referredInvoiceId   - transferredToAccounting   - createdDate   - createdById   - updatedDate     Examples:  - /creditmemos?sort&#x3D;+number  - /creditmemos?status&#x3D;Processed&amp;sort&#x3D;-number,+amount  | [optional] 

### Return type

[**GETCreditMemoCollectionType**](GETCreditMemoCollectionType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_credit_memo_from_prpc**
> GETCreditMemoType post_credit_memo_from_prpc(body, opts)

Create credit memo from charge

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Creates an ad-hoc credit memo from a product rate plan charge. Zuora only supports one-time negative charges for credit memos.   You can create a credit memo only if you have the user permission. See [Billing Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles) for more information. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

body = Zuora::CreditMemoFromChargeType.new # CreditMemoFromChargeType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create credit memo from charge
  result = api_instance.post_credit_memo_from_prpc(body, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->post_credit_memo_from_prpc: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CreditMemoFromChargeType**](CreditMemoFromChargeType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETCreditMemoType**](GETCreditMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_credit_memo_pdf**
> POSTMemoPdfResponse post_credit_memo_pdf(credit_memo_id, opts)

Create credit memo PDF

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Creates PDF for a specified credit memo. To access the generated PDF, you can download it by clicking **View PDF** on the detailed credit memo page through the Zuora UI. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

credit_memo_id = "credit_memo_id_example" # String | The unique ID of the credit memo that you want to create PDF for. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create credit memo PDF
  result = api_instance.post_credit_memo_pdf(credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->post_credit_memo_pdf: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **credit_memo_id** | **String**| The unique ID of the credit memo that you want to create PDF for. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**POSTMemoPdfResponse**](POSTMemoPdfResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_email_credit_memo**
> CommonResponseType post_email_credit_memo(request, credit_memo_id, opts)

Email credit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Sends a posted credit memo to the specified email addresses manually.    ## Notes   - You must activate the **Email Credit Memo | Manually email Credit Memo** notification before emailing credit memos. To include the credit memo PDF in the email, select the **Include Credit Memo PDF** check box in the **Edit notification** dialog from the Zuora UI. See [Create and Edit Notifications](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/Notifications/C_Create_Notifications#section_2) for more information.     - Zuora sends the email messages based on the email template you set. You can set the email template to use in the **Delivery Options** panel of the **Edit notification** dialog from the Zuora UI. By default, the **Manual Email for Credit Memo Default Template** template is used. See [Create and Edit Email Templates](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/Notifications/Create_Email_Templates) for more information.     - The credit memos are sent only to the work email addresses or personal email addresses of the Bill To contact if the following conditions are all met:      * The `useEmailTemplateSetting` field is set to `false`.     * The email addresses are not specified in the `emailAddresses` field. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

request = Zuora::PostCreditMemoEmailRequestType.new # PostCreditMemoEmailRequestType | 

credit_memo_id = "credit_memo_id_example" # String | The ID of a posted credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Email credit memo
  result = api_instance.post_email_credit_memo(request, credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->post_email_credit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**PostCreditMemoEmailRequestType**](PostCreditMemoEmailRequestType.md)|  | 
 **credit_memo_id** | **String**| The ID of a posted credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_refund_credit_memo**
> GETRefundCreditMemoType post_refund_credit_memo(body, creditmemo_id, opts)

Refund credit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Refunds a full or partial posted credit memo to your customers. Only the amount of unapplied part could be refunded.   You can refund a credit memo only if you have the user permission. See [Billing Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles) for more information. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

body = Zuora::PostNonRefRefundType.new # PostNonRefRefundType | 

creditmemo_id = "creditmemo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Refund credit memo
  result = api_instance.post_refund_credit_memo(body, creditmemo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->post_refund_credit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PostNonRefRefundType**](PostNonRefRefundType.md)|  | 
 **creditmemo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETRefundCreditMemoType**](GETRefundCreditMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_cm_taxation_items**
> GETTaxationItemListType post_cm_taxation_items(credit_memo_id, body, opts)

Create taxation items for credit memo

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Creates taxation items for a credit memo. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

body = Zuora::POSTTaxationItemListForCMType.new # POSTTaxationItemListForCMType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create taxation items for credit memo
  result = api_instance.post_cm_taxation_items(credit_memo_id, body, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->post_cm_taxation_items: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **body** | [**POSTTaxationItemListForCMType**](POSTTaxationItemListForCMType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETTaxationItemListType**](GETTaxationItemListType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_apply_credit_memo**
> GETCreditMemoType put_apply_credit_memo(body, credit_memo_id, opts)

Apply credit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Applies a posted credit memo to one or more invoices and debit memos.   You can apply a credit memo to an invoice or a debit memo only if you have the user permission. See [Billing Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles) for more information. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

body = Zuora::ApplyCreditMemoType.new # ApplyCreditMemoType | 

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Apply credit memo
  result = api_instance.put_apply_credit_memo(body, credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->put_apply_credit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ApplyCreditMemoType**](ApplyCreditMemoType.md)|  | 
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETCreditMemoType**](GETCreditMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_cancel_credit_memo**
> GETCreditMemoType put_cancel_credit_memo(credit_memo_id, opts)

Cancel credit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Cancels a credit memo. Only credit memos with the Draft status can be cancelled.   You can cancel a credit memo only if you have the user permission. See [Billing Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles) for more information. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Cancel credit memo
  result = api_instance.put_cancel_credit_memo(credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->put_cancel_credit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETCreditMemoType**](GETCreditMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_post_credit_memo**
> GETCreditMemoType put_post_credit_memo(credit_memo_id, opts)

Post credit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Posts a credit memo to activate it. You can post credit memos only if you have the [Billing permissions](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles#Billing_Permissions). 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Post credit memo
  result = api_instance.put_post_credit_memo(credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->put_post_credit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETCreditMemoType**](GETCreditMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_unapply_credit_memo**
> GETCreditMemoType put_unapply_credit_memo(body, credit_memo_id, opts)

Unapply credit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Unapplies an applied credit memo from one or more invoices and debit memos. The full applied amount from invoices and debit memos is transferred into the unapplied amount of the credit memo.   You can unapply a credit memo from an invoice or a debit memo only if you have the user permission. See [Billing Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles) for more information. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

body = Zuora::UnapplyCreditMemoType.new # UnapplyCreditMemoType | 

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Unapply credit memo
  result = api_instance.put_unapply_credit_memo(body, credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->put_unapply_credit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UnapplyCreditMemoType**](UnapplyCreditMemoType.md)|  | 
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETCreditMemoType**](GETCreditMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_update_credit_memo**
> GETCreditMemoType put_update_credit_memo(body, credit_memo_id, opts)

Update credit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Updates the basic and finance information about a credit memo. Currently, Zuora supports updating tax-exclusive memo items, but does not support updating tax-inclusive memo items.   If the amount of a memo item is updated, the tax will be recalculated in the following conditions:   - The memo is created from a product rate plan charge and you use Avalara to calculate the tax.   - The memo is created from an invoice and you use Avalara or Zuora Tax to calculate the tax.  You can update a credit memo only if you have the user permission. See [Billing Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles) for more information. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::CreditMemosApi.new

body = Zuora::PUTCreditMemoType.new # PUTCreditMemoType | 

credit_memo_id = "credit_memo_id_example" # String | The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.  

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Update credit memo
  result = api_instance.put_update_credit_memo(body, credit_memo_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling CreditMemosApi->put_update_credit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PUTCreditMemoType**](PUTCreditMemoType.md)|  | 
 **credit_memo_id** | **String**| The unique ID of a credit memo. For example, 8a8082e65b27f6c3015ba45ff82c7172.   | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETCreditMemoType**](GETCreditMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



