# SwaggerClient::SubscriptionsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_subscriptions_by_account**](SubscriptionsApi.md#g_et_subscriptions_by_account) | **GET** /v1/subscriptions/accounts/{account-key} | Get subscriptions by account
[**g_et_subscriptions_by_key**](SubscriptionsApi.md#g_et_subscriptions_by_key) | **GET** /v1/subscriptions/{subscription-key} | Get subscriptions by key
[**g_et_subscriptions_by_key_and_version**](SubscriptionsApi.md#g_et_subscriptions_by_key_and_version) | **GET** /v1/subscriptions/{subscription-key}/versions/{version} | Get subscriptions by key and version
[**object_delete_subscription**](SubscriptionsApi.md#object_delete_subscription) | **DELETE** /v1/object/subscription/{id} | CRUD: Delete Subscription
[**object_get_subscription**](SubscriptionsApi.md#object_get_subscription) | **GET** /v1/object/subscription/{id} | CRUD: Retrieve Subscription
[**object_put_subscription**](SubscriptionsApi.md#object_put_subscription) | **PUT** /v1/object/subscription/{id} | CRUD: Update Subscription
[**p_ost_preview_subscription**](SubscriptionsApi.md#p_ost_preview_subscription) | **POST** /v1/subscriptions/preview | Preview subscription
[**p_ost_subscription**](SubscriptionsApi.md#p_ost_subscription) | **POST** /v1/subscriptions | Create subscription
[**p_ut_cancel_subscription**](SubscriptionsApi.md#p_ut_cancel_subscription) | **PUT** /v1/subscriptions/{subscription-key}/cancel | Cancel subscription
[**p_ut_renew_subscription**](SubscriptionsApi.md#p_ut_renew_subscription) | **PUT** /v1/subscriptions/{subscription-key}/renew | Renew subscription
[**p_ut_resume_subscription**](SubscriptionsApi.md#p_ut_resume_subscription) | **PUT** /v1/subscriptions/{subscription-key}/resume | Resume subscription
[**p_ut_subscription**](SubscriptionsApi.md#p_ut_subscription) | **PUT** /v1/subscriptions/{subscription-key} | Update subscription
[**p_ut_suspend_subscription**](SubscriptionsApi.md#p_ut_suspend_subscription) | **PUT** /v1/subscriptions/{subscription-key}/suspend | Suspend subscription
[**p_ut_update_subscription_custom_fields**](SubscriptionsApi.md#p_ut_update_subscription_custom_fields) | **PUT** /v1/subscriptions/{subscriptionNumber}/customFields | Update subscription custom fields


# **g_et_subscriptions_by_account**
> GETSubscriptionWrapper g_et_subscriptions_by_account(account_key, opts)

Get subscriptions by account

Retrieves all subscriptions associated with the specified account. Zuora only returns the latest version of the subscriptions.  Subscription data is returned in reverse chronological order based on `updatedDate`. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

account_key = "account_key_example" # String |  Possible values are: * an account number * an account ID 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
  charge_detail: "charge_detail_example" # String | The segmented rate plan charges.  When an amendment results in a change to a charge, Zuora creates a segmented rate plan charge. Use this field to track segment charges.  Possible values are:  * __last-segment__: (Default) The last rate plan charge on the subscription. The last rate plan charge is the last one in the order of time on the subscription rather than the most recent changed charge on the subscription.  * __current-segment__: The segmented charge that is active on today’s date (effectiveStartDate <= today’s date < effectiveEndDate).    * __all-segments__: All the segmented charges. The `chargeSegments` field is returned in the response. The `chargeSegments` field contains an array of the charge information for all the charge segments.   * __specific-segment&as-of-date=date__: The segmented charge that is active on a date you specified (effectiveStartDate <= specific date < effectiveEndDate). The format of the date is yyyy-mm-dd. 
}

begin
  #Get subscriptions by account
  result = api_instance.g_et_subscriptions_by_account(account_key, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->g_et_subscriptions_by_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_key** | **String**|  Possible values are: * an account number * an account ID  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]
 **charge_detail** | **String**| The segmented rate plan charges.  When an amendment results in a change to a charge, Zuora creates a segmented rate plan charge. Use this field to track segment charges.  Possible values are:  * __last-segment__: (Default) The last rate plan charge on the subscription. The last rate plan charge is the last one in the order of time on the subscription rather than the most recent changed charge on the subscription.  * __current-segment__: The segmented charge that is active on today’s date (effectiveStartDate &lt;&#x3D; today’s date &lt; effectiveEndDate).    * __all-segments__: All the segmented charges. The &#x60;chargeSegments&#x60; field is returned in the response. The &#x60;chargeSegments&#x60; field contains an array of the charge information for all the charge segments.   * __specific-segment&amp;as-of-date&#x3D;date__: The segmented charge that is active on a date you specified (effectiveStartDate &lt;&#x3D; specific date &lt; effectiveEndDate). The format of the date is yyyy-mm-dd.  | [optional] 

### Return type

[**GETSubscriptionWrapper**](GETSubscriptionWrapper.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_subscriptions_by_key**
> GETSubscriptionTypeWithSuccess g_et_subscriptions_by_key(subscription_key, opts)

Get subscriptions by key

This REST API reference describes how to retrieve detailed information about a specified subscription in the latest version. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

subscription_key = "subscription_key_example" # String | Possible values are:   * a subscription number   * a subscription ID 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  charge_detail: "charge_detail_example" # String |  The segmented rate plan charges. When an amendment results in a change to a charge, Zuora creates a segmented rate plan charge. Use this field to track segment charges.  Possible values are:   * __last-segment__: (Default) The last rate plan charge on the subscription. The last rate plan charge is the last one in the order of time on the subscription rather than the most recent changed charge on the subscription.  * __current-segment__: The segmented charge that is active on today’s date (effectiveStartDate <= today’s date < effectiveEndDate).    * __all-segments__: All the segmented charges. The `chargeSegments` field is returned in the response. The `chargeSegments` field contains an array of the charge information for all the charge segments.   * __specific-segment&as-of-date=date__: The segmented charge that is active on a date you specified (effectiveStartDate <= specific date < effectiveEndDate). The format of the date is yyyy-mm-dd. 
}

begin
  #Get subscriptions by key
  result = api_instance.g_et_subscriptions_by_key(subscription_key, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->g_et_subscriptions_by_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_key** | **String**| Possible values are:   * a subscription number   * a subscription ID  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **charge_detail** | **String**|  The segmented rate plan charges. When an amendment results in a change to a charge, Zuora creates a segmented rate plan charge. Use this field to track segment charges.  Possible values are:   * __last-segment__: (Default) The last rate plan charge on the subscription. The last rate plan charge is the last one in the order of time on the subscription rather than the most recent changed charge on the subscription.  * __current-segment__: The segmented charge that is active on today’s date (effectiveStartDate &lt;&#x3D; today’s date &lt; effectiveEndDate).    * __all-segments__: All the segmented charges. The &#x60;chargeSegments&#x60; field is returned in the response. The &#x60;chargeSegments&#x60; field contains an array of the charge information for all the charge segments.   * __specific-segment&amp;as-of-date&#x3D;date__: The segmented charge that is active on a date you specified (effectiveStartDate &lt;&#x3D; specific date &lt; effectiveEndDate). The format of the date is yyyy-mm-dd.  | [optional] 

### Return type

[**GETSubscriptionTypeWithSuccess**](GETSubscriptionTypeWithSuccess.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_subscriptions_by_key_and_version**
> GETSubscriptionTypeWithSuccess g_et_subscriptions_by_key_and_version(subscription_key, version, opts)

Get subscriptions by key and version

This REST API reference describes how to retrieve detailed information about a specified subscription in a specified version. When you create a subscription amendment, you create a new version of the subscription. You can use this method to retrieve information about a subscription in any version. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

subscription_key = "subscription_key_example" # String | Subscription number. For example, A-S00000135. 

version = "version_example" # String | Subscription version. For example, 1. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  charge_detail: "charge_detail_example" # String |  The segmented rate plan charges. When an amendment results in a change to a charge, Zuora creates a segmented rate plan charge. Use this field to track segment charges.  Possible values are:   * __last-segment__: (Default) The last rate plan charge on the subscription. The last rate plan charge is the last one in the order of time on the subscription rather than the most recent changed charge on the subscription.  * __current-segment__: The segmented charge that is active on today’s date (effectiveStartDate <= today’s date < effectiveEndDate).    * __all-segments__: All the segmented charges. The `chargeSegments` field is returned in the response. The `chargeSegments` field contains an array of the charge information for all the charge segments.   * __specific-segment&as-of-date=date__: The segmented charge that is active on a date you specified (effectiveStartDate <= specific date < effectiveEndDate). The format of the date is yyyy-mm-dd. 
}

begin
  #Get subscriptions by key and version
  result = api_instance.g_et_subscriptions_by_key_and_version(subscription_key, version, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->g_et_subscriptions_by_key_and_version: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_key** | **String**| Subscription number. For example, A-S00000135.  | 
 **version** | **String**| Subscription version. For example, 1.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **charge_detail** | **String**|  The segmented rate plan charges. When an amendment results in a change to a charge, Zuora creates a segmented rate plan charge. Use this field to track segment charges.  Possible values are:   * __last-segment__: (Default) The last rate plan charge on the subscription. The last rate plan charge is the last one in the order of time on the subscription rather than the most recent changed charge on the subscription.  * __current-segment__: The segmented charge that is active on today’s date (effectiveStartDate &lt;&#x3D; today’s date &lt; effectiveEndDate).    * __all-segments__: All the segmented charges. The &#x60;chargeSegments&#x60; field is returned in the response. The &#x60;chargeSegments&#x60; field contains an array of the charge information for all the charge segments.   * __specific-segment&amp;as-of-date&#x3D;date__: The segmented charge that is active on a date you specified (effectiveStartDate &lt;&#x3D; specific date &lt; effectiveEndDate). The format of the date is yyyy-mm-dd.  | [optional] 

### Return type

[**GETSubscriptionTypeWithSuccess**](GETSubscriptionTypeWithSuccess.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_delete_subscription**
> ProxyDeleteResponse object_delete_subscription(id, opts)

CRUD: Delete Subscription

**Note:** This feature is unavailable if you have the Orders feature enabled. See [Orders Migration Guidance](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AB_Orders_Migration_Guidance) for more information. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Delete Subscription
  result = api_instance.object_delete_subscription(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->object_delete_subscription: #{e}"
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



# **object_get_subscription**
> ProxyGetSubscription object_get_subscription(id, opts)

CRUD: Retrieve Subscription



### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

id = "id_example" # String | Object id

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  fields: "fields_example" # String | Object fields to return
}

begin
  #CRUD: Retrieve Subscription
  result = api_instance.object_get_subscription(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->object_get_subscription: #{e}"
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

[**ProxyGetSubscription**](ProxyGetSubscription.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **object_put_subscription**
> ProxyCreateOrModifyResponse object_put_subscription(id, modify_request, opts)

CRUD: Update Subscription

**Note:** This feature is unavailable if you have the Orders feature enabled. See [Orders Migration Guidance](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AB_Orders_Migration_Guidance) for more information. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

id = "id_example" # String | Object id

modify_request = SwaggerClient::ProxyModifySubscription.new # ProxyModifySubscription | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #CRUD: Update Subscription
  result = api_instance.object_put_subscription(id, modify_request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->object_put_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Object id | 
 **modify_request** | [**ProxyModifySubscription**](ProxyModifySubscription.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**ProxyCreateOrModifyResponse**](ProxyCreateOrModifyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_preview_subscription**
> POSTSubscriptionPreviewResponseType p_ost_preview_subscription(request, opts)

Preview subscription

The REST API reference describes how to create a new subscription in preview mode. This call does not require a valid customer account. It can be used to show potential new customers a preview of a subscription with complete details and charges before creating an account, or to let existing customers preview a subscription with all charges before committing.  ## Notes - This feature is unavailable if you have the Orders feature enabled. See [Orders Migration Guidance](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AB_Orders_Migration_Guidance) for more information. - The response of the Preview Subscription call is based on the REST API minor version you set in the request header. The response structure might be different if you use different minor version numbers.   - If you have the Advanced AR Settlement feature enabled, we recommend that you set the `zuora-version` parameter to `207.0` or later. Otherwise, an error is returned.   - Default values for **customerAcceptanceDate** and **serviceActivationDate** are set as follows.  |        | serviceActivationDate (SA) specified          | serviceActivationDate (SA) NOT specified  | | ------------- |:-------------:| -----:| | customerAcceptanceDate (CA) specified      | SA uses value in the request call; CA uses value in the request call| CA uses value in the request call;SA uses CE as default | | customerAcceptanceDate (CA) NOT specified      | SA uses value in the request call; CA uses SA as default |   SA and CA use CE as default | 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

request = SwaggerClient::POSTSubscriptionPreviewType.new # POSTSubscriptionPreviewType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  zuora_version: "zuora_version_example" # String |  The minor version of the Zuora REST API.   You need to set this parameter if you use the following fields: * targetDate * includeExistingDraftDocItems * previewType   If you have the Advanced AR Settlement feature enabled, you need to specify this parameter. Otherwise, an error is returned.   See [Zuora REST API Versions](https://www.zuora.com/developer/api-reference/#section/API-Versions) for more information.  
}

begin
  #Preview subscription
  result = api_instance.p_ost_preview_subscription(request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->p_ost_preview_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTSubscriptionPreviewType**](POSTSubscriptionPreviewType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **zuora_version** | **String**|  The minor version of the Zuora REST API.   You need to set this parameter if you use the following fields: * targetDate * includeExistingDraftDocItems * previewType   If you have the Advanced AR Settlement feature enabled, you need to specify this parameter. Otherwise, an error is returned.   See [Zuora REST API Versions](https://www.zuora.com/developer/api-reference/#section/API-Versions) for more information.   | [optional] 

### Return type

[**POSTSubscriptionPreviewResponseType**](POSTSubscriptionPreviewResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_subscription**
> POSTSubscriptionResponseType p_ost_subscription(request, opts)

Create subscription

This REST API reference describes how to create a new subscription for an existing customer account.  ## Notes This feature is unavailable if you have the Orders feature enabled. See [Orders Migration Guidance](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AB_Orders_Migration_Guidance) for more information.  If invoiceCollect is `true`, the call will not return success = `true` unless the subscription, invoice, and payment are all successful.  Default values for **customerAcceptanceDate** and **serviceActivationDate** are set as follows.  |        | serviceActivationDate(SA) specified          | serviceActivationDate (SA) NOT specified  | | ------------- |:-------------:| -----:| | customerAcceptanceDate (CA) specified| SA uses value in the request call; CA uses value in the request call| CA uses value in the request call;SA uses CE as default | | customerAcceptanceDate (CA) NOT specified      | SA uses value in the request call; CA uses SA as default |   SA and CA use CE as default | 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

request = SwaggerClient::POSTSubscriptionType.new # POSTSubscriptionType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  zuora_version: "zuora_version_example" # String | The minor version of the Zuora REST API.   You only need to set this parameter if you use the following fields: * invoice * collect * runBilling * targetDate 
}

begin
  #Create subscription
  result = api_instance.p_ost_subscription(request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->p_ost_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTSubscriptionType**](POSTSubscriptionType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **zuora_version** | **String**| The minor version of the Zuora REST API.   You only need to set this parameter if you use the following fields: * invoice * collect * runBilling * targetDate  | [optional] 

### Return type

[**POSTSubscriptionResponseType**](POSTSubscriptionResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_cancel_subscription**
> POSTSubscriptionCancellationResponseType p_ut_cancel_subscription(subscription_key, request, opts)

Cancel subscription

This REST API reference describes how to cancel an active subscription.  **Note:** This feature is unavailable if you have the Orders feature enabled. See [Orders Migration Guidance](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AB_Orders_Migration_Guidance) for more information. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

subscription_key = "subscription_key_example" # String | Subscription number or ID. Subscription status must be `Active`.

request = SwaggerClient::POSTSubscriptionCancellationType.new # POSTSubscriptionCancellationType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  zuora_version: "zuora_version_example" # String | The minor version of the Zuora REST API.   You only need to set this parameter if you use the following fields: * invoice * collect * runBilling * targetDate  
}

begin
  #Cancel subscription
  result = api_instance.p_ut_cancel_subscription(subscription_key, request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->p_ut_cancel_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_key** | **String**| Subscription number or ID. Subscription status must be &#x60;Active&#x60;. | 
 **request** | [**POSTSubscriptionCancellationType**](POSTSubscriptionCancellationType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **zuora_version** | **String**| The minor version of the Zuora REST API.   You only need to set this parameter if you use the following fields: * invoice * collect * runBilling * targetDate   | [optional] 

### Return type

[**POSTSubscriptionCancellationResponseType**](POSTSubscriptionCancellationResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_renew_subscription**
> PUTRenewSubscriptionResponseType p_ut_renew_subscription(subscription_key, request, opts)

Renew subscription

Renews a termed subscription using existing renewal terms.   **Note:** This feature is unavailable if you have the Orders feature enabled. See [Orders Migration Guidance](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AB_Orders_Migration_Guidance) for more information. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

subscription_key = "subscription_key_example" # String | Subscription number or ID

request = SwaggerClient::PUTRenewSubscriptionType.new # PUTRenewSubscriptionType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  zuora_version: "zuora_version_example" # String | The minor version of the Zuora REST API.   You only need to set this parameter if you use the following fields: * invoice * collect * runBilling * targetDate  
}

begin
  #Renew subscription
  result = api_instance.p_ut_renew_subscription(subscription_key, request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->p_ut_renew_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_key** | **String**| Subscription number or ID | 
 **request** | [**PUTRenewSubscriptionType**](PUTRenewSubscriptionType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **zuora_version** | **String**| The minor version of the Zuora REST API.   You only need to set this parameter if you use the following fields: * invoice * collect * runBilling * targetDate   | [optional] 

### Return type

[**PUTRenewSubscriptionResponseType**](PUTRenewSubscriptionResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_resume_subscription**
> PUTSubscriptionResumeResponseType p_ut_resume_subscription(subscription_key, request, opts)

Resume subscription

This REST API reference describes how to resume a suspended subscription.   This feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://suport.zuora.com).   **Note:** This feature is unavailable if you have the Orders feature enabled. See [Orders Migration Guidance](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AB_Orders_Migration_Guidance) for more information. This feature is also unavailable if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

subscription_key = "subscription_key_example" # String | Subscription number or ID. Subscription status must be Active.

request = SwaggerClient::PUTSubscriptionResumeType.new # PUTSubscriptionResumeType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  zuora_version: "zuora_version_example" # String | The minor version of the Zuora REST API.   You only need to set this parameter if you use the following fields: * invoice * collect * runBilling * targetDate 
}

begin
  #Resume subscription
  result = api_instance.p_ut_resume_subscription(subscription_key, request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->p_ut_resume_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_key** | **String**| Subscription number or ID. Subscription status must be Active. | 
 **request** | [**PUTSubscriptionResumeType**](PUTSubscriptionResumeType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **zuora_version** | **String**| The minor version of the Zuora REST API.   You only need to set this parameter if you use the following fields: * invoice * collect * runBilling * targetDate  | [optional] 

### Return type

[**PUTSubscriptionResumeResponseType**](PUTSubscriptionResumeResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_subscription**
> PUTSubscriptionResponseType p_ut_subscription(subscription_key, request, opts)

Update subscription

Use this call to make the following kinds of changes to a subscription:   * Add a note   * Change the renewal term or auto-renewal flag   * Change the term length or change between evergreen and termed   * Add a new product rate plan   * Remove an existing subscription rate plan   * Change the quantity or price of an existing subscription rate plan  ## Notes * This feature is unavailable if you have the Orders feature enabled. See [Orders Migration Guidance](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AB_Orders_Migration_Guidance) for more information. * The Update Subscription call creates a new subscription, which has the old subscription number but a new subscription ID.  The old subscription is canceled but remains in the system. * In one request, this call can make:   * Up to 9 combined add, update, and remove changes   * No more than 1 change to terms & conditions * Updates are performed in the following sequence:   1. First change the notes on the existing subscription, if requested.   2. Then change the terms and conditions, if requested.   3. Then perform the remaining amendments based upon the effective dates specified. If multiple amendments have the same contract-effective dates, then execute adds before updates, and updates before removes. * The update operation is atomic. If any of the updates fails, the entire operation is rolled back. * The response of the Update Subscription call is based on the REST API minor version you set in the request header. The response structure might be different if you use different minor version numbers.  * If you have the Advanced AR Settlement feature enabled, we recommend that you set the `zuora-version` parameter to `207.0` or later. Otherwise, an error is returned.  ## Override a Tiered Price There are two ways you override a tiered price:  * Override a specific tier number For example: `tiers[{tier:1,price:8},{tier:2,price:6}]`  * Override the entire tier structure For example:  `tiers[{tier:1,price:8,startingUnit:1,endingUnit:100,priceFormat:\"FlatFee\"}, {tier:2,price:6,startingUnit:101,priceFormat:\"FlatFee\"}]`  If you just override a specific tier, do not include the `startingUnit` field in the request. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

subscription_key = "subscription_key_example" # String | Subscription number or ID.

request = SwaggerClient::PUTSubscriptionType.new # PUTSubscriptionType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  zuora_version: "zuora_version_example" # String |  The minor version of the Zuora REST API.   You need to set this parameter if you use the following fields: * collect * invoice * includeExistingDraftDocItems * previewType * runBilling * targetDate   If you have the Advanced AR Settlement feature enabled, you need to specify this parameter. Otherwise, an error is returned.   See [Zuora REST API Versions](https://www.zuora.com/developer/api-reference/#section/API-Versions) for more information. 
}

begin
  #Update subscription
  result = api_instance.p_ut_subscription(subscription_key, request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->p_ut_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_key** | **String**| Subscription number or ID. | 
 **request** | [**PUTSubscriptionType**](PUTSubscriptionType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **zuora_version** | **String**|  The minor version of the Zuora REST API.   You need to set this parameter if you use the following fields: * collect * invoice * includeExistingDraftDocItems * previewType * runBilling * targetDate   If you have the Advanced AR Settlement feature enabled, you need to specify this parameter. Otherwise, an error is returned.   See [Zuora REST API Versions](https://www.zuora.com/developer/api-reference/#section/API-Versions) for more information.  | [optional] 

### Return type

[**PUTSubscriptionResponseType**](PUTSubscriptionResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_suspend_subscription**
> PUTSubscriptionSuspendResponseType p_ut_suspend_subscription(subscription_key, request, opts)

Suspend subscription

This REST API reference describes how to suspend an active subscription.   This feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://suport.zuora.com).  **Note:** This feature is unavailable if you have the Orders feature enabled. See [Orders Migration Guidance](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AB_Orders_Migration_Guidance) for more information. This feature is also unavailable if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

subscription_key = "subscription_key_example" # String | Subscription number or ID. Subscription status must be Active.

request = SwaggerClient::PUTSubscriptionSuspendType.new # PUTSubscriptionSuspendType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  zuora_version: "zuora_version_example" # String | The minor version of the Zuora REST API.   You only need to set this parameter if you use the following fields: * invoice * collect * runBilling * targetDate 
}

begin
  #Suspend subscription
  result = api_instance.p_ut_suspend_subscription(subscription_key, request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->p_ut_suspend_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_key** | **String**| Subscription number or ID. Subscription status must be Active. | 
 **request** | [**PUTSubscriptionSuspendType**](PUTSubscriptionSuspendType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **zuora_version** | **String**| The minor version of the Zuora REST API.   You only need to set this parameter if you use the following fields: * invoice * collect * runBilling * targetDate  | [optional] 

### Return type

[**PUTSubscriptionSuspendResponseType**](PUTSubscriptionSuspendResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_update_subscription_custom_fields**
> CommonResponse p_ut_update_subscription_custom_fields(subscription_number, body, opts)

Update subscription custom fields

**Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Updates the custom fields of a specified subscription. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SubscriptionsApi.new

subscription_number = "subscription_number_example" # String | The subscription number to be updated.

body = SwaggerClient::PUTSubscriptionPatchRequestType.new # PUTSubscriptionPatchRequestType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Update subscription custom fields
  result = api_instance.p_ut_update_subscription_custom_fields(subscription_number, body, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SubscriptionsApi->p_ut_update_subscription_custom_fields: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_number** | **String**| The subscription number to be updated. | 
 **body** | [**PUTSubscriptionPatchRequestType**](PUTSubscriptionPatchRequestType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



