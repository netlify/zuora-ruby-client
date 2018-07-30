# Zuora::PaymentMethodsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**d_elete_payment_methods**](PaymentMethodsApi.md#d_elete_payment_methods) | **DELETE** /v1/payment-methods/{payment-method-id} | Delete payment method
[**g_et_payment_methods**](PaymentMethodsApi.md#g_et_payment_methods) | **GET** /v1/payment-methods/credit-cards/accounts/{account-key} | Get payment methods
[**object_delete_payment_method**](PaymentMethodsApi.md#object_delete_payment_method) | **DELETE** /v1/object/payment-method/{id} | CRUD: Delete payment method
[**object_get_payment_method**](PaymentMethodsApi.md#object_get_payment_method) | **GET** /v1/object/payment-method/{id} | CRUD: Get payment method
[**object_post_payment_method**](PaymentMethodsApi.md#object_post_payment_method) | **POST** /v1/object/payment-method | CRUD: Create payment method
[**object_put_payment_method**](PaymentMethodsApi.md#object_put_payment_method) | **PUT** /v1/object/payment-method/{id} | CRUD: Update payment method
[**p_ost_payment_methods**](PaymentMethodsApi.md#p_ost_payment_methods) | **POST** /v1/payment-methods/credit-cards | Create payment method
[**p_ost_payment_methods_decryption**](PaymentMethodsApi.md#p_ost_payment_methods_decryption) | **POST** /v1/payment-methods/decryption | Create Apple Pay payment method
[**p_ut_payment_methods**](PaymentMethodsApi.md#p_ut_payment_methods) | **PUT** /v1/payment-methods/credit-cards/{payment-method-id} | Update payment method
[**p_ut_verify_payment_methods**](PaymentMethodsApi.md#p_ut_verify_payment_methods) | **PUT** /v1/payment-methods/{payment-method-id}/verify | Verify payment method


# **d_elete_payment_methods**
> CommonResponseType d_elete_payment_methods(payment_method_id, opts)

Delete payment method

Deletes a credit card payment method from the specified customer account.  If the specified payment method is the account's default payment method, the request will fail.  In that case, you must first designate a different payment method for that customer to be the default. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodsApi.new

payment_method_id = 'payment_method_id_example' # String | Unique identifier of a payment method. (Since this ID is unique, and linked to a customer account in the system, no customer identifier is needed.)

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Delete payment method
  result = api_instance.d_elete_payment_methods(payment_method_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentMethodsApi->d_elete_payment_methods: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payment_method_id** | **String**| Unique identifier of a payment method. (Since this ID is unique, and linked to a customer account in the system, no customer identifier is needed.) | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_payment_methods**
> GETPaymentMethodsType g_et_payment_methods(account_key, opts)

Get payment methods

This REST API reference describes how to retrieve all credit card information for the specified customer account.   ## Notes The response includes details credit or debit cards for the specified customer account. Card numbers are masked, e.g., \"************1234\". Cards are returned in reverse chronological order of last update.  You can send requests for bank transfer payment methods types. The response will not include bank transfer details.  The response only includes payment details on payment methods that are credit or debit cards. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodsApi.new

account_key = 'account_key_example' # String | Account number or account ID.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  page_size: 20 # Integer | Number of rows returned per page. 
}

begin
  #Get payment methods
  result = api_instance.g_et_payment_methods(account_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentMethodsApi->g_et_payment_methods: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_key** | **String**| Account number or account ID. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]

### Return type

[**GETPaymentMethodsType**](GETPaymentMethodsType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_delete_payment_method**
> ProxyDeleteResponse object_delete_payment_method(id, opts)

CRUD: Delete payment method



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Delete payment method
  result = api_instance.object_delete_payment_method(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentMethodsApi->object_delete_payment_method: #{e}"
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



# **object_get_payment_method**
> ProxyGetPaymentMethod object_get_payment_method(id, opts)

CRUD: Get payment method



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodsApi.new

id = 'id_example' # String | Object id

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  fields: 'fields_example' # String | Object fields to return
}

begin
  #CRUD: Get payment method
  result = api_instance.object_get_payment_method(id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentMethodsApi->object_get_payment_method: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **fields** | **String**| Object fields to return | [optional] 

### Return type

[**ProxyGetPaymentMethod**](ProxyGetPaymentMethod.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_post_payment_method**
> ProxyCreateOrModifyResponse object_post_payment_method(create_request, opts)

CRUD: Create payment method



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodsApi.new

create_request = Zuora::ProxyCreatePaymentMethod.new # ProxyCreatePaymentMethod | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Create payment method
  result = api_instance.object_post_payment_method(create_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentMethodsApi->object_post_payment_method: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_request** | [**ProxyCreatePaymentMethod**](ProxyCreatePaymentMethod.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_put_payment_method**
> ProxyCreateOrModifyResponse object_put_payment_method(id, modify_request, opts)

CRUD: Update payment method



### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodsApi.new

id = 'id_example' # String | Object id

modify_request = Zuora::ProxyModifyPaymentMethod.new # ProxyModifyPaymentMethod | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #CRUD: Update payment method
  result = api_instance.object_put_payment_method(id, modify_request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentMethodsApi->object_put_payment_method: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifyPaymentMethod**](ProxyModifyPaymentMethod.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_payment_methods**
> POSTPaymentMethodResponseType p_ost_payment_methods(request, opts)

Create payment method

This REST API reference describes how to create a new credit card payment method for a customer account.  ## Notes  This API call is CORS Enabled. Use client-side JavaScript to invoke the call.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodsApi.new

request = Zuora::POSTPaymentMethodType.new # POSTPaymentMethodType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Create payment method
  result = api_instance.p_ost_payment_methods(request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentMethodsApi->p_ost_payment_methods: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTPaymentMethodType**](POSTPaymentMethodType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**POSTPaymentMethodResponseType**](POSTPaymentMethodResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_payment_methods_decryption**
> POSTPaymentMethodResponseDecryption p_ost_payment_methods_decryption(request, opts)

Create Apple Pay payment method

The decryption API endpoint can conditionally perform 3 tasks in one atomic call:   * Decrypt Apple Pay Payment token   * Create Credit Card Payment Method in Zuora with decrypted Apple Pay information   * Process Payment on a specified Invoice (optional) 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodsApi.new

request = Zuora::POSTPaymentMethodDecryption.new # POSTPaymentMethodDecryption | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Create Apple Pay payment method
  result = api_instance.p_ost_payment_methods_decryption(request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentMethodsApi->p_ost_payment_methods_decryption: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTPaymentMethodDecryption**](POSTPaymentMethodDecryption.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**POSTPaymentMethodResponseDecryption**](POSTPaymentMethodResponseDecryption.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_payment_methods**
> PUTPaymentMethodResponseType p_ut_payment_methods(payment_method_id, request, opts)

Update payment method

Updates an existing credit card payment method for the specified customer account. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodsApi.new

payment_method_id = 'payment_method_id_example' # String | Unique ID of the payment method to update.

request = Zuora::PUTPaymentMethodType.new # PUTPaymentMethodType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Update payment method
  result = api_instance.p_ut_payment_methods(payment_method_id, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentMethodsApi->p_ut_payment_methods: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payment_method_id** | **String**| Unique ID of the payment method to update. | 
 **request** | [**PUTPaymentMethodType**](PUTPaymentMethodType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**PUTPaymentMethodResponseType**](PUTPaymentMethodResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_verify_payment_methods**
> PUTVerifyPaymentMethodResponseType p_ut_verify_payment_methods(payment_method_id, body)

Verify payment method

Sends an authorization request to the corresponding payment gateway to verify the payment method, even though no changes are made for the payment method. Supported payment methods are Credit Cards and Paypal.  Zuora now supports performing a standalone zero dollar verification or one dollar authorization for credit cards. It also supports a billing agreement status check on PayPal payment methods.  If a payment method is created by Hosted Payment Pages and is not assigned to any billing account, the payment method cannot be verified through this operation. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::PaymentMethodsApi.new

payment_method_id = 'payment_method_id_example' # String | The ID of the payment method to be verified. 

body = Zuora::PUTVerifyPaymentMethodType.new # PUTVerifyPaymentMethodType | 


begin
  #Verify payment method
  result = api_instance.p_ut_verify_payment_methods(payment_method_id, body)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling PaymentMethodsApi->p_ut_verify_payment_methods: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payment_method_id** | **String**| The ID of the payment method to be verified.  | 
 **body** | [**PUTVerifyPaymentMethodType**](PUTVerifyPaymentMethodType.md)|  | 

### Return type

[**PUTVerifyPaymentMethodResponseType**](PUTVerifyPaymentMethodResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



