# SwaggerClient::QuotesDocumentApi

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
require 'swagger_client'

api_instance = SwaggerClient::QuotesDocumentApi.new

request = SwaggerClient::POSTQuoteDocType.new # POSTQuoteDocType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Generate quotes document
  result = api_instance.p_ost_quotes_document(request, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling QuotesDocumentApi->p_ost_quotes_document: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**POSTQuoteDocType**](POSTQuoteDocType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**POSTQuoteDocResponseType**](POSTQuoteDocResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



