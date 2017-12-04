# SwaggerClient::SummaryJournalEntriesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**d_elete_summary_journal_entry**](SummaryJournalEntriesApi.md#d_elete_summary_journal_entry) | **DELETE** /v1/journal-entries/{je-number} | Delete summary journal entry
[**g_et_all_summary_journal_entries**](SummaryJournalEntriesApi.md#g_et_all_summary_journal_entries) | **GET** /v1/journal-entries/journal-runs/{jr-number} | Get all summary journal entries in a journal run
[**g_et_summary_journal_entry**](SummaryJournalEntriesApi.md#g_et_summary_journal_entry) | **GET** /v1/journal-entries/{je-number} | Get summary journal entry
[**p_ost_summary_journal_entry**](SummaryJournalEntriesApi.md#p_ost_summary_journal_entry) | **POST** /v1/journal-entries | Create summary journal entry
[**p_ut_basic_summary_journal_entry**](SummaryJournalEntriesApi.md#p_ut_basic_summary_journal_entry) | **PUT** /v1/journal-entries/{je-number}/basic-information | Update basic information of a summary journal entry
[**p_ut_summary_journal_entry**](SummaryJournalEntriesApi.md#p_ut_summary_journal_entry) | **PUT** /v1/journal-entries/{je-number}/cancel | Cancel summary journal entry


# **d_elete_summary_journal_entry**
> CommonResponseType d_elete_summary_journal_entry(je_number, opts)

Delete summary journal entry

This reference describes how to delete a summary journal entry using the REST API.  You must have the \"Delete Cancelled Journal Entry\" user permission enabled to delete summary journal entries.  A summary journal entry must be canceled before it can be deleted. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SummaryJournalEntriesApi.new

je_number = "je_number_example" # String | Journal entry number in the format JE-00000001.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Delete summary journal entry
  result = api_instance.d_elete_summary_journal_entry(je_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SummaryJournalEntriesApi->d_elete_summary_journal_entry: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **je_number** | **String**| Journal entry number in the format JE-00000001. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_all_summary_journal_entries**
> GETJournalEntriesInJournalRunType g_et_all_summary_journal_entries(jr_number, opts)

Get all summary journal entries in a journal run

 This REST API reference describes how to retrieve information about all summary journal entries in a journal run. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SummaryJournalEntriesApi.new

jr_number = "jr_number_example" # String | Journal run number.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 8 # Integer | Number of rows returned per page. 
}

begin
  #Get all summary journal entries in a journal run
  result = api_instance.g_et_all_summary_journal_entries(jr_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SummaryJournalEntriesApi->g_et_all_summary_journal_entries: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **jr_number** | **String**| Journal run number. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 8]

### Return type

[**GETJournalEntriesInJournalRunType**](GETJournalEntriesInJournalRunType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_summary_journal_entry**
> GETJournalEntryDetailType g_et_summary_journal_entry(je_number, opts)

Get summary journal entry

This REST API reference describes how to get information about a summary journal entry by its journal entry number. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SummaryJournalEntriesApi.new

je_number = "je_number_example" # String | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get summary journal entry
  result = api_instance.g_et_summary_journal_entry(je_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SummaryJournalEntriesApi->g_et_summary_journal_entry: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **je_number** | **String**|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETJournalEntryDetailType**](GETJournalEntryDetailType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_summary_journal_entry**
> POSTJournalEntryResponseType p_ost_summary_journal_entry(request, opts)

Create summary journal entry

This REST API reference describes how to manually create a summary journal entry. Request and response field descriptions and sample code are provided. ## Requirements 1.The sum of debits must equal the sum of credits in the summary journal entry.  2.The following applies only if you use foreign currency conversion:   * If you have configured Aggregate transactions with different currencies during a Journal Run to \"Yes\", the value of the **currency** field must be the same as your tenant's home currency. That is, you must create journal entries using your home currency.   * All journal entries in an accounting period must either all be aggregated or all be unaggregated. You cannot have a mix of aggregated and unaggregated journal entries in the same accounting period. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SummaryJournalEntriesApi.new

request = SwaggerClient::POSTJournalEntryType.new # POSTJournalEntryType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create summary journal entry
  result = api_instance.p_ost_summary_journal_entry(request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SummaryJournalEntriesApi->p_ost_summary_journal_entry: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTJournalEntryType**](POSTJournalEntryType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**POSTJournalEntryResponseType**](POSTJournalEntryResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_basic_summary_journal_entry**
> CommonResponseType p_ut_basic_summary_journal_entry(je_number, request, opts)

Update basic information of a summary journal entry

 This REST API reference describes how to update the basic information of a summary journal entry. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SummaryJournalEntriesApi.new

je_number = "je_number_example" # String | Journal entry number in the format JE-00000001.

request = SwaggerClient::PUTBasicSummaryJournalEntryType.new # PUTBasicSummaryJournalEntryType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Update basic information of a summary journal entry
  result = api_instance.p_ut_basic_summary_journal_entry(je_number, request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SummaryJournalEntriesApi->p_ut_basic_summary_journal_entry: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **je_number** | **String**| Journal entry number in the format JE-00000001. | 
 **request** | [**PUTBasicSummaryJournalEntryType**](PUTBasicSummaryJournalEntryType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_summary_journal_entry**
> CommonResponseType p_ut_summary_journal_entry(je_number, opts)

Cancel summary journal entry

 This reference describes how to cancel a summary journal entry using the REST API.  You must have the \"Cancel Journal Entry\" user permission enabled to cancel summary journal entries.  A summary journal entry cannot be canceled if its Transferred to Accounting status is \"Yes\" or \"Processing\". 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::SummaryJournalEntriesApi.new

je_number = "je_number_example" # String | Journal entry number in the format JE-00000001.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Cancel summary journal entry
  result = api_instance.p_ut_summary_journal_entry(je_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling SummaryJournalEntriesApi->p_ut_summary_journal_entry: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **je_number** | **String**| Journal entry number in the format JE-00000001. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



