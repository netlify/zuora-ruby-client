# Zuora::RefundsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_refund**](RefundsApi.md#delete_refund) | **DELETE** /v1/refunds/{refundId} | Delete refund
[**get_refund**](RefundsApi.md#get_refund) | **GET** /v1/refunds/{refundId} | Get refund
[**get_refund_item_part**](RefundsApi.md#get_refund_item_part) | **GET** /v1/refunds/{refundId}/parts/{refundpartid}/itemparts/{itempartid} | Get refund part item
[**get_refund_item_parts**](RefundsApi.md#get_refund_item_parts) | **GET** /v1/refunds/{refundId}/parts/{refundpartid}/itemparts | Get refund part items
[**get_refund_part**](RefundsApi.md#get_refund_part) | **GET** /v1/refunds/{refundId}/parts/{refundpartid} | Get refund part
[**get_refund_parts**](RefundsApi.md#get_refund_parts) | **GET** /v1/refunds/{refundId}/parts | Get refund parts
[**get_refunds**](RefundsApi.md#get_refunds) | **GET** /v1/refunds | Get all refunds
[**object_delete_refund**](RefundsApi.md#object_delete_refund) | **DELETE** /v1/object/refund/{id} | CRUD: Delete refund
[**object_get_refund**](RefundsApi.md#object_get_refund) | **GET** /v1/object/refund/{id} | CRUD: Get refund
[**object_post_refund**](RefundsApi.md#object_post_refund) | **POST** /v1/object/refund | CRUD: Create refund
[**object_put_refund**](RefundsApi.md#object_put_refund) | **PUT** /v1/object/refund/{id} | CRUD: Update refund
[**put_cancel_refund**](RefundsApi.md#put_cancel_refund) | **PUT** /v1/refunds/{refundId}/cancel | Cancel refund
[**put_update_refund**](RefundsApi.md#put_update_refund) | **PUT** /v1/refunds/{refundId} | Update refund


# **delete_refund**
> CommonResponseType delete_refund(refund_id, opts)

Delete refund

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Deletes a refund. You can delete a refund with the Canceled or Error status.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RefundsApi.new

refund_id = "refund_id_example" # String | The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Delete refund
  result = api_instance.delete_refund(refund_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RefundsApi->delete_refund: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refund_id** | **String**| The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_refund**
> GETRefundType get_refund(refund_id, opts)

Get refund

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about a specific refund. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RefundsApi.new

refund_id = "refund_id_example" # String | The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get refund
  result = api_instance.get_refund(refund_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RefundsApi->get_refund: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refund_id** | **String**| The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETRefundType**](GETRefundType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_refund_item_part**
> GETRefundItemPartType get_refund_item_part(itempartid, refundpartid, refund_id, opts)

Get refund part item

**Note:** The Invoice Item Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at  [Zuora Global Support](http://support.zuora.com/).    Retrieves the information about a specific refund part item. A refund part item is a single line item in a refund part. A refund part can consist of several different types of items. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RefundsApi.new

itempartid = "itempartid_example" # String | The unique ID of a specific refund part item. You can get the refund part item ID from the response of [Get refund part items](https://www.zuora.com/developer/api-reference/#operation/GET_RefundItemParts). 

refundpartid = "refundpartid_example" # String | The unique ID of a specific refund part. You can get the refund part ID from the response of [Get refund parts](https://www.zuora.com/developer/api-reference/#operation/GET_RefundParts). 

refund_id = "refund_id_example" # String | The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get refund part item
  result = api_instance.get_refund_item_part(itempartid, refundpartid, refund_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RefundsApi->get_refund_item_part: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **itempartid** | **String**| The unique ID of a specific refund part item. You can get the refund part item ID from the response of [Get refund part items](https://www.zuora.com/developer/api-reference/#operation/GET_RefundItemParts).  | 
 **refundpartid** | **String**| The unique ID of a specific refund part. You can get the refund part ID from the response of [Get refund parts](https://www.zuora.com/developer/api-reference/#operation/GET_RefundParts).  | 
 **refund_id** | **String**| The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETRefundItemPartType**](GETRefundItemPartType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_refund_item_parts**
> GETRefundItemPartCollectionType get_refund_item_parts(refundpartid, refund_id, opts)

Get refund part items

**Note:** The Invoice Item Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at  [Zuora Global Support](http://support.zuora.com/).  Retrieves the information about all items of a refund part. A refund part item is a single line item in a refund part. A refund part can consist of several different types of items. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RefundsApi.new

refundpartid = "refundpartid_example" # String | The unique ID of a specific refund part. You can get the refund part ID from the response of [Get refund parts](https://www.zuora.com/developer/api-reference/#operation/GET_RefundParts). 

refund_id = "refund_id_example" # String | The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
}

begin
  #Get refund part items
  result = api_instance.get_refund_item_parts(refundpartid, refund_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RefundsApi->get_refund_item_parts: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refundpartid** | **String**| The unique ID of a specific refund part. You can get the refund part ID from the response of [Get refund parts](https://www.zuora.com/developer/api-reference/#operation/GET_RefundParts).  | 
 **refund_id** | **String**| The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]

### Return type

[**GETRefundItemPartCollectionType**](GETRefundItemPartCollectionType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_refund_part**
> RefundPartResponseType get_refund_part(refundpartid, refund_id, opts)

Get refund part

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about a specific refund part. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RefundsApi.new

refundpartid = "refundpartid_example" # String | The unique ID of a specific refund part. You can get the refund part ID from the response of [Get refund parts](https://www.zuora.com/developer/api-reference/#operation/GET_RefundParts). 

refund_id = "refund_id_example" # String | The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get refund part
  result = api_instance.get_refund_part(refundpartid, refund_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RefundsApi->get_refund_part: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refundpartid** | **String**| The unique ID of a specific refund part. You can get the refund part ID from the response of [Get refund parts](https://www.zuora.com/developer/api-reference/#operation/GET_RefundParts).  | 
 **refund_id** | **String**| The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**RefundPartResponseType**](RefundPartResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_refund_parts**
> GETRefundPartCollectionType get_refund_parts(refund_id, opts)

Get refund parts

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about all parts of a refund. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RefundsApi.new

refund_id = "refund_id_example" # String | The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get refund parts
  result = api_instance.get_refund_parts(refund_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RefundsApi->get_refund_parts: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refund_id** | **String**| The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETRefundPartCollectionType**](GETRefundPartCollectionType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_refunds**
> GETRefundCollectionType get_refunds(opts)

Get all refunds

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about all refunds. Two types of refunds are available, electronic refunds and external refunds. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RefundsApi.new

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
  fields_filterable: "fields_filterable_example", # String | This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.   A single filter uses the following form:   *fieldsFilterable* `=` *field_value*              Filters can be combined by using `&`. For example: *fieldsFilterable* `=` *field_value* `&` *fieldsFilterable* `=` *field_value*  *fieldsFilterable* indicates the name of a supported field that you can use to filter the response data. The supported filterable fields of this operation are as below:    - number   - status   - type   - accountId   - amount   - refundDate   - paymentId   - createdDate   - createdById   - updatedDate   - updatedById   - methodType   *field_value* indicates a valid value of the filterable field. If the type of the field value is string, you can set the field to `null` value for filtering. Then, you can get the response data with this field value being 'null'. For more information about these fields, see the field descriptions in the **Responses** section.     Examples:  - /refunds?status=Processed  - /refunds?amount=4&status=Processed  - /refunds?status=Processed&type=External&sort=+number 
  sort: "sort_example" # String | This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.    - The `-` operator indicates an ascending order.   - The `+` operator indicates a descending order.  By default, the response data is displayed in descending order by refund number.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - number   - accountId   - amount   - refundDate   - paymentId   - createdDate   - createdById   - updatedDate   - updatedById    Examples:  - /refunds?sort=+number  - /refunds?status=Processed&sort=-number,+amount 
}

begin
  #Get all refunds
  result = api_instance.get_refunds(opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RefundsApi->get_refunds: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]
 **fields_filterable** | **String**| This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.   A single filter uses the following form:   *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value*              Filters can be combined by using &#x60;&amp;&#x60;. For example: *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value* &#x60;&amp;&#x60; *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value*  *fieldsFilterable* indicates the name of a supported field that you can use to filter the response data. The supported filterable fields of this operation are as below:    - number   - status   - type   - accountId   - amount   - refundDate   - paymentId   - createdDate   - createdById   - updatedDate   - updatedById   - methodType   *field_value* indicates a valid value of the filterable field. If the type of the field value is string, you can set the field to &#x60;null&#x60; value for filtering. Then, you can get the response data with this field value being &#39;null&#39;. For more information about these fields, see the field descriptions in the **Responses** section.     Examples:  - /refunds?status&#x3D;Processed  - /refunds?amount&#x3D;4&amp;status&#x3D;Processed  - /refunds?status&#x3D;Processed&amp;type&#x3D;External&amp;sort&#x3D;+number  | [optional] 
 **sort** | **String**| This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.    - The &#x60;-&#x60; operator indicates an ascending order.   - The &#x60;+&#x60; operator indicates a descending order.  By default, the response data is displayed in descending order by refund number.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - number   - accountId   - amount   - refundDate   - paymentId   - createdDate   - createdById   - updatedDate   - updatedById    Examples:  - /refunds?sort&#x3D;+number  - /refunds?status&#x3D;Processed&amp;sort&#x3D;-number,+amount  | [optional] 

### Return type

[**GETRefundCollectionType**](GETRefundCollectionType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_delete_refund**
> ProxyDeleteResponse object_delete_refund(id, opts)

CRUD: Delete refund



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RefundsApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Delete refund
  result = api_instance.object_delete_refund(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RefundsApi->object_delete_refund: #{e}"
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



# **object_get_refund**
> ProxyGetRefund object_get_refund(id, opts)

CRUD: Get refund



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RefundsApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  fields: "fields_example" # String | Object fields to return
}

begin
  #CRUD: Get refund
  result = api_instance.object_get_refund(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RefundsApi->object_get_refund: #{e}"
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

[**ProxyGetRefund**](ProxyGetRefund.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_post_refund**
> ProxyCreateOrModifyResponse object_post_refund(create_request, opts)

CRUD: Create refund



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RefundsApi.new

create_request = Zuora::ProxyCreateRefund.new # ProxyCreateRefund | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Create refund
  result = api_instance.object_post_refund(create_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RefundsApi->object_post_refund: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_request** | [**ProxyCreateRefund**](ProxyCreateRefund.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_put_refund**
> ProxyCreateOrModifyResponse object_put_refund(id, modify_request, opts)

CRUD: Update refund



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RefundsApi.new

id = "id_example" # String | Object id

modify_request = Zuora::ProxyModifyRefund.new # ProxyModifyRefund | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Update refund
  result = api_instance.object_put_refund(id, modify_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RefundsApi->object_put_refund: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifyRefund**](ProxyModifyRefund.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_cancel_refund**
> GETRefundType put_cancel_refund(refund_id, opts)

Cancel refund

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Cancels a refund. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RefundsApi.new

refund_id = "refund_id_example" # String | The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9.       

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Cancel refund
  result = api_instance.put_cancel_refund(refund_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RefundsApi->put_cancel_refund: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refund_id** | **String**| The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9.        | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETRefundType**](GETRefundType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_update_refund**
> GETRefundType put_update_refund(body, refund_id, opts)

Update refund

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Updates the basic and finance information about a refund. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RefundsApi.new

body = Zuora::PUTRefundType.new # PUTRefundType | 

refund_id = "refund_id_example" # String | The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Update refund
  result = api_instance.put_update_refund(body, refund_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RefundsApi->put_update_refund: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PUTRefundType**](PUTRefundType.md)|  | 
 **refund_id** | **String**| The unique ID of a refund. For example, 4028905f5a87c0ff015a889e590e00c9.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETRefundType**](GETRefundType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



