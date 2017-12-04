# SwaggerClient::InvoicesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_breakdown_invoice_by_order**](InvoicesApi.md#g_et_breakdown_invoice_by_order) | **GET** /v1/invoices/{invoiceNumber}/amountBreakdownByOrder | Get breakdown of invoice by order
[**object_delete_invoice**](InvoicesApi.md#object_delete_invoice) | **DELETE** /v1/object/invoice/{id} | CRUD: Delete Invoice
[**object_get_invoice**](InvoicesApi.md#object_get_invoice) | **GET** /v1/object/invoice/{id} | CRUD: Retrieve Invoice
[**object_put_invoice**](InvoicesApi.md#object_put_invoice) | **PUT** /v1/object/invoice/{id} | CRUD: Update Invoice
[**p_ost_credit_memo_from_invoice**](InvoicesApi.md#p_ost_credit_memo_from_invoice) | **POST** /v1/invoices/{invoiceId}/creditmemos | Create credit memo from invoice
[**p_ost_debit_memo_from_invoice**](InvoicesApi.md#p_ost_debit_memo_from_invoice) | **POST** /v1/invoices/{invoiceId}/debitmemos | Create debit memo from invoice
[**p_ost_email_invoice**](InvoicesApi.md#p_ost_email_invoice) | **POST** /v1/invoices/{invoiceId}/emails | Email invoice
[**p_ut_reverse_invoice**](InvoicesApi.md#p_ut_reverse_invoice) | **PUT** /v1/invoices/{invoiceId}/reverse | Reverse invoice


# **g_et_breakdown_invoice_by_order**
> GetInvoiceAmountBreakdownByOrderResponse g_et_breakdown_invoice_by_order(invoice_number, opts)

Get breakdown of invoice by order

**Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.   Retrieves a specified invoice that is broken down by orders. The invoice items might be broken down into a list of order rated items. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::InvoicesApi.new

invoice_number = "invoice_number_example" # String | Number of invoice to be broken down.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get breakdown of invoice by order
  result = api_instance.g_et_breakdown_invoice_by_order(invoice_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoicesApi->g_et_breakdown_invoice_by_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_number** | **String**| Number of invoice to be broken down. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GetInvoiceAmountBreakdownByOrderResponse**](GetInvoiceAmountBreakdownByOrderResponse.md)

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
require 'swagger_client'

api_instance = SwaggerClient::InvoicesApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Delete Invoice
  result = api_instance.object_delete_invoice(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoicesApi->object_delete_invoice: #{e}"
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



# **object_get_invoice**
> ProxyGetInvoice object_get_invoice(id, opts)

CRUD: Retrieve Invoice



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::InvoicesApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  fields: "fields_example" # String | Object fields to return
}

begin
  #CRUD: Retrieve Invoice
  result = api_instance.object_get_invoice(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoicesApi->object_get_invoice: #{e}"
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
require 'swagger_client'

api_instance = SwaggerClient::InvoicesApi.new

id = "id_example" # String | Object id

modify_request = SwaggerClient::ProxyModifyInvoice.new # ProxyModifyInvoice | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Update Invoice
  result = api_instance.object_put_invoice(id, modify_request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoicesApi->object_put_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifyInvoice**](ProxyModifyInvoice.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

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
require 'swagger_client'

api_instance = SwaggerClient::InvoicesApi.new

body = SwaggerClient::CreditMemoFromInvoiceType.new # CreditMemoFromInvoiceType | 

invoice_id = "invoice_id_example" # String | The ID of an invoice that you want to create a credit memo from. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create credit memo from invoice
  result = api_instance.p_ost_credit_memo_from_invoice(body, invoice_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoicesApi->p_ost_credit_memo_from_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CreditMemoFromInvoiceType**](CreditMemoFromInvoiceType.md)|  | 
 **invoice_id** | **String**| The ID of an invoice that you want to create a credit memo from.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

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
require 'swagger_client'

api_instance = SwaggerClient::InvoicesApi.new

invoice_id = "invoice_id_example" # String | The ID of an invoice that you want to create a debit memo from. 

body = SwaggerClient::DebitMemoFromInvoiceType.new # DebitMemoFromInvoiceType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create debit memo from invoice
  result = api_instance.p_ost_debit_memo_from_invoice(invoice_id, body, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoicesApi->p_ost_debit_memo_from_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_id** | **String**| The ID of an invoice that you want to create a debit memo from.  | 
 **body** | [**DebitMemoFromInvoiceType**](DebitMemoFromInvoiceType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

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
require 'swagger_client'

api_instance = SwaggerClient::InvoicesApi.new

request = SwaggerClient::PostInvoiceEmailRequestType.new # PostInvoiceEmailRequestType | 

invoice_id = "invoice_id_example" # String | The ID of the invoice. For example, 2c92c8955bd63cc1015bd7c151af02ab. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Email invoice
  result = api_instance.p_ost_email_invoice(request, invoice_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoicesApi->p_ost_email_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**PostInvoiceEmailRequestType**](PostInvoiceEmailRequestType.md)|  | 
 **invoice_id** | **String**| The ID of the invoice. For example, 2c92c8955bd63cc1015bd7c151af02ab.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

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
require 'swagger_client'

api_instance = SwaggerClient::InvoicesApi.new

invoice_id = "invoice_id_example" # String | The ID of the invoice. For example, 2c92c8955bd63cc1015bd7c151af02ab. 

request = SwaggerClient::PutReverseInvoiceType.new # PutReverseInvoiceType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Reverse invoice
  result = api_instance.p_ut_reverse_invoice(invoice_id, request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling InvoicesApi->p_ut_reverse_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_id** | **String**| The ID of the invoice. For example, 2c92c8955bd63cc1015bd7c151af02ab.  | 
 **request** | [**PutReverseInvoiceType**](PutReverseInvoiceType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**PutReverseInvoiceResponseType**](PutReverseInvoiceResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



