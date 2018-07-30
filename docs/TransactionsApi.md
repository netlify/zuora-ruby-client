# Zuora::TransactionsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_transaction_invoice**](TransactionsApi.md#g_et_transaction_invoice) | **GET** /v1/transactions/invoices/accounts/{account-key} | Get invoices
[**g_et_transaction_payment**](TransactionsApi.md#g_et_transaction_payment) | **GET** /v1/transactions/payments/accounts/{account-key} | Get payments


# **g_et_transaction_invoice**
> GETInvoiceFileWrapper g_et_transaction_invoice(account_key, opts)

Get invoices

Retrieves invoices for a specified account.  Invoices are returned in reverse chronological order by **updatedDate**. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::TransactionsApi.new

account_key = 'account_key_example' # String | Account number or account ID. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  page_size: 20 # Integer | Number of rows returned per page. 
}

begin
  #Get invoices
  result = api_instance.g_et_transaction_invoice(account_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling TransactionsApi->g_et_transaction_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_key** | **String**| Account number or account ID.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]

### Return type

[**GETInvoiceFileWrapper**](GETInvoiceFileWrapper.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_transaction_payment**
> GETPaymentsType g_et_transaction_payment(account_key, opts)

Get payments

Retrieves payments for a specified account. Payments are returned in reverse chronological order by **updatedDate**. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::TransactionsApi.new

account_key = 'account_key_example' # String | Account number or account ID.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  page_size: 20 # Integer | Number of rows returned per page. 
}

begin
  #Get payments
  result = api_instance.g_et_transaction_payment(account_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling TransactionsApi->g_et_transaction_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_key** | **String**| Account number or account ID. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]

### Return type

[**GETPaymentsType**](GETPaymentsType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



