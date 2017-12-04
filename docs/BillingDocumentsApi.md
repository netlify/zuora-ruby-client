# SwaggerClient::BillingDocumentsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_billing_documents**](BillingDocumentsApi.md#g_et_billing_documents) | **GET** /v1/billing-documents | Get billing documents


# **g_et_billing_documents**
> BillingDocumentQueryResponseElementType g_et_billing_documents(account_id, opts)

Get billing documents

Retrieves the information about all billing documents associated with a specified account. The billing documents contain invoices, credit memos, and debit memos.   To retrieve information about credit memos and debit memos, you must have the Advanced AR Settlement feature enabled.  

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::BillingDocumentsApi.new

account_id = "account_id_example" # String | The ID of the customer account that the billing documents are associated with.  

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
  document_date: Date.parse("2013-10-20"), # Date | The date of the billing document. It represents the invoice date for invoices, credit memo date for credit memos, and debit memo date for debit memos. 
  status: "status_example", # String | The status of the billing document. 
  sort: "sort_example" # String | This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  If you do not specify any sortable field, the response data is sorted by the `documentDate` field in descending order.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.      - The `-` operator indicates an ascending order.   - The `+` operator indicates a descending order.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - documentDate   - documentType    Examples: - /billing-documents?accountId=4028905f5e4feb38015e50af9aa002d1&sort=+documentDate,-documentType - /billing-documents?accountId=4028905f5e4feb38015e50af9aa002d1&status=Posted&sort=+documentDate&page=2&pageSize=15 
}

begin
  #Get billing documents
  result = api_instance.g_et_billing_documents(account_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling BillingDocumentsApi->g_et_billing_documents: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | [**String**](.md)| The ID of the customer account that the billing documents are associated with.   | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]
 **document_date** | **Date**| The date of the billing document. It represents the invoice date for invoices, credit memo date for credit memos, and debit memo date for debit memos.  | [optional] 
 **status** | **String**| The status of the billing document.  | [optional] 
 **sort** | **String**| This parameter restricts the order of the data returned in the response. You can use this parameter to supply a dimension you want to sort on.  If you do not specify any sortable field, the response data is sorted by the &#x60;documentDate&#x60; field in descending order.  A sortable field uses the following form:   *operator* *field_name*  You can use at most two sortable fields in one URL path. Use a comma to separate sortable fields. For example:  *operator* *field_name*, *operator* *field_name*    *operator* is used to mark the order of sequencing. The operator is optional. If you only specify the sortable field without any operator, the response data is sorted in descending order by this field.      - The &#x60;-&#x60; operator indicates an ascending order.   - The &#x60;+&#x60; operator indicates a descending order.  *field_name* indicates the name of a sortable field. The supported sortable fields of this operation are as below:    - documentDate   - documentType    Examples: - /billing-documents?accountId&#x3D;4028905f5e4feb38015e50af9aa002d1&amp;sort&#x3D;+documentDate,-documentType - /billing-documents?accountId&#x3D;4028905f5e4feb38015e50af9aa002d1&amp;status&#x3D;Posted&amp;sort&#x3D;+documentDate&amp;page&#x3D;2&amp;pageSize&#x3D;15  | [optional] 

### Return type

[**BillingDocumentQueryResponseElementType**](BillingDocumentQueryResponseElementType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



