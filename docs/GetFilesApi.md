# Zuora::GetFilesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**g_et_files**](GetFilesApi.md#g_et_files) | **GET** /v1/files/{file-id} | Get files


# **g_et_files**
> g_et_files(file_id, opts)

Get files

Retrieve a file by specifying its file ID. You can retrieve accounting period reports, such as the Revenue Detail report, as well as other files such as invoice PDFs.  ## Example  ```curl curl -i -k -H \"apiAccessKeyId:$USER_NAME\" -H \"apiSecretAccessKey:$PASSWORD\" -H \"Accept:application/pdf\" -X GET https://rest.zuora.com/v1/files/2c92c08c55534cf00155581fb474314d -o /Users/jsmith/Downloads/invoiceFile1.pdf ``` The invoice PDF is downloaded to /Users/jsmith/Downloads and named invoiceFile1.pdf.  ## File Size Limitation The maximum export file size is 2047MB. If you have large data requests that go over this limit, you will get the following 403 HTTP response code from Zuora.  `<security:max-object-size>2047MB</security:max-object-size>`  Submit a request at [Zuora Global Support](https://zuora.zendesk.com/agent/) if you require additional assistance.  We can work with you to determine if large file optimization is an option for you. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::GetFilesApi.new

file_id = 'file_id_example' # String | The Zuora ID of the file you want to retrieve. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get files
  api_instance.g_et_files(file_id, opts)
rescue Zuora::ApiError => e
  puts "Exception when calling GetFilesApi->g_et_files: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file_id** | **String**| The Zuora ID of the file you want to retrieve.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



