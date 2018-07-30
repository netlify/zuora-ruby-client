# Zuora::AccountsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_account**](AccountsApi.md#g_et_account) | **GET** /v1/accounts/{account-key} | Get account
[**g_et_account_summary**](AccountsApi.md#g_et_account_summary) | **GET** /v1/accounts/{account-key}/summary | Get account summary
[**object_delete_account**](AccountsApi.md#object_delete_account) | **DELETE** /v1/object/account/{id} | CRUD: Delete Account
[**object_get_account**](AccountsApi.md#object_get_account) | **GET** /v1/object/account/{id} | CRUD: Retrieve Account
[**object_post_account**](AccountsApi.md#object_post_account) | **POST** /v1/object/account | CRUD: Create Account
[**object_put_account**](AccountsApi.md#object_put_account) | **PUT** /v1/object/account/{id} | CRUD: Update Account
[**p_ost_account**](AccountsApi.md#p_ost_account) | **POST** /v1/accounts | Create account
[**p_ost_generate_billing_documents**](AccountsApi.md#p_ost_generate_billing_documents) | **POST** /v1/accounts/{id}/billing-documents/generate | Generate billing documents by account
[**p_ut_account**](AccountsApi.md#p_ut_account) | **PUT** /v1/accounts/{account-key} | Update account


# **g_et_account**
> GETAccountType g_et_account(account_key, opts)

Get account

This REST API reference describes how to retrieve basic information about a customer account.  This REST call is a quick retrieval that doesn't include the account's subscriptions, invoices, payments, or usage details. Use Get account summary to get more detailed information about an account. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountsApi.new

account_key = 'account_key_example' # String | Account number or account ID.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get account
  result = api_instance.g_et_account(account_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountsApi->g_et_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_key** | **String**| Account number or account ID. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GETAccountType**](GETAccountType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_account_summary**
> GETAccountSummaryType g_et_account_summary(account_key, opts)

Get account summary

This REST API reference describes how to retrieve detailed information about the specified customer account.  The response includes the account information and a summary of the account’s subscriptions, invoices, payments, and usages for the last six recently updated subscriptions.  ## Notes  Returns only the six most recent subscriptions based on the subscription updatedDate. Within those subscriptions, there may be many rate plans and many rate plan charges. These items are subject to the maximum limit on the array size.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountsApi.new

account_key = 'account_key_example' # String | Account number or account ID.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get account summary
  result = api_instance.g_et_account_summary(account_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountsApi->g_et_account_summary: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_key** | **String**| Account number or account ID. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GETAccountSummaryType**](GETAccountSummaryType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_delete_account**
> ProxyDeleteResponse object_delete_account(id, opts)

CRUD: Delete Account



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Delete Account
  result = api_instance.object_delete_account(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountsApi->object_delete_account: #{e}"
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



# **object_get_account**
> ProxyGetAccount object_get_account(id, opts)

CRUD: Retrieve Account



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
}

begin
  #CRUD: Retrieve Account
  result = api_instance.object_get_account(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountsApi->object_get_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetAccount**](ProxyGetAccount.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_post_account**
> ProxyCreateOrModifyResponse object_post_account(create_request, opts)

CRUD: Create Account



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountsApi.new

create_request = Zuora::ProxyCreateAccount.new # ProxyCreateAccount | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Create Account
  result = api_instance.object_post_account(create_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountsApi->object_post_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_request** | [**ProxyCreateAccount**](ProxyCreateAccount.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_put_account**
> ProxyCreateOrModifyResponse object_put_account(id, modify_request, opts)

CRUD: Update Account



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountsApi.new

id = 'id_example' # String | Object id

modify_request = Zuora::ProxyModifyAccount.new # ProxyModifyAccount | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Update Account
  result = api_instance.object_put_account(id, modify_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountsApi->object_put_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifyAccount**](ProxyModifyAccount.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_account**
> POSTAccountResponseType p_ost_account(request, opts)

Create account

This REST API reference describes how to create a customer account with a credit-card payment method, a bill-to contact, and an optional sold-to contact. Request and response field descriptions and sample code are provided. Use this method to optionally create a subscription, invoice for that subscription, and collect payment through the default payment method. The transaction is atomic; if any part fails for any reason, the entire transaction is rolled back.  This API call is CORS Enabled, so you can use client-side Javascript to invoke the call.   ## Notes 1. The account is created in active status.   2. The request must provide either a **creditCard** structure or the **hpmCreditCardPaymentMethodId** field (but not both). The one provided becomes the default payment method for this account. If the credit card information is declined or can't be verified, then the account is not created. 3. Customer accounts created with this call are automatically be set to Auto Pay. 4. If either the **workEmail** or **personalEmail** are specified, then the account's email delivery preference is automatically set to `true`. (In that case, emails go to the **workEmail** address, if it exists, or else the **personalEmail**.) If neither field is specified, the email delivery preference is automatically set to `false`. 5. You cannot use this operation to create subscriptions if you have the Orders feature enabled. See [Orders Migration Guidance](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AB_Orders_Migration_Guidance) for more information.  ## Defaults for customerAcceptanceDate and serviceActivationDate Default values for **customerAcceptanceDate** and **serviceActivationDate** are set as follows.  |        | serviceActivationDate(SA) specified          | serviceActivationDate (SA) NOT specified  | | ------------- |:-------------:| -----:| | customerAcceptanceDate (CA) specified      | SA uses value in the request call; CA uses value in the request call| CA uses value in the request call;SA uses CE as default | | customerAcceptanceDate (CA) NOT specified      | SA uses value in the request call; CA uses SA as default |   SA and CA use CE as default | 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountsApi.new

request = Zuora::POSTAccountType.new # POSTAccountType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_version: 'zuora_version_example' # String | The minor version of the Zuora REST API.   You only need to set this parameter if you use the following fields: * invoice * collect * runBilling * targetDate 
}

begin
  #Create account
  result = api_instance.p_ost_account(request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountsApi->p_ost_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTAccountType**](POSTAccountType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_version** | **String**| The minor version of the Zuora REST API.   You only need to set this parameter if you use the following fields: * invoice * collect * runBilling * targetDate  | [optional] 

### Return type

[**POSTAccountResponseType**](POSTAccountResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_generate_billing_documents**
> GenerateBillingDocumentResponseType p_ost_generate_billing_documents(body, id, opts)

Generate billing documents by account

Generates draft or posted billing documents for a specified account. You can also generate billing documents for specified subscriptions of a specified account. The billing documents contain invoices and credit memos. To generate credit memos, you must have the Advanced AR Settlement feature enabled. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountsApi.new

body = Zuora::PostGenerateBillingDocumentType.new # PostGenerateBillingDocumentType | 

id = 'id_example' # String | The ID of the customer account that billing documents are generated for. For example, 8a8082e65b27f6c3015ba3e326b26419. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Generate billing documents by account
  result = api_instance.p_ost_generate_billing_documents(body, id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountsApi->p_ost_generate_billing_documents: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PostGenerateBillingDocumentType**](PostGenerateBillingDocumentType.md)|  | 
 **id** | **String**| The ID of the customer account that billing documents are generated for. For example, 8a8082e65b27f6c3015ba3e326b26419.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GenerateBillingDocumentResponseType**](GenerateBillingDocumentResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_account**
> CommonResponseType p_ut_account(account_key, request, opts)

Update account

This REST API reference describes how to update a customer account by specifying the account-key.  ## Notes 1. Only the fields to be changed should be specified.  Any field that's not included in the request body will not be changed. 2. If an empty field is submitted with this call, the corresponding field in the account is emptied. 3. Email addresses: If no email addresses are specified, no change is made to the email addresses on file or to the email delivery preference. If either the **personalEmail** or **workEmail** is specified (or both), the system updates the corresponding email address(es) on file and the email delivery preference is set to `true`. (In that case, emails go to the **workEmail** address, if it exists, or else the **personalEmail**.) On the other hand, if as a result of this call both of the email addresses for the account are empty, the email delivery preference is set to `false`. 4. The bill-to and sold-to contacts are separate data entities; updating either one does not update the other. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AccountsApi.new

account_key = 'account_key_example' # String | Account number or account ID.

request = Zuora::PUTAccountType.new # PUTAccountType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Update account
  result = api_instance.p_ut_account(account_key, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AccountsApi->p_ut_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_key** | **String**| Account number or account ID. | 
 **request** | [**PUTAccountType**](PUTAccountType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



