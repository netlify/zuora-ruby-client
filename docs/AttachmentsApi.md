# Zuora::AttachmentsApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_attachments**](AttachmentsApi.md#delete_attachments) | **DELETE** /v1/attachments/{attachment-id} | Delete attachments
[**get_attachments**](AttachmentsApi.md#get_attachments) | **GET** /v1/attachments/{attachment-id} | View attachments
[**get_attachments_list**](AttachmentsApi.md#get_attachments_list) | **GET** /v1/attachments/{object-type}/{object-key} | View attachments list
[**post_attachments**](AttachmentsApi.md#post_attachments) | **POST** /v1/attachments | Add attachments
[**put_attachments**](AttachmentsApi.md#put_attachments) | **PUT** /v1/attachments/{attachment-id} | Edit attachments


# **delete_attachments**
> CommonResponseType delete_attachments(attachment_id, opts)

Delete attachments

Use the Delete Attachment REST request to delete an attachment from a Zuora object.

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AttachmentsApi.new

attachment_id = "attachment_id_example" # String | Id of the attachment to be deleted.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Delete attachments
  result = api_instance.delete_attachments(attachment_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AttachmentsApi->delete_attachments: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **attachment_id** | **String**| Id of the attachment to be deleted. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_attachments**
> GETAttachmentResponseType get_attachments(attachment_id, opts)

View attachments

Use the View Attachment REST request to retrieve information about an attachment document.

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AttachmentsApi.new

attachment_id = "attachment_id_example" # String | Id of the attachment you want to view.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #View attachments
  result = api_instance.get_attachments(attachment_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AttachmentsApi->get_attachments: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **attachment_id** | **String**| Id of the attachment you want to view. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETAttachmentResponseType**](GETAttachmentResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_attachments_list**
> GETAttachmentsResponseType get_attachments_list(object_type, object_key, opts)

View attachments list

Use the View Attachment REST request to get a list of attachments on an account, an invoice, or a subscription.

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AttachmentsApi.new

object_type = "object_type_example" # String | The type of object to list attachements for. 

object_key = "object_key_example" # String | ID of the object to list attachements for.  - If `object-type` is `account`, specify an account ID.  - If `object-type` is `invoice`, specify an invoice ID.  - If `object-type` is `subscription`, specify a subscription number. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 20 # Integer | Number of rows returned per page. 
}

begin
  #View attachments list
  result = api_instance.get_attachments_list(object_type, object_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AttachmentsApi->get_attachments_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **object_type** | **String**| The type of object to list attachements for.  | 
 **object_key** | **String**| ID of the object to list attachements for.  - If &#x60;object-type&#x60; is &#x60;account&#x60;, specify an account ID.  - If &#x60;object-type&#x60; is &#x60;invoice&#x60;, specify an invoice ID.  - If &#x60;object-type&#x60; is &#x60;subscription&#x60;, specify a subscription number.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]

### Return type

[**GETAttachmentsResponseType**](GETAttachmentsResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_attachments**
> POSTAttachmentResponseType post_attachments(associated_object_type, associated_object_key, request, opts)

Add attachments

Use the Add Attachment REST request with a multipart/form-data to attach a document file to an Account, a Subscription, or an Invoice.

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AttachmentsApi.new

associated_object_type = "associated_object_type_example" # String | Specify one of the following values: Account, Subscription, or Invoice. 

associated_object_key = "associated_object_key_example" # String | For the Subscription type, specify the Subscription Number. An attachment is tied to the Subscription Number and thus viewable with every subscription version.  For Account and Invoice, specify the id. 

request = Zuora::POSTAttachmentType.new # POSTAttachmentType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  description: "description_example" # String | Description of the attachment document. 
}

begin
  #Add attachments
  result = api_instance.post_attachments(associated_object_type, associated_object_key, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AttachmentsApi->post_attachments: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **associated_object_type** | **String**| Specify one of the following values: Account, Subscription, or Invoice.  | 
 **associated_object_key** | **String**| For the Subscription type, specify the Subscription Number. An attachment is tied to the Subscription Number and thus viewable with every subscription version.  For Account and Invoice, specify the id.  | 
 **request** | [**POSTAttachmentType**](POSTAttachmentType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **description** | **String**| Description of the attachment document.  | [optional] 

### Return type

[**POSTAttachmentResponseType**](POSTAttachmentResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_attachments**
> CommonResponseType put_attachments(attachment_id, opts)

Edit attachments

Use the Edit Attachment REST request to make changes to the descriptive fields of an attachment, such as the description and the file name. You cannot change the actual content of the attached file in Zuora. If you need to change the actual content, you need to delete the attachment and add the updated file as a new attachment.

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::AttachmentsApi.new

attachment_id = "attachment_id_example" # String | Id of the attachment to be updated.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  request: Zuora::PUTAttachmentType.new # PUTAttachmentType | 
}

begin
  #Edit attachments
  result = api_instance.put_attachments(attachment_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling AttachmentsApi->put_attachments: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **attachment_id** | **String**| Id of the attachment to be updated. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **request** | [**PUTAttachmentType**](PUTAttachmentType.md)|  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



