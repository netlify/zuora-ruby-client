# Zuora::QuotesDocumentApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**p_ost_quotes_document**](QuotesDocumentApi.md#p_ost_quotes_document) | **POST** /v1/quotes/document | Generate quotes document


# **p_ost_quotes_document**
> POSTQuoteDocResponseType p_ost_quotes_document(request, opts)

Generate quotes document

The `document` call generates a quote document and returns the generated document URL. You can directly access the generated quote file through the returned URL.  The `document` call should be only used from Zuora Quotes.   ## File Size Limitation  The maximum export file size is 2047MB. If you have large data requests that go over this limit, you will get the following 403 HTTP response code from Zuora: `security:max-object-size>2047MB</security:max-object-size>`  Submit a request at [Zuora Global Support](http://support.zuora.com/) if you require additional assistance.  We can work with you to determine if large file optimization is an option for you. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::QuotesDocumentApi.new

request = Zuora::POSTQuoteDocType.new # POSTQuoteDocType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Generate quotes document
  result = api_instance.p_ost_quotes_document(request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling QuotesDocumentApi->p_ost_quotes_document: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTQuoteDocType**](POSTQuoteDocType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**POSTQuoteDocResponseType**](POSTQuoteDocResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



