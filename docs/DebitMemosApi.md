# SwaggerClient::DebitMemosApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**d_elete_debit_memo**](DebitMemosApi.md#d_elete_debit_memo) | **DELETE** /v1/debitmemos/{debitMemoId} | Delete debit memo
[**g_et_debit_memo**](DebitMemosApi.md#g_et_debit_memo) | **GET** /v1/debitmemos/{debitMemoId} | Get debit memo
[**g_et_debit_memo_item**](DebitMemosApi.md#g_et_debit_memo_item) | **GET** /v1/debitmemos/{debitMemoId}/items/{dmitemid} | Get debit memo item
[**g_et_debit_memo_items**](DebitMemosApi.md#g_et_debit_memo_items) | **GET** /v1/debitmemos/{debitMemoId}/items | Get debit memo items
[**g_et_debit_memos**](DebitMemosApi.md#g_et_debit_memos) | **GET** /v1/debitmemos | Get debit memos
[**p_ost_debit_memo_from_prpc**](DebitMemosApi.md#p_ost_debit_memo_from_prpc) | **POST** /v1/debitmemos | Create debit memo from charge
[**p_ost_debit_memo_pdf**](DebitMemosApi.md#p_ost_debit_memo_pdf) | **POST** /v1/debitmemos/{debitMemoId}/pdfs | Create debit memo PDF
[**p_ost_email_debit_memo**](DebitMemosApi.md#p_ost_email_debit_memo) | **POST** /v1/debitmemos/{debitMemoId}/emails | Email debit memo
[**p_ostdm_taxation_items**](DebitMemosApi.md#p_ostdm_taxation_items) | **POST** /v1/debitmemos/{debitMemoId}/taxationitems | Create taxation items for debit memo
[**p_ut_cancel_debit_memo**](DebitMemosApi.md#p_ut_cancel_debit_memo) | **PUT** /v1/debitmemos/{debitMemoId}/cancel | Cancel debit memo
[**p_ut_debit_memo**](DebitMemosApi.md#p_ut_debit_memo) | **PUT** /v1/debitmemos/{debitMemoId} | Update debit memo
[**p_ut_post_debit_memo**](DebitMemosApi.md#p_ut_post_debit_memo) | **PUT** /v1/debitmemos/{debitMemoId}/post | Post debit memo


# **d_elete_debit_memo**
> CommonResponseType d_elete_debit_memo(debit_memo_id, opts)

Delete debit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Deletes a debit memo. Only debit memos with the Cancelled status can be deleted.   You can delete a debit memo only if you have the user permission. See [Billing Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles) for more information. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DebitMemosApi.new

debit_memo_id = "debit_memo_id_example" # String | The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Delete debit memo
  result = api_instance.d_elete_debit_memo(debit_memo_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DebitMemosApi->d_elete_debit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **debit_memo_id** | **String**| The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_debit_memo**
> GETDebitMemoType g_et_debit_memo(debit_memo_id, opts)

Get debit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about a specific debit memo. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DebitMemosApi.new

debit_memo_id = "debit_memo_id_example" # String | The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get debit memo
  result = api_instance.g_et_debit_memo(debit_memo_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DebitMemosApi->g_et_debit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **debit_memo_id** | **String**| The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETDebitMemoType**](GETDebitMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_debit_memo_item**
> GETDebitMemoItemType g_et_debit_memo_item(dmitemid, debit_memo_id, opts)

Get debit memo item

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the information about a specific item of a debit memo. A debit memo item is a single line item in a debit memo. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DebitMemosApi.new

dmitemid = "dmitemid_example" # String | The unique ID of a debit memo item. You can get the debit memo item ID from the response of [Get debit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_DebitMemoItems). 

debit_memo_id = "debit_memo_id_example" # String | The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get debit memo item
  result = api_instance.g_et_debit_memo_item(dmitemid, debit_memo_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DebitMemosApi->g_et_debit_memo_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dmitemid** | **String**| The unique ID of a debit memo item. You can get the debit memo item ID from the response of [Get debit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_DebitMemoItems).  | 
 **debit_memo_id** | **String**| The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETDebitMemoItemType**](GETDebitMemoItemType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_debit_memo_items**
> GETDebitMemoItemCollectionType g_et_debit_memo_items(debit_memo_id, opts)

Get debit memo items

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Retrieves the information about all items of a debit memo. A debit memo item is a single line item in a debit memo.  

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DebitMemosApi.new

debit_memo_id = "debit_memo_id_example" # String | The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
  fields_filterable: "fields_filterable_example", # String | This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.   A single filter uses the following form:   *fieldsFilterable* `=` *field_value*              Filters can be combined by using `&`. For example: *fieldsFilterable* `=` *field_value* `&` *fieldsFilterable* `=` *field_value*  *fieldsFilterable* indicates the name of a supported field that you can use to filter the response data. The supported filterable fields of this operation are as below:    - id   - amount   - beAppliedAmount   - sku   - skuName   - serviceStartDate   - serviceEndDate   - sourceItemId   - createdDate   - createdById   - updatedDate   - updatedById   - subscriptionId   *field_value* indicates a valid value of the filterable field. If the type of the field value is string, you can set the field to `null` value for filtering. Then, you can get the response data with this field value being 'null'. For more information about these fields, see the field descriptions in the **Responses** section.     Examples:  - /debitmemos/402890245c7ca371015c7cb40b28001f/items?amount=100  - /debitmemos/402890245c7ca371015c7cb40b28001f/items?amount=100&sort=createdDate 
  sort: "sort_example" # String | This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.    - The `-` operator indicates an ascending order.   - The `+` operator indicates a descending order.  By default, the response data is displayed in descending order by updated date.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - id   - amount   - beAppliedAmount   - sku   - skuName   - serviceStartDate   - serviceEndDate   - sourceItemId   - createdDate   - createdById   - updatedDate   - updatedById   - subscriptionId    Examples:  - /debitmemos/402890245c7ca371015c7cb40b28001f/items?sort=createdDate  - /debitmemos/402890245c7ca371015c7cb40b28001f/items?amount=100&sort=createdDate 
}

begin
  #Get debit memo items
  result = api_instance.g_et_debit_memo_items(debit_memo_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DebitMemosApi->g_et_debit_memo_items: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **debit_memo_id** | **String**| The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]
 **fields_filterable** | **String**| This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.   A single filter uses the following form:   *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value*              Filters can be combined by using &#x60;&amp;&#x60;. For example: *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value* &#x60;&amp;&#x60; *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value*  *fieldsFilterable* indicates the name of a supported field that you can use to filter the response data. The supported filterable fields of this operation are as below:    - id   - amount   - beAppliedAmount   - sku   - skuName   - serviceStartDate   - serviceEndDate   - sourceItemId   - createdDate   - createdById   - updatedDate   - updatedById   - subscriptionId   *field_value* indicates a valid value of the filterable field. If the type of the field value is string, you can set the field to &#x60;null&#x60; value for filtering. Then, you can get the response data with this field value being &#39;null&#39;. For more information about these fields, see the field descriptions in the **Responses** section.     Examples:  - /debitmemos/402890245c7ca371015c7cb40b28001f/items?amount&#x3D;100  - /debitmemos/402890245c7ca371015c7cb40b28001f/items?amount&#x3D;100&amp;sort&#x3D;createdDate  | [optional] 
 **sort** | **String**| This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.    - The &#x60;-&#x60; operator indicates an ascending order.   - The &#x60;+&#x60; operator indicates a descending order.  By default, the response data is displayed in descending order by updated date.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - id   - amount   - beAppliedAmount   - sku   - skuName   - serviceStartDate   - serviceEndDate   - sourceItemId   - createdDate   - createdById   - updatedDate   - updatedById   - subscriptionId    Examples:  - /debitmemos/402890245c7ca371015c7cb40b28001f/items?sort&#x3D;createdDate  - /debitmemos/402890245c7ca371015c7cb40b28001f/items?amount&#x3D;100&amp;sort&#x3D;createdDate  | [optional] 

### Return type

[**GETDebitMemoItemCollectionType**](GETDebitMemoItemCollectionType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_debit_memos**
> GETDebitMemoCollectionType g_et_debit_memos(opts)

Get debit memos

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the information about all debit memos associated with all customer accounts. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DebitMemosApi.new

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
  fields_filterable: "fields_filterable_example", # String | This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.   A single filter uses the following form:   *fieldsFilterable* `=` *field_value*              Filters can be combined by using `&`. For example: *fieldsFilterable* `=` *field_value* `&` *fieldsFilterable* `=` *field_value*  *fieldsFilterable* indicates the name of a supported field that you can use to filter the response data. The supported filterable fields of this operation are as below:    - number   - accountId   - debitMemoDate   - targetDate   - dueDate   - currency   - status   - amount   - taxAmount   - totalTaxExemptAmount   - balance   - beAppliedAmount   - referredInvoiceId   - createdDate   - createdById   - updatedDate   - updatedById   *field_value* indicates a valid value of the filterable field. If the type of the field value is string, you can set the field to `null` value for filtering. Then, you can get the response data with this field value being 'null'. For more information about these fields, see the field descriptions in the **Responses** section.     Examples:  - /debitmemos?status=Processed  - /debitmemos?referredInvoiceId=null&status=Draft  - /debitmemos?status=Processed&type=External&sort=+number 
  sort: "sort_example" # String | This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.    - The `-` operator indicates an ascending order.   - The `+` operator indicates a descending order.  By default, the response data is displayed in descending order by debit memo number.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - number   - accountId   - debitMemoDate   - targetDate   - dueDate   - amount   - taxAmount   - totalTaxExemptAmount   - balance   - beAppliedAmount   - referredInvoiceId   - createdDate   - createdById   - updatedDate   - updatedById    Examples:  - /debitmemos?sort=+number  - /debitmemos?status=Processed&sort=-number,+amount 
}

begin
  #Get debit memos
  result = api_instance.g_et_debit_memos(opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DebitMemosApi->g_et_debit_memos: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]
 **fields_filterable** | **String**| This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.   A single filter uses the following form:   *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value*              Filters can be combined by using &#x60;&amp;&#x60;. For example: *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value* &#x60;&amp;&#x60; *fieldsFilterable* &#x60;&#x3D;&#x60; *field_value*  *fieldsFilterable* indicates the name of a supported field that you can use to filter the response data. The supported filterable fields of this operation are as below:    - number   - accountId   - debitMemoDate   - targetDate   - dueDate   - currency   - status   - amount   - taxAmount   - totalTaxExemptAmount   - balance   - beAppliedAmount   - referredInvoiceId   - createdDate   - createdById   - updatedDate   - updatedById   *field_value* indicates a valid value of the filterable field. If the type of the field value is string, you can set the field to &#x60;null&#x60; value for filtering. Then, you can get the response data with this field value being &#39;null&#39;. For more information about these fields, see the field descriptions in the **Responses** section.     Examples:  - /debitmemos?status&#x3D;Processed  - /debitmemos?referredInvoiceId&#x3D;null&amp;status&#x3D;Draft  - /debitmemos?status&#x3D;Processed&amp;type&#x3D;External&amp;sort&#x3D;+number  | [optional] 
 **sort** | **String**| This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.    - The &#x60;-&#x60; operator indicates an ascending order.   - The &#x60;+&#x60; operator indicates a descending order.  By default, the response data is displayed in descending order by debit memo number.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - number   - accountId   - debitMemoDate   - targetDate   - dueDate   - amount   - taxAmount   - totalTaxExemptAmount   - balance   - beAppliedAmount   - referredInvoiceId   - createdDate   - createdById   - updatedDate   - updatedById    Examples:  - /debitmemos?sort&#x3D;+number  - /debitmemos?status&#x3D;Processed&amp;sort&#x3D;-number,+amount  | [optional] 

### Return type

[**GETDebitMemoCollectionType**](GETDebitMemoCollectionType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_debit_memo_from_prpc**
> GETDebitMemoType p_ost_debit_memo_from_prpc(body, opts)

Create debit memo from charge

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Creates an ad-hoc debit memo from a product rate plan charge. Zuora only supports one-time positive charges for debit memos.    You can create a debit memo only if you have the user permission. See [Billing Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles) for more information. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DebitMemosApi.new

body = SwaggerClient::DebitMemoFromChargeType.new # DebitMemoFromChargeType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create debit memo from charge
  result = api_instance.p_ost_debit_memo_from_prpc(body, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DebitMemosApi->p_ost_debit_memo_from_prpc: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**DebitMemoFromChargeType**](DebitMemoFromChargeType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETDebitMemoType**](GETDebitMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_debit_memo_pdf**
> POSTMemoPdfResponse p_ost_debit_memo_pdf(debit_memo_id, opts)

Create debit memo PDF

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Creates PDF for a specified debit memo. To access the generated PDF, you can download it by clicking **View PDF** on the detailed debit memo page through the Zuora UI. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DebitMemosApi.new

debit_memo_id = "debit_memo_id_example" # String | The unique ID of the debit memo that you want to create PDF for. For example, 8a8082e65b27f6c3015ba419f3c2644e. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create debit memo PDF
  result = api_instance.p_ost_debit_memo_pdf(debit_memo_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DebitMemosApi->p_ost_debit_memo_pdf: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **debit_memo_id** | **String**| The unique ID of the debit memo that you want to create PDF for. For example, 8a8082e65b27f6c3015ba419f3c2644e.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**POSTMemoPdfResponse**](POSTMemoPdfResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_email_debit_memo**
> CommonResponseType p_ost_email_debit_memo(request, debit_memo_id, opts)

Email debit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Sends a posted debit memo to the specified email addresses manually.    ## Notes   - You must activate the **Email Debit Memo | Manually email Debit Memo** notification before emailing debit memos. To include the debit memo PDF in the email, select the **Include Debit Memo PDF** check box in the **Edit notification** dialog from the Zuora UI. See [Create and Edit Notifications](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/Notifications/C_Create_Notifications#section_2) for more information.     - Zuora sends the email messages based on the email template you set. You can set the email template to use in the **Delivery Options** panel of the **Edit notification** dialog from the Zuora UI. By default, the **Manual Email for Debit Memo Default Template** template is used. See [Create and Edit Email Templates](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/Notifications/Create_Email_Templates) for more information.     - The debit memos are sent only to the work email addresses or personal email addresses of the Bill To contact if the following conditions are all met:      * The `useEmailTemplateSetting` field is set to `false`.     * The email addresses are not specified in the `emailAddresses` field. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DebitMemosApi.new

request = SwaggerClient::PostDebitMemoEmailType.new # PostDebitMemoEmailType | 

debit_memo_id = "debit_memo_id_example" # String | The ID of a posted debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Email debit memo
  result = api_instance.p_ost_email_debit_memo(request, debit_memo_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DebitMemosApi->p_ost_email_debit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**PostDebitMemoEmailType**](PostDebitMemoEmailType.md)|  | 
 **debit_memo_id** | **String**| The ID of a posted debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ostdm_taxation_items**
> GETTaxationItemListType p_ostdm_taxation_items(debit_memo_id, body, opts)

Create taxation items for debit memo

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Creates taxation items for a debit memo. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DebitMemosApi.new

debit_memo_id = "debit_memo_id_example" # String | The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e. 

body = SwaggerClient::POSTTaxationItemListForDMType.new # POSTTaxationItemListForDMType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create taxation items for debit memo
  result = api_instance.p_ostdm_taxation_items(debit_memo_id, body, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DebitMemosApi->p_ostdm_taxation_items: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **debit_memo_id** | **String**| The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e.  | 
 **body** | [**POSTTaxationItemListForDMType**](POSTTaxationItemListForDMType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETTaxationItemListType**](GETTaxationItemListType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_cancel_debit_memo**
> GETDebitMemoType p_ut_cancel_debit_memo(debit_memo_id, opts)

Cancel debit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Cancels a debit memo. Only debit memos with the Draft status can be cancelled.   You can cancel a debit memo only if you have the user permission. See [Billing Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles) for more information. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DebitMemosApi.new

debit_memo_id = "debit_memo_id_example" # String | The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Cancel debit memo
  result = api_instance.p_ut_cancel_debit_memo(debit_memo_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DebitMemosApi->p_ut_cancel_debit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **debit_memo_id** | **String**| The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETDebitMemoType**](GETDebitMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_debit_memo**
> GETDebitMemoType p_ut_debit_memo(body, debit_memo_id, opts)

Update debit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Updates the basic and finance information about a debit memo. Currently, Zuora supports updating tax-exclusive memo items, but does not support updating tax-inclusive memo items.   If the amount of a memo item is updated, the tax will be recalculated in the following conditions:   - The memo is created from a product rate plan charge and you use Avalara to calculate the tax.   - The memo is created from an invoice and you use Avalara or Zuora Tax to calculate the tax.  You can update a debit memo only if you have the user permission. See [Billing Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles) for more information. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DebitMemosApi.new

body = SwaggerClient::PUTDebitMemoType.new # PUTDebitMemoType | 

debit_memo_id = "debit_memo_id_example" # String | The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Update debit memo
  result = api_instance.p_ut_debit_memo(body, debit_memo_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DebitMemosApi->p_ut_debit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PUTDebitMemoType**](PUTDebitMemoType.md)|  | 
 **debit_memo_id** | **String**| The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETDebitMemoType**](GETDebitMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_post_debit_memo**
> GETDebitMemoType p_ut_post_debit_memo(debit_memo_id, opts)

Post debit memo

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Posts a debit memo to activate it. You can post debit memos only if you have the [Billing permissions](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles#Billing_Permissions). 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::DebitMemosApi.new

debit_memo_id = "debit_memo_id_example" # String | The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Post debit memo
  result = api_instance.p_ut_post_debit_memo(debit_memo_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DebitMemosApi->p_ut_post_debit_memo: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **debit_memo_id** | **String**| The unique ID of a debit memo. For example, 8a8082e65b27f6c3015ba419f3c2644e.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETDebitMemoType**](GETDebitMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



