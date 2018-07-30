# Zuora::AccountingCodesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**d_elete_accounting_code**](AccountingCodesApi.md#d_elete_accounting_code) | **DELETE** /v1/accounting-codes/{ac-id} | Delete accounting code
[**g_et_accounting_code**](AccountingCodesApi.md#g_et_accounting_code) | **GET** /v1/accounting-codes/{ac-id} | Query an accounting code
[**g_et_all_accounting_codes**](AccountingCodesApi.md#g_et_all_accounting_codes) | **GET** /v1/accounting-codes | Get all accounting codes
[**p_ost_accounting_code**](AccountingCodesApi.md#p_ost_accounting_code) | **POST** /v1/accounting-codes | Create accounting code
[**p_ut_accounting_code**](AccountingCodesApi.md#p_ut_accounting_code) | **PUT** /v1/accounting-codes/{ac-id} | Update an accounting code
[**p_ut_activate_accounting_code**](AccountingCodesApi.md#p_ut_activate_accounting_code) | **PUT** /v1/accounting-codes/{ac-id}/activate | Activate accounting code
[**p_ut_deactivate_accounting_code**](AccountingCodesApi.md#p_ut_deactivate_accounting_code) | **PUT** /v1/accounting-codes/{ac-id}/deactivate | Deactivate accounting code


# **d_elete_accounting_code**
> CommonResponseType d_elete_accounting_code(ac_id, opts)

Delete accounting code

This reference describes how to delete an accounting code through the REST API. ## Prerequisites If you have Zuora Finance enabled on your tenant, then you must have the Delete Unused Accounting Code permission. ## Limitations You can only delete accounting codes that have never been associated with any transactions. An accounting code must be deactivated before you can delete it. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountingCodesApi.new

ac_id = 'ac_id_example' # String | ID of the accounting code you want to delete.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Delete accounting code
  result = api_instance.d_elete_accounting_code(ac_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountingCodesApi->d_elete_accounting_code: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ac_id** | **String**| ID of the accounting code you want to delete. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_accounting_code**
> GETAccountingCodeItemType g_et_accounting_code(ac_id, opts)

Query an accounting code

This reference describes how to query an accounting code through the REST API.

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountingCodesApi.new

ac_id = 'ac_id_example' # String | ID of the accounting code you want to query.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Query an accounting code
  result = api_instance.g_et_accounting_code(ac_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountingCodesApi->g_et_accounting_code: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ac_id** | **String**| ID of the accounting code you want to query. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GETAccountingCodeItemType**](GETAccountingCodeItemType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_all_accounting_codes**
> GETAccountingCodesType g_et_all_accounting_codes(opts)

Get all accounting codes

This reference describes how to query all accounting codes in your chart of accounts through the REST API.

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountingCodesApi.new

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  page_size: 300 # Integer | Number of rows returned per page. 
}

begin
  #Get all accounting codes
  result = api_instance.g_et_all_accounting_codes(opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountingCodesApi->g_et_all_accounting_codes: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 300]

### Return type

[**GETAccountingCodesType**](GETAccountingCodesType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_accounting_code**
> POSTAccountingCodeResponseType p_ost_accounting_code(request, opts)

Create accounting code

This reference describes how to create a new accounting code through the REST API.  The accounting code will be active as soon as it has been created.  ## Prerequisites   If you have Zuora Finance enabled on your tenant, you must have the  Configure Accounting Codes permission.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountingCodesApi.new

request = Zuora::POSTAccountingCodeType.new # POSTAccountingCodeType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Create accounting code
  result = api_instance.p_ost_accounting_code(request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountingCodesApi->p_ost_accounting_code: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTAccountingCodeType**](POSTAccountingCodeType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**POSTAccountingCodeResponseType**](POSTAccountingCodeResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_accounting_code**
> CommonResponseType p_ut_accounting_code(ac_id, request, opts)

Update an accounting code

This reference describes how to update an existing accounting code through the REST API. ## Prerequisites   If you have Zuora Finance enabled on your tenant, you must have the  Manage Accounting Code permission.  ## Limitations You can only update accounting codes that are not already associated with any transactions. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountingCodesApi.new

ac_id = 'ac_id_example' # String | ID of the accounting code you want to update.

request = Zuora::PUTAccountingCodeType.new # PUTAccountingCodeType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Update an accounting code
  result = api_instance.p_ut_accounting_code(ac_id, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountingCodesApi->p_ut_accounting_code: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ac_id** | **String**| ID of the accounting code you want to update. | 
 **request** | [**PUTAccountingCodeType**](PUTAccountingCodeType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_activate_accounting_code**
> CommonResponseType p_ut_activate_accounting_code(ac_id, opts)

Activate accounting code

This reference describes how to activate an accounting code through the REST API.  Prerequisites ------------- If you have Zuora Finance enabled on your tenant, you must have the Manage Accounting Code permission.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountingCodesApi.new

ac_id = 'ac_id_example' # String | ID of the accounting code you want to activate.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Activate accounting code
  result = api_instance.p_ut_activate_accounting_code(ac_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountingCodesApi->p_ut_activate_accounting_code: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ac_id** | **String**| ID of the accounting code you want to activate. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_deactivate_accounting_code**
> CommonResponseType p_ut_deactivate_accounting_code(ac_id, opts)

Deactivate accounting code

This reference describes how to deactivate an accounting code through the REST API.  ## Prerequisites If you have Zuora Finance enabled on your tenant, you must have the Manage Accounting Code permission. ## Limitations You can only deactivate accounting codes that are not associated with any transactions.  You cannot disable accounting codes of type AccountsReceivable. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountingCodesApi.new

ac_id = 'ac_id_example' # String | ID of the accounting code you want to deactivate.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Deactivate accounting code
  result = api_instance.p_ut_deactivate_accounting_code(ac_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountingCodesApi->p_ut_deactivate_accounting_code: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ac_id** | **String**| ID of the accounting code you want to deactivate. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



