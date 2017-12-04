# SwaggerClient::OperationsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**p_ost_billing_preview**](OperationsApi.md#p_ost_billing_preview) | **POST** /v1/operations/billing-preview | Create billing preview
[**p_ost_transaction_invoice_payment**](OperationsApi.md#p_ost_transaction_invoice_payment) | **POST** /v1/operations/invoice-collect | Invoice and collect


# **p_ost_billing_preview**
> BillingPreviewResult p_ost_billing_preview(request, opts)

Create billing preview

**Note:** The Billing Preview feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Generates a preview of future invoice items for one customer account. Use the BillingPreview call to calculate how much a single customer will be invoiced from the most recent invoice to a specific end of term date in the future.  Additionally, you can use the BillingPreview service to access real-time data on an individual customer's usage consumption.   The BillingPreview call does not calculate taxes for charges in the subscription.  If you have the Advanced AR Settlement feature enabled, you can also generate a preview of future credit memo items for one customer account. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OperationsApi.new

request = SwaggerClient::PostBillingPreviewParam.new # PostBillingPreviewParam | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create billing preview
  result = api_instance.p_ost_billing_preview(request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OperationsApi->p_ost_billing_preview: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**PostBillingPreviewParam**](PostBillingPreviewParam.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**BillingPreviewResult**](BillingPreviewResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_transaction_invoice_payment**
> POSTInvoiceCollectResponseType p_ost_transaction_invoice_payment(request, opts)

Invoice and collect

Generates and posts invoices and credit memos and collects payments for posted invoices. Credit memos are only available if you have the Advanced AR Settlement feature enabled and negative charges exist. Credit memos will not be applied to invoices. If draft invoices and credit memos exist when you run this operation, this operation will post the invoices and credit memos. Note that draft credit memos created from an invoice or a product rate plan charge will not be posted.  You can use this operation to generate invoices and collect payments on the posted invoices,  or else simply collect payment on a specified existing invoice. The customer's default payment method is used, and the full amount due is collected. The operation depends on the parameters you specify.  - To generate one or more new invoices for that customer and collect payment on the generated and other unpaid invoice(s), leave the **invoiceId** field empty.   - To collect payment on an existing invoice, specify the invoice ID.    The operation is atomic; if any part is unsuccessful, the entire operation is rolled back.  When an error occurs, gateway reason codes and error messages are returned the error response of this operation. The following items are some gateway response code examples.  - Orbital: `05 Do Not Honor`; `14 Invalid Credit Card Number` - Vantiv: `301 Invalid Account Number`; `304 Lost/Stolen Card`   - CyberSource2: `202 Expired card`; `231 Invalid account number`  For more reason code information, see the corresponding payment gateway documentation.    ## Notes  Timeouts may occur when using this method on an account that has an extremely high number of subscriptions. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OperationsApi.new

request = SwaggerClient::POSTInvoiceCollectType.new # POSTInvoiceCollectType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  zuora_version: "zuora_version_example" # String |  The minor version of the Zuora REST API.   You need to set this parameter if you use the following fields: * documentDate * targetDate              If you have the Advanced AR Settlement feature enabled, you need to specify this parameter. Otherwise, an error is returned.   See [Zuora REST API Versions](https://www.zuora.com/developer/api-reference/#section/API-Versions) for more information. 
}

begin
  #Invoice and collect
  result = api_instance.p_ost_transaction_invoice_payment(request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OperationsApi->p_ost_transaction_invoice_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTInvoiceCollectType**](POSTInvoiceCollectType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **zuora_version** | **String**|  The minor version of the Zuora REST API.   You need to set this parameter if you use the following fields: * documentDate * targetDate              If you have the Advanced AR Settlement feature enabled, you need to specify this parameter. Otherwise, an error is returned.   See [Zuora REST API Versions](https://www.zuora.com/developer/api-reference/#section/API-Versions) for more information.  | [optional] 

### Return type

[**POSTInvoiceCollectResponseType**](POSTInvoiceCollectResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



