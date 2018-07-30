# Zuora::UsageWithRealTimeRatingApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**d_elete_usage_record**](UsageWithRealTimeRatingApi.md#d_elete_usage_record) | **DELETE** /usage/{id} | Delete usage record
[**g_et_download_usage_file_template**](UsageWithRealTimeRatingApi.md#g_et_download_usage_file_template) | **GET** /usage-imports/templates/{fileType} | Download usage file template
[**g_et_download_usage_import_failure_file**](UsageWithRealTimeRatingApi.md#g_et_download_usage_import_failure_file) | **GET** /usage-imports/{id}/errors | Download usage import failure file
[**g_et_download_usage_import_file**](UsageWithRealTimeRatingApi.md#g_et_download_usage_import_file) | **GET** /usage-imports/{id}/import-file | Download usage import file
[**g_et_rating_results_by_account**](UsageWithRealTimeRatingApi.md#g_et_rating_results_by_account) | **GET** /rating/rated-results/account/{accountNumber} | Get rating results by account
[**g_et_rating_results_by_charge**](UsageWithRealTimeRatingApi.md#g_et_rating_results_by_charge) | **GET** /rating/rated-results/charge/{chargeNumber} | Get rating results by charge
[**g_et_rating_results_by_subscripiton**](UsageWithRealTimeRatingApi.md#g_et_rating_results_by_subscripiton) | **GET** /rating/rated-results/subscription/{subscriptionNumber} | Get rating results by subscription
[**g_et_usage_import_details**](UsageWithRealTimeRatingApi.md#g_et_usage_import_details) | **GET** /usage-imports/{id}/detail | Get details of usage import
[**g_et_usage_import_status**](UsageWithRealTimeRatingApi.md#g_et_usage_import_status) | **GET** /usage-imports/{id}/status | Get status of usage import
[**g_et_usage_imports**](UsageWithRealTimeRatingApi.md#g_et_usage_imports) | **GET** /usage-imports | Get usage imports
[**g_et_usage_rating_by_account**](UsageWithRealTimeRatingApi.md#g_et_usage_rating_by_account) | **GET** /rating/rated-usages/account/{accountNumber} | Get usage rating by account
[**g_et_usage_rating_by_charge**](UsageWithRealTimeRatingApi.md#g_et_usage_rating_by_charge) | **GET** /rating/rated-usages/charge/{chargeNumber} | Get usage rating by charge
[**g_et_usage_rating_by_subscription**](UsageWithRealTimeRatingApi.md#g_et_usage_rating_by_subscription) | **GET** /rating/rated-usages/subscription/{subscriptionNumber} | Get usage rating by subscription
[**g_et_usage_record**](UsageWithRealTimeRatingApi.md#g_et_usage_record) | **GET** /usage/{id} | Get usage record
[**g_et_usage_records_query**](UsageWithRealTimeRatingApi.md#g_et_usage_records_query) | **GET** /usage/query | Query usage records
[**g_et_usage_records_stream_query**](UsageWithRealTimeRatingApi.md#g_et_usage_records_stream_query) | **GET** /usage/stream-query | Query usage records in stream
[**p_ost_import_usage_file**](UsageWithRealTimeRatingApi.md#p_ost_import_usage_file) | **POST** /usage-imports | Import usage file
[**p_ost_usage_records**](UsageWithRealTimeRatingApi.md#p_ost_usage_records) | **POST** /usage | Create usage records
[**p_ut_usage_record**](UsageWithRealTimeRatingApi.md#p_ut_usage_record) | **PUT** /usage/{id} | Update usage record


# **d_elete_usage_record**
> DELETEUsageResponseType d_elete_usage_record(authorization, id, opts)

Delete usage record

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Deletes a usage record. Note that you can only delete usage records with the Pending or Rated status. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

id = 'id_example' # String | The ID of the usage record you want to delete.  

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Delete usage record
  result = api_instance.d_elete_usage_record(authorization, id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->d_elete_usage_record: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **id** | **String**| The ID of the usage record you want to delete.   | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

[**DELETEUsageResponseType**](DELETEUsageResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_download_usage_file_template**
> g_et_download_usage_file_template(authorization, file_type, opts)

Download usage file template

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Downloads a usage file template.   After the template is downloaded, you can create a usage file based on the template and add usage records to the file.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

file_type = 'file_type_example' # String | The type of the usage file template to be downladed. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Download usage file template
  api_instance.g_et_download_usage_file_template(authorization, file_type, opts)
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_download_usage_file_template: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **file_type** | **String**| The type of the usage file template to be downladed.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_download_usage_import_failure_file**
> g_et_download_usage_import_failure_file(authorization, id, opts)

Download usage import failure file

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Downloads the corresponding usage import failure file when a usage file fails to be imported. Usage import failure files are only available for usage import files in COMPLETED_WITH_ERRORS status   The downloaded usage import failure file is in ZIP format, and contains the error information about each usage record failing to be imported.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

id = 'id_example' # String | The ID of the usage import. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Download usage import failure file
  api_instance.g_et_download_usage_import_failure_file(authorization, id, opts)
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_download_usage_import_failure_file: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **id** | **String**| The ID of the usage import.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/octet-stream



# **g_et_download_usage_import_file**
> g_et_download_usage_import_file(authorization, id, opts)

Download usage import file

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Downloads a usage import file with the specified usage import ID.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

id = 'id_example' # String | The ID of the usage import. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Download usage import file
  api_instance.g_et_download_usage_import_file(authorization, id, opts)
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_download_usage_import_file: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **id** | **String**| The ID of the usage import.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/octet-stream



# **g_et_rating_results_by_account**
> GetRatedResultsType g_et_rating_results_by_account(authorization, account_number, opts)

Get rating results by account

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the rating result of all the usage charges associated with the specified customer account. The response returns the rating amount of the charges based on billing period.   By default, the response data is displayed in descending order by updated time.  You can specify the date range for which you want to rate in the `fromDate` and `toDate` query parameters. For example: /rated-results/account/*accountNumber*?fromDate=2016-08-01&toDate=2016-08-21 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

account_number = 'account_number_example' # String | The account number. For example, A00000001. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
  from_date: Date.parse('2013-10-20'), # Date | The start date of the date range for which you want to rate. The date must be in `yyyy-mm-dd` format. For example, 2007-12-03.   You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameter:  - If you only specify the `fromDate` query parameter but do not specify the `toDate` query parameter:      `endDate` > `fromDate`        - If you specify both the `fromDate` and `toDate` query parameters:     `startDate` <= `toDate` and `endDate` > `fromDate`  `startDate` is the start date of the rating result. `endDate` is the end date of the rating result. 
  to_date: Date.parse('2013-10-20'), # Date | The end date of the date range for which you want to rate. The date must be in `yyyy-mm-dd` format. For example, 2007-12-03.  You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameters: - If you only specify the `toDate` query parameter but do not specify the `fromDate` query parameter:       `startDate` <= `toDate`       - If you specify both the `fromDate` and `toDate` query parameters:       `startDate` <= `toDate` and `endDate` > `fromDate`  `startDate` is the start date of the rating result. `endDate` is the end date of the rating result. 
  cursor: 'cursor_example', # String | The cursor indicator of the data page you want to retrieve. By default, the first page of data is returned in the response. If more data pages are available, the operation returns `true` in the `hasMore` response body field. The `cursor` response body field specifies the cursor indicator of the next page of data. If there is no data after the current page, the value of `cursor` is `null`. 
  page_size: 100 # Integer | The maximum number of rows in a page to return in a response.  
}

begin
  #Get rating results by account
  result = api_instance.g_et_rating_results_by_account(authorization, account_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_rating_results_by_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **account_number** | **String**| The account number. For example, A00000001.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 
 **from_date** | **Date**| The start date of the date range for which you want to rate. The date must be in &#x60;yyyy-mm-dd&#x60; format. For example, 2007-12-03.   You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameter:  - If you only specify the &#x60;fromDate&#x60; query parameter but do not specify the &#x60;toDate&#x60; query parameter:      &#x60;endDate&#x60; &gt; &#x60;fromDate&#x60;        - If you specify both the &#x60;fromDate&#x60; and &#x60;toDate&#x60; query parameters:     &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60; and &#x60;endDate&#x60; &gt; &#x60;fromDate&#x60;  &#x60;startDate&#x60; is the start date of the rating result. &#x60;endDate&#x60; is the end date of the rating result.  | [optional] 
 **to_date** | **Date**| The end date of the date range for which you want to rate. The date must be in &#x60;yyyy-mm-dd&#x60; format. For example, 2007-12-03.  You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameters: - If you only specify the &#x60;toDate&#x60; query parameter but do not specify the &#x60;fromDate&#x60; query parameter:       &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60;       - If you specify both the &#x60;fromDate&#x60; and &#x60;toDate&#x60; query parameters:       &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60; and &#x60;endDate&#x60; &gt; &#x60;fromDate&#x60;  &#x60;startDate&#x60; is the start date of the rating result. &#x60;endDate&#x60; is the end date of the rating result.  | [optional] 
 **cursor** | **String**| The cursor indicator of the data page you want to retrieve. By default, the first page of data is returned in the response. If more data pages are available, the operation returns &#x60;true&#x60; in the &#x60;hasMore&#x60; response body field. The &#x60;cursor&#x60; response body field specifies the cursor indicator of the next page of data. If there is no data after the current page, the value of &#x60;cursor&#x60; is &#x60;null&#x60;.  | [optional] 
 **page_size** | **Integer**| The maximum number of rows in a page to return in a response.   | [optional] [default to 100]

### Return type

[**GetRatedResultsType**](GetRatedResultsType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_rating_results_by_charge**
> GetRatedResultsType g_et_rating_results_by_charge(authorization, charge_number, opts)

Get rating results by charge

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the rating result of all the usage charges associated with the specified rate plan charge. The rating is based on billing period.  You can specify the date range for which you want to rate in the `fromDate` and `toDate` query parameters. For example: /rated-results/charge/*chargenNumber*?fromDate=2016-08-01&toDate=2016-08-21 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

charge_number = 'charge_number_example' # String | The charge number. For example, C-00000001. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
  from_date: Date.parse('2013-10-20'), # Date | The start date of the date range for which you want to rate. The date must be in `yyyy-mm-dd` format. For example, 2007-12-03.   You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameter:  - If you only specify the `fromDate` query parameter but do not specify the `toDate` query parameter:      `endDate` > `fromDate`        - If you specify both the `fromDate` and `toDate` query parameters:     `startDate` <= `toDate` and `endDate` > `fromDate`  `startDate` is the start date of the rating result. `endDate` is the end date of the rating result. 
  to_date: Date.parse('2013-10-20'), # Date | The end date of the date range for which you want to rate. The date must be in `yyyy-mm-dd` format. For example, 2007-12-03.  Make sure you specify a valid date in this query parameters: - If you only specify the `toDate` query parameter but do not specify the `fromDate` query parameter:       `startDate` <= `toDate`       - If you specify both the `fromDate` and `toDate` query parameters:       `startDate` <= `toDate` and `endDate` > `fromDate`  `startDate` is the start date of the rating result. `endDate` is the end date of the rating result. 
  cursor: 'cursor_example', # String | The cursor indicator of the data page you want to retrieve. By default, the first page of data is returned in the response. If more data pages are available, the operation returns `true` in the `hasMore` response body field. The `cursor` response body field specifies the cursor indicator of the next page of data. If there is no data after the current page, the value of `cursor` is `null`. 
  page_size: 100 # Integer | The maximum number of rows in a page to return in a response.  
}

begin
  #Get rating results by charge
  result = api_instance.g_et_rating_results_by_charge(authorization, charge_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_rating_results_by_charge: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **charge_number** | **String**| The charge number. For example, C-00000001.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 
 **from_date** | **Date**| The start date of the date range for which you want to rate. The date must be in &#x60;yyyy-mm-dd&#x60; format. For example, 2007-12-03.   You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameter:  - If you only specify the &#x60;fromDate&#x60; query parameter but do not specify the &#x60;toDate&#x60; query parameter:      &#x60;endDate&#x60; &gt; &#x60;fromDate&#x60;        - If you specify both the &#x60;fromDate&#x60; and &#x60;toDate&#x60; query parameters:     &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60; and &#x60;endDate&#x60; &gt; &#x60;fromDate&#x60;  &#x60;startDate&#x60; is the start date of the rating result. &#x60;endDate&#x60; is the end date of the rating result.  | [optional] 
 **to_date** | **Date**| The end date of the date range for which you want to rate. The date must be in &#x60;yyyy-mm-dd&#x60; format. For example, 2007-12-03.  Make sure you specify a valid date in this query parameters: - If you only specify the &#x60;toDate&#x60; query parameter but do not specify the &#x60;fromDate&#x60; query parameter:       &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60;       - If you specify both the &#x60;fromDate&#x60; and &#x60;toDate&#x60; query parameters:       &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60; and &#x60;endDate&#x60; &gt; &#x60;fromDate&#x60;  &#x60;startDate&#x60; is the start date of the rating result. &#x60;endDate&#x60; is the end date of the rating result.  | [optional] 
 **cursor** | **String**| The cursor indicator of the data page you want to retrieve. By default, the first page of data is returned in the response. If more data pages are available, the operation returns &#x60;true&#x60; in the &#x60;hasMore&#x60; response body field. The &#x60;cursor&#x60; response body field specifies the cursor indicator of the next page of data. If there is no data after the current page, the value of &#x60;cursor&#x60; is &#x60;null&#x60;.  | [optional] 
 **page_size** | **Integer**| The maximum number of rows in a page to return in a response.   | [optional] [default to 100]

### Return type

[**GetRatedResultsType**](GetRatedResultsType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_rating_results_by_subscripiton**
> GetRatedResultsType g_et_rating_results_by_subscripiton(authorization, subscription_number, opts)

Get rating results by subscription

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the rating result of all the usage charges associated with the specified subscription. The rating is based on billing period.   You can specify the date range for which you want to rate in the `fromDate` and `toDate` query parameters. For example: /rated-results/subscription/*subscriptionNumber*?fromDate=2016-08-01&toDate=2016-08-21 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

subscription_number = 'subscription_number_example' # String | The subscription number. For example, A-S00000001. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
  from_date: Date.parse('2013-10-20'), # Date | The start date of the date range for which you want to rate. The date must be in `yyyy-mm-dd` format. For example, 2007-12-03.    You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameter:  - If you only specify the `fromDate` query parameter but do not specify the `toDate` query parameter:      `endDate` > `fromDate`        - If you specify both the `fromDate` and `toDate` query parameters:     `startDate` <= `toDate` and `endDate` > `fromDate`  `startDate` is the start date of the rating result. `endDate` is the end date of the rating result. 
  to_date: Date.parse('2013-10-20'), # Date | The end date of the date range for which you want to rate. The date must be in `yyyy-mm-dd` format. For example, 2007-12-03.  Make sure you specify a valid date in this query parameters: - If you only specify the `toDate` query parameter but do not specify the `fromDate` query parameter:       `startDate` <= `toDate`       - If you specify both the `fromDate` and `toDate` query parameters:       `startDate` <= `toDate` and `endDate` > `fromDate`  `startDate` is the start date of the rating result. `endDate` is the end date of the rating result. 
  cursor: 'cursor_example', # String | The cursor indicator of the data page you want to retrieve. By default, the first page of data is returned in the response. If more data pages are available, the operation returns `true` in the `hasMore` response body field. The `cursor` response body field specifies the cursor indicator of the next page of data. If there is no data after the current page, the value of `cursor` is `null`. 
  page_size: 100 # Integer | The maximum number of rows in a page to return in a response.  
}

begin
  #Get rating results by subscription
  result = api_instance.g_et_rating_results_by_subscripiton(authorization, subscription_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_rating_results_by_subscripiton: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **subscription_number** | **String**| The subscription number. For example, A-S00000001.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 
 **from_date** | **Date**| The start date of the date range for which you want to rate. The date must be in &#x60;yyyy-mm-dd&#x60; format. For example, 2007-12-03.    You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameter:  - If you only specify the &#x60;fromDate&#x60; query parameter but do not specify the &#x60;toDate&#x60; query parameter:      &#x60;endDate&#x60; &gt; &#x60;fromDate&#x60;        - If you specify both the &#x60;fromDate&#x60; and &#x60;toDate&#x60; query parameters:     &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60; and &#x60;endDate&#x60; &gt; &#x60;fromDate&#x60;  &#x60;startDate&#x60; is the start date of the rating result. &#x60;endDate&#x60; is the end date of the rating result.  | [optional] 
 **to_date** | **Date**| The end date of the date range for which you want to rate. The date must be in &#x60;yyyy-mm-dd&#x60; format. For example, 2007-12-03.  Make sure you specify a valid date in this query parameters: - If you only specify the &#x60;toDate&#x60; query parameter but do not specify the &#x60;fromDate&#x60; query parameter:       &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60;       - If you specify both the &#x60;fromDate&#x60; and &#x60;toDate&#x60; query parameters:       &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60; and &#x60;endDate&#x60; &gt; &#x60;fromDate&#x60;  &#x60;startDate&#x60; is the start date of the rating result. &#x60;endDate&#x60; is the end date of the rating result.  | [optional] 
 **cursor** | **String**| The cursor indicator of the data page you want to retrieve. By default, the first page of data is returned in the response. If more data pages are available, the operation returns &#x60;true&#x60; in the &#x60;hasMore&#x60; response body field. The &#x60;cursor&#x60; response body field specifies the cursor indicator of the next page of data. If there is no data after the current page, the value of &#x60;cursor&#x60; is &#x60;null&#x60;.  | [optional] 
 **page_size** | **Integer**| The maximum number of rows in a page to return in a response.   | [optional] [default to 100]

### Return type

[**GetRatedResultsType**](GetRatedResultsType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_usage_import_details**
> GetUsageDetailResponseType g_et_usage_import_details(authorization, id, opts)

Get details of usage import

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the detailed information about a specified usage import file. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

id = 'id_example' # String | The ID of the usage import. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Get details of usage import
  result = api_instance.g_et_usage_import_details(authorization, id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_usage_import_details: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **id** | **String**| The ID of the usage import.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

[**GetUsageDetailResponseType**](GetUsageDetailResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_usage_import_status**
> GETUsageImportStatusResponseType g_et_usage_import_status(authorization, id, opts)

Get status of usage import

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the processing status of a specified usage import file. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

id = 'id_example' # String | The ID of the usage import. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Get status of usage import
  result = api_instance.g_et_usage_import_status(authorization, id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_usage_import_status: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **id** | **String**| The ID of the usage import.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

[**GETUsageImportStatusResponseType**](GETUsageImportStatusResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_usage_imports**
> UsageImports g_et_usage_imports(authorization, , opts)

Get usage imports

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the information about all the usage import files, such as the processing status of the usage import files, the total number of usage records that are validated, and the number of usage records with validation errors.   The response is in descending order by the date and time of the `updatedOn` field.  

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
  page: 0, # Integer | The index number of the page you want to retrieve. By default, the first page is returned in the response.  
  page_size: 100 # Integer | The maximum number of rows in a page to return in a response.  
}

begin
  #Get usage imports
  result = api_instance.g_et_usage_imports(authorization, , opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_usage_imports: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 
 **page** | **Integer**| The index number of the page you want to retrieve. By default, the first page is returned in the response.   | [optional] [default to 0]
 **page_size** | **Integer**| The maximum number of rows in a page to return in a response.   | [optional] [default to 100]

### Return type

[**UsageImports**](UsageImports.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_usage_rating_by_account**
> GetRatedUsageResultsType g_et_usage_rating_by_account(authorization, account_number, opts)

Get usage rating by account

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the rating result of the usage records associated with the specified customer account. The response returns the rating result of each usage record.  You can specify the date range for which you want to get the usage rating result in the `fromDate` and `toDate` query parameters. For example: /rated-usages/account/*accountNumber*?fromDate=2016-08-01&toDate=2016-08-21 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

account_number = 'account_number_example' # String | The account number. For example, A00000001. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
  from_date: Date.parse('2013-10-20'), # Date | The start date of the date range for which you want to get the rating result. The date must be in `yyyy-mm-dd` format. For example, 2007-12-03.  You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameter:  - If you only specify the `fromDate` query parameter but do not specify the `toDate` query parameter:      `startDate` >= `fromDate`       - If you specify both the `fromDate` and `toDate` parameters:     `startDate` >= `fromDate` and `startDate` <= `toDate`  `startDate` is the start date when the usage is consumed in your tenant time zone. 
  to_date: Date.parse('2013-10-20'), # Date | The end date of the date range for which you want to get the rating result. The date must be in `yyyy-mm-dd` format. For example, 2007-12-03.  Make sure you specify a valid date in this query parameters: - If you only specify the `toDate` query parameter but do not specify the `fromDate` query parameter:       `startDate` <= `toDate`       - If you specify both the `fromDate` and `toDate` query parameters:       `startDate` >= `fromDate` and `startDate` <= `toDate`  `startDate` is the start date when the usage is consumed in your tenant time zone. 
  cursor: 'cursor_example', # String | The cursor indicator of the data page you want to retrieve. By default, the first page of data is returned in the response. If more data pages are available, the operation returns `true` in the `hasMore` response body field. The `cursor` response body field specifies the cursor indicator of the next page of data. If there is no data after the current page, the value of `cursor` is `null`. 
  page_size: 100 # Integer | The maximum number of rows in a page to return in a response.  
}

begin
  #Get usage rating by account
  result = api_instance.g_et_usage_rating_by_account(authorization, account_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_usage_rating_by_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **account_number** | **String**| The account number. For example, A00000001.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 
 **from_date** | **Date**| The start date of the date range for which you want to get the rating result. The date must be in &#x60;yyyy-mm-dd&#x60; format. For example, 2007-12-03.  You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameter:  - If you only specify the &#x60;fromDate&#x60; query parameter but do not specify the &#x60;toDate&#x60; query parameter:      &#x60;startDate&#x60; &gt;&#x3D; &#x60;fromDate&#x60;       - If you specify both the &#x60;fromDate&#x60; and &#x60;toDate&#x60; parameters:     &#x60;startDate&#x60; &gt;&#x3D; &#x60;fromDate&#x60; and &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60;  &#x60;startDate&#x60; is the start date when the usage is consumed in your tenant time zone.  | [optional] 
 **to_date** | **Date**| The end date of the date range for which you want to get the rating result. The date must be in &#x60;yyyy-mm-dd&#x60; format. For example, 2007-12-03.  Make sure you specify a valid date in this query parameters: - If you only specify the &#x60;toDate&#x60; query parameter but do not specify the &#x60;fromDate&#x60; query parameter:       &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60;       - If you specify both the &#x60;fromDate&#x60; and &#x60;toDate&#x60; query parameters:       &#x60;startDate&#x60; &gt;&#x3D; &#x60;fromDate&#x60; and &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60;  &#x60;startDate&#x60; is the start date when the usage is consumed in your tenant time zone.  | [optional] 
 **cursor** | **String**| The cursor indicator of the data page you want to retrieve. By default, the first page of data is returned in the response. If more data pages are available, the operation returns &#x60;true&#x60; in the &#x60;hasMore&#x60; response body field. The &#x60;cursor&#x60; response body field specifies the cursor indicator of the next page of data. If there is no data after the current page, the value of &#x60;cursor&#x60; is &#x60;null&#x60;.  | [optional] 
 **page_size** | **Integer**| The maximum number of rows in a page to return in a response.   | [optional] [default to 100]

### Return type

[**GetRatedUsageResultsType**](GetRatedUsageResultsType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_usage_rating_by_charge**
> GetRatedUsageResultsType g_et_usage_rating_by_charge(authorization, charge_number, opts)

Get usage rating by charge

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the rating result of the usage records associated with the specified charge.  The response returns the rating result of each usage record.   You can specify the date range for which you want to get the rating result in the `fromDate` and `toDate` query parameters. For example: /rated-results/charge/*chargenNumber*?fromDate=2016-08-01&toDate=2016-08-21 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

charge_number = 'charge_number_example' # String | The charge number. For example, C-00000001. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
  from_date: Date.parse('2013-10-20'), # Date | The start date of the date range for which you want to get the rating result. The date must be in `yyyy-mm-dd` format. For example, 2007-12-03.  You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameter:  - If you only specify the `fromDate` query parameter but do not specify the `toDate` query parameter:      `startDate` >= `fromDate`       - If you specify both the `fromDate` and `toDate` parameters:     `startDate` >= `fromDate` and `startDate` <= `toDate`  `startDate` is the start date when the usage is consumed in your tenant time zone. 
  to_date: Date.parse('2013-10-20'), # Date | The end date of the date range for which you want to get the rating result. The date must be in `yyyy-mm-dd` format. For example, 2007-12-03.  Make sure you specify a valid date in this query parameters: - If you only specify the `toDate` query parameter but do not specify the `fromDate` query parameter:       `startDate` <= `toDate`       - If you specify both the `fromDate` and `toDate` query parameters:       `startDate` >= `fromDate` and `startDate` <= `toDate`  `startDate` is the start date when the usage is consumed in your tenant time zone. 
  cursor: 'cursor_example', # String | The cursor indicator of the data page you want to retrieve. By default, the first page of data is returned in the response. If more data pages are available, the operation returns `true` in the `hasMore` response body field. The `cursor` response body field specifies the cursor indicator of the next page of data. If there is no data after the current page, the value of `cursor` is `null`. 
  page_size: 100 # Integer | The maximum number of rows in a page to return in a response.  
}

begin
  #Get usage rating by charge
  result = api_instance.g_et_usage_rating_by_charge(authorization, charge_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_usage_rating_by_charge: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **charge_number** | **String**| The charge number. For example, C-00000001.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 
 **from_date** | **Date**| The start date of the date range for which you want to get the rating result. The date must be in &#x60;yyyy-mm-dd&#x60; format. For example, 2007-12-03.  You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameter:  - If you only specify the &#x60;fromDate&#x60; query parameter but do not specify the &#x60;toDate&#x60; query parameter:      &#x60;startDate&#x60; &gt;&#x3D; &#x60;fromDate&#x60;       - If you specify both the &#x60;fromDate&#x60; and &#x60;toDate&#x60; parameters:     &#x60;startDate&#x60; &gt;&#x3D; &#x60;fromDate&#x60; and &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60;  &#x60;startDate&#x60; is the start date when the usage is consumed in your tenant time zone.  | [optional] 
 **to_date** | **Date**| The end date of the date range for which you want to get the rating result. The date must be in &#x60;yyyy-mm-dd&#x60; format. For example, 2007-12-03.  Make sure you specify a valid date in this query parameters: - If you only specify the &#x60;toDate&#x60; query parameter but do not specify the &#x60;fromDate&#x60; query parameter:       &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60;       - If you specify both the &#x60;fromDate&#x60; and &#x60;toDate&#x60; query parameters:       &#x60;startDate&#x60; &gt;&#x3D; &#x60;fromDate&#x60; and &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60;  &#x60;startDate&#x60; is the start date when the usage is consumed in your tenant time zone.  | [optional] 
 **cursor** | **String**| The cursor indicator of the data page you want to retrieve. By default, the first page of data is returned in the response. If more data pages are available, the operation returns &#x60;true&#x60; in the &#x60;hasMore&#x60; response body field. The &#x60;cursor&#x60; response body field specifies the cursor indicator of the next page of data. If there is no data after the current page, the value of &#x60;cursor&#x60; is &#x60;null&#x60;.  | [optional] 
 **page_size** | **Integer**| The maximum number of rows in a page to return in a response.   | [optional] [default to 100]

### Return type

[**GetRatedUsageResultsType**](GetRatedUsageResultsType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_usage_rating_by_subscription**
> GetRatedUsageResultsType g_et_usage_rating_by_subscription(authorization, subscription_number, opts)

Get usage rating by subscription

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the rating result of the usage records associated with the specified subscription. The response returns the rating result of each usage record.   You can specify the date range for which you want to get the rating result in the `fromDate` and `toDate` query parameters. For example: /rated-results/subscription/*subscriptionNumber*?fromDate=2016-08-01&toDate=2016-08-21 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

subscription_number = 'subscription_number_example' # String | The subscription number. For example, A-S00000001. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
  from_date: Date.parse('2013-10-20'), # Date | The start date of the date range for which you want to get the rating result. The date must be in `yyyy-mm-dd` format. For example, 2007-12-03.  You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameter:  - If you only specify the `fromDate` query parameter but do not specify the `toDate` query parameter:      `startDate` >= `fromDate`       - If you specify both the `fromDate` and `toDate` parameters:     `startDate` >= `fromDate` and `startDate` <= `toDate`  `startDate` is the start date when the usage is consumed in your tenant time zone. 
  to_date: Date.parse('2013-10-20'), # Date | The end date of the date range for which you want to get the rating result. The date must be in `yyyy-mm-dd` format. For example, 2007-12-03.  Make sure you specify a valid date in this query parameters: - If you only specify the `toDate` query parameter but do not specify the `fromDate` query parameter:       `startDate` <= `toDate`    - If you specify both the `fromDate` and `toDate` query parameters:       `startDate` >= `fromDate` and `startDate` <= `toDate`  `startDate` is the start date when the usage is consumed in your tenant time zone. 
  cursor: 'cursor_example', # String | The cursor indicator of the data page you want to retrieve. By default, the first page of data is returned in the response. If more data pages are available, the operation returns `true` in the `hasMore` response body field. The `cursor` response body field specifies the cursor indicator of the next page of data. If there is no data after the current page, the value of `cursor` is `null`. 
  page_size: 100 # Integer | The maximum number of rows in a page to return in a response.  
}

begin
  #Get usage rating by subscription
  result = api_instance.g_et_usage_rating_by_subscription(authorization, subscription_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_usage_rating_by_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **subscription_number** | **String**| The subscription number. For example, A-S00000001.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 
 **from_date** | **Date**| The start date of the date range for which you want to get the rating result. The date must be in &#x60;yyyy-mm-dd&#x60; format. For example, 2007-12-03.  You can specify this parameter to restrict the data returned in the response. Make sure you specify a valid date in this query parameter:  - If you only specify the &#x60;fromDate&#x60; query parameter but do not specify the &#x60;toDate&#x60; query parameter:      &#x60;startDate&#x60; &gt;&#x3D; &#x60;fromDate&#x60;       - If you specify both the &#x60;fromDate&#x60; and &#x60;toDate&#x60; parameters:     &#x60;startDate&#x60; &gt;&#x3D; &#x60;fromDate&#x60; and &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60;  &#x60;startDate&#x60; is the start date when the usage is consumed in your tenant time zone.  | [optional] 
 **to_date** | **Date**| The end date of the date range for which you want to get the rating result. The date must be in &#x60;yyyy-mm-dd&#x60; format. For example, 2007-12-03.  Make sure you specify a valid date in this query parameters: - If you only specify the &#x60;toDate&#x60; query parameter but do not specify the &#x60;fromDate&#x60; query parameter:       &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60;    - If you specify both the &#x60;fromDate&#x60; and &#x60;toDate&#x60; query parameters:       &#x60;startDate&#x60; &gt;&#x3D; &#x60;fromDate&#x60; and &#x60;startDate&#x60; &lt;&#x3D; &#x60;toDate&#x60;  &#x60;startDate&#x60; is the start date when the usage is consumed in your tenant time zone.  | [optional] 
 **cursor** | **String**| The cursor indicator of the data page you want to retrieve. By default, the first page of data is returned in the response. If more data pages are available, the operation returns &#x60;true&#x60; in the &#x60;hasMore&#x60; response body field. The &#x60;cursor&#x60; response body field specifies the cursor indicator of the next page of data. If there is no data after the current page, the value of &#x60;cursor&#x60; is &#x60;null&#x60;.  | [optional] 
 **page_size** | **Integer**| The maximum number of rows in a page to return in a response.   | [optional] [default to 100]

### Return type

[**GetRatedUsageResultsType**](GetRatedUsageResultsType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_usage_record**
> GETUsageResponseType g_et_usage_record(authorization, id, opts)

Get usage record

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves information about a specific usage record. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

id = 'id_example' # String | The ID of the usage record you want to retrieve.  

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Get usage record
  result = api_instance.g_et_usage_record(authorization, id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_usage_record: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **id** | **String**| The ID of the usage record you want to retrieve.   | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

[**GETUsageResponseType**](GETUsageResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_usage_records_query**
> QueryUsageResponseType g_et_usage_records_query(authorization, , opts)

Query usage records

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves information about usage records.   You can specify certain response fields you want to retrieve by specifying the `fields` and `filters` query parameters. By default, all the response fields are returned in the response. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
  fields: 'fields_example', # String | The fields of the usage records you want to retrieve. By default, all the fields in the **Responses** section are returned.  Use commas to separate the field names. You can specify any fields described in the **Responses** section. For example: `/usage/query?fields=tag,quantity,id` 
  filters: 'filters_example', # String | This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.  A single filter uses the following form:   *field_name* *operator* *field_value*  Supported operators: `=`, `!=`, `>`, `<`, `>=`, `<=`, `IS NULL`, `IS NOT NULL`, `IN` (The letters are not case sensitive.)  You can specify any fields except for the custom fields described in the **Responses** section. Filters can be combined using the `AND` boolean logic. For example: *field_name* *operator* *field_value* AND *field_name* *operator* *field_value*  Currently, the fields in filters must include at least one of the following fields: `accountNumber`, `unitOfMeasure`, `status`, `uniqueKey`, and `updatedOn`.   Examples:  - /usage/query?filters= (id ='035e35bd-880a-47c9-99df-830143b13aed' AND status='Pending')  - /usage/query?fields=tag,id&filters= (quantity > 10 AND unitOfMeasure = 'GB')  - /usage/query?filters=(status in ('Pending','Rated')) 
  page: 0, # Integer | The index number of the page you want to retrieve. By default, the first page is returned in the response.  
  page_size: 100 # Integer | The maximum number of rows in a page to return in a response.  
}

begin
  #Query usage records
  result = api_instance.g_et_usage_records_query(authorization, , opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_usage_records_query: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 
 **fields** | **String**| The fields of the usage records you want to retrieve. By default, all the fields in the **Responses** section are returned.  Use commas to separate the field names. You can specify any fields described in the **Responses** section. For example: &#x60;/usage/query?fields&#x3D;tag,quantity,id&#x60;  | [optional] 
 **filters** | **String**| This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.  A single filter uses the following form:   *field_name* *operator* *field_value*  Supported operators: &#x60;&#x3D;&#x60;, &#x60;!&#x3D;&#x60;, &#x60;&gt;&#x60;, &#x60;&lt;&#x60;, &#x60;&gt;&#x3D;&#x60;, &#x60;&lt;&#x3D;&#x60;, &#x60;IS NULL&#x60;, &#x60;IS NOT NULL&#x60;, &#x60;IN&#x60; (The letters are not case sensitive.)  You can specify any fields except for the custom fields described in the **Responses** section. Filters can be combined using the &#x60;AND&#x60; boolean logic. For example: *field_name* *operator* *field_value* AND *field_name* *operator* *field_value*  Currently, the fields in filters must include at least one of the following fields: &#x60;accountNumber&#x60;, &#x60;unitOfMeasure&#x60;, &#x60;status&#x60;, &#x60;uniqueKey&#x60;, and &#x60;updatedOn&#x60;.   Examples:  - /usage/query?filters&#x3D; (id &#x3D;&#39;035e35bd-880a-47c9-99df-830143b13aed&#39; AND status&#x3D;&#39;Pending&#39;)  - /usage/query?fields&#x3D;tag,id&amp;filters&#x3D; (quantity &gt; 10 AND unitOfMeasure &#x3D; &#39;GB&#39;)  - /usage/query?filters&#x3D;(status in (&#39;Pending&#39;,&#39;Rated&#39;))  | [optional] 
 **page** | **Integer**| The index number of the page you want to retrieve. By default, the first page is returned in the response.   | [optional] [default to 0]
 **page_size** | **Integer**| The maximum number of rows in a page to return in a response.   | [optional] [default to 100]

### Return type

[**QueryUsageResponseType**](QueryUsageResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_usage_records_stream_query**
> QueryUsageResponseType g_et_usage_records_stream_query(authorization, , opts)

Query usage records in stream

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves information about usage records in a stream without pagination.   You can specify certain response fields you want to retrieve by sepcifying the `fields` and `filters` query parameters. By default, all the reponse fields are returned in the response. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
  fields: 'fields_example', # String | The fields of the usage records you want to retrieve. By default, all the fields in the **Responses** section are returned.  Use commas to separate the field names. You can specify any fields described in the **Responses** section. For example: `/usage/stream-query?fields=tag,quantity,id,customFields.age` 
  filters: 'filters_example' # String | This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.  A single filter uses the following form:   *field_name* *operator* *field_value*  Supported operators: `=`, `!=`, `>`, `<`, `>=`, `<=`, `IS NULL`, `IS NOT NULL`, `IN` (The letters are not case sensitive.)  You can specify any fields, including the custom fields, described in the **Responses** section. Filters can be combined using the `AND` boolean logic. For example: *field_name* *operator* *field_value* AND *field_name* *operator* *field_value*  Currently, the fields in filters must include at least one of the following fields: `accountNumber`, `unitOfMeasure`, `status`, `uniqueKey`, and `updatedOn`.   Examples:  - /usage/stream-query?filters= (id ='035e35bd-880a-47c9-99df-830143b13aed' AND status='Pending' AND customFields.age=20)  - /usage/stream-query?fields=tag,id&filters= (quantity > 10 AND unitOfMeasure = 'GB')  - /usage/stream-query?filters=(status in ('Pending','Rated')) 
}

begin
  #Query usage records in stream
  result = api_instance.g_et_usage_records_stream_query(authorization, , opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->g_et_usage_records_stream_query: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 
 **fields** | **String**| The fields of the usage records you want to retrieve. By default, all the fields in the **Responses** section are returned.  Use commas to separate the field names. You can specify any fields described in the **Responses** section. For example: &#x60;/usage/stream-query?fields&#x3D;tag,quantity,id,customFields.age&#x60;  | [optional] 
 **filters** | **String**| This parameter restricts the data returned in the response. You can use this parameter to supply a dimension you want to filter on.  A single filter uses the following form:   *field_name* *operator* *field_value*  Supported operators: &#x60;&#x3D;&#x60;, &#x60;!&#x3D;&#x60;, &#x60;&gt;&#x60;, &#x60;&lt;&#x60;, &#x60;&gt;&#x3D;&#x60;, &#x60;&lt;&#x3D;&#x60;, &#x60;IS NULL&#x60;, &#x60;IS NOT NULL&#x60;, &#x60;IN&#x60; (The letters are not case sensitive.)  You can specify any fields, including the custom fields, described in the **Responses** section. Filters can be combined using the &#x60;AND&#x60; boolean logic. For example: *field_name* *operator* *field_value* AND *field_name* *operator* *field_value*  Currently, the fields in filters must include at least one of the following fields: &#x60;accountNumber&#x60;, &#x60;unitOfMeasure&#x60;, &#x60;status&#x60;, &#x60;uniqueKey&#x60;, and &#x60;updatedOn&#x60;.   Examples:  - /usage/stream-query?filters&#x3D; (id &#x3D;&#39;035e35bd-880a-47c9-99df-830143b13aed&#39; AND status&#x3D;&#39;Pending&#39; AND customFields.age&#x3D;20)  - /usage/stream-query?fields&#x3D;tag,id&amp;filters&#x3D; (quantity &gt; 10 AND unitOfMeasure &#x3D; &#39;GB&#39;)  - /usage/stream-query?filters&#x3D;(status in (&#39;Pending&#39;,&#39;Rated&#39;))  | [optional] 

### Return type

[**QueryUsageResponseType**](QueryUsageResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_import_usage_file**
> POSTUsageImportResponseType p_ost_import_usage_file(authorization, file, opts)

Import usage file

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Imports usage data by uploading a usage file in CSV or ZIP format.   The maximum size of a usage file in CSV or ZIP format to be uploaded is 20 MB. If the size of a usage file exceeds 20 MB, zip the usage file before uploading it. One ZIP file can only contain one CSV file.   For more information about the usage file format, see [Usage Data Import](https://knowledgecenter.zuora.com/CB_Billing/J_Billing_Operations/Real-Time_Usage_Rating/Usage_Data_Import). 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

file = File.new('/path/to/file.txt') # File | The path and name of the usage file to be imported. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
  description: 'description_example' # String | The description of the usage file to be imported. 
}

begin
  #Import usage file
  result = api_instance.p_ost_import_usage_file(authorization, file, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->p_ost_import_usage_file: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **file** | **File**| The path and name of the usage file to be imported.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 
 **description** | **String**| The description of the usage file to be imported.  | [optional] 

### Return type

[**POSTUsageImportResponseType**](POSTUsageImportResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json; charset=utf-8



# **p_ost_usage_records**
> POSTUsageRecordResponseType p_ost_usage_records(authorization, content_type, body, opts)

Create usage records

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Creates a single or multiple usage records. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

content_type = 'content_type_example' # String | The type of the request content.   - If you create multiple usage records, you must specify the value of this parameter to `application/vnd.zuora.usage-bulk+json`.    - If you create a single usage record, you do not need to specify this field. 

body = Zuora::POSTUsageRecordRequestType.new # POSTUsageRecordRequestType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Create usage records
  result = api_instance.p_ost_usage_records(authorization, content_type, body, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->p_ost_usage_records: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **content_type** | **String**| The type of the request content.   - If you create multiple usage records, you must specify the value of this parameter to &#x60;application/vnd.zuora.usage-bulk+json&#x60;.    - If you create a single usage record, you do not need to specify this field.  | 
 **body** | [**POSTUsageRecordRequestType**](POSTUsageRecordRequestType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

[**POSTUsageRecordResponseType**](POSTUsageRecordResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/vnd.zuora.usage-bulk+json;charset=UTF-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_usage_record**
> PUTUpdateUsageResponseType p_ut_usage_record(authorization, id, body, opts)

Update usage record

**Note:** The Real-Time Usage Rating feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Updates certain information of a specified usage record. Note that you can only update usage records that are not billed. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::UsageWithRealTimeRatingApi.new

authorization = 'authorization_example' # String | `Bearer {token}` for a valid OAuth token. 

id = 'id_example' # String | The ID of the usage record you want to update.  

body = Zuora::PUTUsageType.new # PUTUsageType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  zuora_request_id: 'zuora_request_id_example', # String | A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers. 
}

begin
  #Update usage record
  result = api_instance.p_ut_usage_record(authorization, id, body, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling UsageWithRealTimeRatingApi->p_ut_usage_record: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| &#x60;Bearer {token}&#x60; for a valid OAuth token.  | 
 **id** | **String**| The ID of the usage record you want to update.   | 
 **body** | [**PUTUsageType**](PUTUsageType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **zuora_request_id** | **String**| A request ID for tracking the API call. If you specify a value for this header, Zuora returns the same value in the response headers. If you do not specify a value for this header, Zuora provides a request ID in the response headers.  | [optional] 

### Return type

[**PUTUpdateUsageResponseType**](PUTUpdateUsageResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



