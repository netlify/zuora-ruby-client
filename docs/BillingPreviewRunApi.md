# Zuora::BillingPreviewRunApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_billing_preview_run**](BillingPreviewRunApi.md#g_et_billing_preview_run) | **GET** /v1/billing-preview-runs/{billingPreviewRunId} | Get Billing Preview Run
[**p_ost_billing_preview_run**](BillingPreviewRunApi.md#p_ost_billing_preview_run) | **POST** /v1/billing-preview-runs | Create Billing Preview Run


# **g_et_billing_preview_run**
> GetBillingPreviewRunResponse g_et_billing_preview_run(billing_preview_run_id, opts)

Get Billing Preview Run

**Note:** This feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Retrieves a preview of future invoice items for multiple customer accounts through a billing preview run. If you have the Advanced AR Settlement feature enabled,  you can also retrieve a preview of future credit memo items. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   A billing preview run asynchronously generates a downloadable CSV file containing a preview of invoice item data and credit memo item data for a batch of customer accounts. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::BillingPreviewRunApi.new

billing_preview_run_id = 'billing_preview_run_id_example' # String | Id of the billing preview run. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get Billing Preview Run
  result = api_instance.g_et_billing_preview_run(billing_preview_run_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling BillingPreviewRunApi->g_et_billing_preview_run: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **billing_preview_run_id** | **String**| Id of the billing preview run.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GetBillingPreviewRunResponse**](GetBillingPreviewRunResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_billing_preview_run**
> InlineResponse200 p_ost_billing_preview_run(request, opts)

Create Billing Preview Run

**Note:** This feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Creates billing preview runs for multiple customer accounts.  You can run up to 10 billing previews in batches concurrently. A single batch of customer accounts can only have one billing preview run at a time. So you can have up to 10 batches running at the same time. If you create a billing preview run for all customer batches, you cannot create another billing preview run until this preview run is completed. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::BillingPreviewRunApi.new

request = Zuora::PostBillingPreviewRunParam.new # PostBillingPreviewRunParam | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Create Billing Preview Run
  result = api_instance.p_ost_billing_preview_run(request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling BillingPreviewRunApi->p_ost_billing_preview_run: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**PostBillingPreviewRunParam**](PostBillingPreviewRunParam.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



