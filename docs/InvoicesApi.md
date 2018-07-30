# Zuora::InvoicesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_invoice_application_parts**](InvoicesApi.md#g_et_invoice_application_parts) | **GET** /v1/invoices/{invoiceId}/application-parts | Get invoice application parts
[**object_delete_invoice**](InvoicesApi.md#object_delete_invoice) | **DELETE** /v1/object/invoice/{id} | CRUD: Delete Invoice
[**object_get_invoice**](InvoicesApi.md#object_get_invoice) | **GET** /v1/object/invoice/{id} | CRUD: Retrieve Invoice
[**object_put_invoice**](InvoicesApi.md#object_put_invoice) | **PUT** /v1/object/invoice/{id} | CRUD: Update Invoice
[**p_ost_credit_memo_from_invoice**](InvoicesApi.md#p_ost_credit_memo_from_invoice) | **POST** /v1/invoices/{invoiceId}/creditmemos | Create credit memo from invoice
[**p_ost_debit_memo_from_invoice**](InvoicesApi.md#p_ost_debit_memo_from_invoice) | **POST** /v1/invoices/{invoiceId}/debitmemos | Create debit memo from invoice
[**p_ost_email_invoice**](InvoicesApi.md#p_ost_email_invoice) | **POST** /v1/invoices/{invoiceId}/emails | Email invoice
[**p_ut_batch_update_invoices**](InvoicesApi.md#p_ut_batch_update_invoices) | **PUT** /v1/invoices | Update invoices
[**p_ut_reverse_invoice**](InvoicesApi.md#p_ut_reverse_invoice) | **PUT** /v1/invoices/{invoiceId}/reverse | Reverse invoice
[**p_ut_update_invoice**](InvoicesApi.md#p_ut_update_invoice) | **PUT** /v1/invoices/{invoiceId} | Update invoice


# **g_et_invoice_application_parts**
> GetInvoiceApplicationPartCollectionType g_et_invoice_application_parts(invoice_id, opts)

Get invoice application parts

Note: The Advanced AR Settlement feature is in Limited Availability. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at Zuora Global Support.  Retrieves information about the payments or credit memos that are applied to a specified invoice. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoicesApi.new

invoice_id = 'invoice_id_example' # String | The unique ID of an invoice. For example, 2c92c8955bd63cc1015bd7c151af02ab. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get invoice application parts
  result = api_instance.g_et_invoice_application_parts(invoice_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoicesApi->g_et_invoice_application_parts: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_id** | **String**| The unique ID of an invoice. For example, 2c92c8955bd63cc1015bd7c151af02ab.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GetInvoiceApplicationPartCollectionType**](GetInvoiceApplicationPartCollectionType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_delete_invoice**
> ProxyDeleteResponse object_delete_invoice(id, opts)

CRUD: Delete Invoice



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoicesApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Delete Invoice
  result = api_instance.object_delete_invoice(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoicesApi->object_delete_invoice: #{e}"
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



# **object_get_invoice**
> ProxyGetInvoice object_get_invoice(id, opts)

CRUD: Retrieve Invoice



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoicesApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
}

begin
  #CRUD: Retrieve Invoice
  result = api_instance.object_get_invoice(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoicesApi->object_get_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetInvoice**](ProxyGetInvoice.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_put_invoice**
> ProxyCreateOrModifyResponse object_put_invoice(id, modify_request, opts)

CRUD: Update Invoice



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoicesApi.new

id = 'id_example' # String | Object id

modify_request = Zuora::ProxyModifyInvoice.new # ProxyModifyInvoice | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Update Invoice
  result = api_instance.object_put_invoice(id, modify_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoicesApi->object_put_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifyInvoice**](ProxyModifyInvoice.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_credit_memo_from_invoice**
> GETCreditMemoType p_ost_credit_memo_from_invoice(body, invoice_id, opts)

Create credit memo from invoice

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Creates an ad-hoc credit memo from an invoice.  You can create a credit memo from an invoice only if you have the user permission. See [Billing Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles) for more information. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoicesApi.new

body = Zuora::CreditMemoFromInvoiceType.new # CreditMemoFromInvoiceType | 

invoice_id = 'invoice_id_example' # String | The ID of an invoice that you want to create a credit memo from. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Create credit memo from invoice
  result = api_instance.p_ost_credit_memo_from_invoice(body, invoice_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoicesApi->p_ost_credit_memo_from_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CreditMemoFromInvoiceType**](CreditMemoFromInvoiceType.md)|  | 
 **invoice_id** | **String**| The ID of an invoice that you want to create a credit memo from.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GETCreditMemoType**](GETCreditMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_debit_memo_from_invoice**
> GETDebitMemoType p_ost_debit_memo_from_invoice(invoice_id, body, opts)

Create debit memo from invoice

**Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Creates an ad-hoc debit memo from an invoice.  You can create a debit memo from an invoice only if you have the user permission. See [Billing Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/d_Billing_Roles) for more information. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoicesApi.new

invoice_id = 'invoice_id_example' # String | The ID of an invoice that you want to create a debit memo from. 

body = Zuora::DebitMemoFromInvoiceType.new # DebitMemoFromInvoiceType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Create debit memo from invoice
  result = api_instance.p_ost_debit_memo_from_invoice(invoice_id, body, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoicesApi->p_ost_debit_memo_from_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_id** | **String**| The ID of an invoice that you want to create a debit memo from.  | 
 **body** | [**DebitMemoFromInvoiceType**](DebitMemoFromInvoiceType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GETDebitMemoType**](GETDebitMemoType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_email_invoice**
> CommonResponseType p_ost_email_invoice(request, invoice_id, opts)

Email invoice

Sends a posted invoice to the specified email addresses manually.    ## Notes   - You must activate the **Manual Email For Invoice | Manual Email For Invoice** notification before emailing invoices. To include the invoice PDF in the email, select the **Include Invoice PDF** check box in the **Edit notification** dialog from the Zuora UI. See [Create and Edit Notifications](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/Notifications/C_Create_Notifications#section_2) for more information.     - Zuora sends the email messages based on the email template you set. You can set the email template to use in the **Delivery Options** panel of the **Edit notification** dialog from the Zuora UI. By default, the **Invoice Posted Default Email Template** template is used. See [Create and Edit Email Templates](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/Notifications/Create_Email_Templates) for more information.     - The invoices are sent only to the work email addresses or personal email addresses of the Bill To contact if the following conditions are all met:      * The `useEmailTemplateSetting` field is set to `false`.     * The email addresses are not specified in the `emailAddresses` field. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoicesApi.new

request = Zuora::PostInvoiceEmailRequestType.new # PostInvoiceEmailRequestType | 

invoice_id = 'invoice_id_example' # String | The ID of the invoice. For example, 2c92c8955bd63cc1015bd7c151af02ab. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Email invoice
  result = api_instance.p_ost_email_invoice(request, invoice_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoicesApi->p_ost_email_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**PostInvoiceEmailRequestType**](PostInvoiceEmailRequestType.md)|  | 
 **invoice_id** | **String**| The ID of the invoice. For example, 2c92c8955bd63cc1015bd7c151af02ab.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_batch_update_invoices**
> CommonResponseType p_ut_batch_update_invoices(request, opts)

Update invoices

Updates multiple invoices in batches with one call.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoicesApi.new

request = Zuora::PutBatchInvoiceType.new # PutBatchInvoiceType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Update invoices
  result = api_instance.p_ut_batch_update_invoices(request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoicesApi->p_ut_batch_update_invoices: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**PutBatchInvoiceType**](PutBatchInvoiceType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_reverse_invoice**
> PutReverseInvoiceResponseType p_ut_reverse_invoice(invoice_id, request, opts)

Reverse invoice

Reverses posted invoices.    **Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  **Restrictions**  You are not allowed to reverse an invoice if one of the following restrictions is met:  * Payments and credit memos are applied to the invoice. * The invoice is split. * The invoice is not in Posted status. * The total amount of the invoice is less than 0 (a negative invoice). * Using Tax Connector for Extension Platform to calculate taxes.  See [Reverse Posted Invoices](https://knowledgecenter.zuora.com/CB_Billing/IA_Invoices/Reverse_Posted_Invoices) for more information. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoicesApi.new

invoice_id = 'invoice_id_example' # String | The ID of the invoice. For example, 2c92c8955bd63cc1015bd7c151af02ab. 

request = Zuora::PutReverseInvoiceType.new # PutReverseInvoiceType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Reverse invoice
  result = api_instance.p_ut_reverse_invoice(invoice_id, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoicesApi->p_ut_reverse_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_id** | **String**| The ID of the invoice. For example, 2c92c8955bd63cc1015bd7c151af02ab.  | 
 **request** | [**PutReverseInvoiceType**](PutReverseInvoiceType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**PutReverseInvoiceResponseType**](PutReverseInvoiceResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_update_invoice**
> PutInvoiceResponseType p_ut_update_invoice(invoice_id, request, opts)

Update invoice

Updates a specific invoice.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::InvoicesApi.new

invoice_id = 'invoice_id_example' # String | The ID of the invoice. For example, 2c92c8955bd63cc1015bd7c151af02ab. 

request = Zuora::PutInvoiceType.new # PutInvoiceType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Update invoice
  result = api_instance.p_ut_update_invoice(invoice_id, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling InvoicesApi->p_ut_update_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_id** | **String**| The ID of the invoice. For example, 2c92c8955bd63cc1015bd7c151af02ab.  | 
 **request** | [**PutInvoiceType**](PutInvoiceType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**PutInvoiceResponseType**](PutInvoiceResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



