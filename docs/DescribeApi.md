# Zuora::DescribeApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_describe**](DescribeApi.md#get_describe) | **GET** /v1/describe/{object} | Describe object


# **get_describe**
> get_describe(object, opts)

Describe object

Provides a reference listing of each object that is available in your Zuora tenant.  The information returned by this call is useful if you are using [CRUD: Create Export](https://www.zuora.com/developer/api-reference/#operation/Object_POSTExport) or the [AQuA API](https://knowledgecenter.zuora.com/DC_Developers/T_Aggregate_Query_API) to create a data source export. See [Export ZOQL](https://knowledgecenter.zuora.com/DC_Developers/M_Export_ZOQL) for more information.  ## Response The response contains an XML document that lists the fields of the specified object. Each of the object's fields is represented by a `<field>` element in the XML document.      Each `<field>` element contains the following elements:  | Element      | Description                                                                                                                                                                                                                                                                                  | |--------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| | `<name>`     | API name of the field.                                                                                                                                                                                                                                                                       | | `<label>`    | Name of the field in the Zuora user interface.                                                                                                                                                                                                                                               | | `<type>`     | Data type of the field. The possible data types are: `boolean`, `date`, `datetime`, `decimal`, `integer`, `picklist`, `text`, `timestamp`, and `ZOQL`. If the data type is `picklist`, the `<field>` element contains an `<options>` element that lists the possible values of the field.    | | `<contexts>` | Specifies the availability of the field. If the `<contexts>` element lists the `export` context, the field is available for use in data source exports.                                                                                                                                                |  The `<field>` element contains other elements that provide legacy information about the field. This information is not directly related to the REST API.  Response sample: ```xml <?xml version=\"1.0\" encoding=\"UTF-8\"?> <object>   <name>ProductRatePlanCharge</name>   <label>Product Rate Plan Charge</label>   <fields>     ...     <field>       <name>TaxMode</name>       <label>Tax Mode</label>       <type>picklist</type>       <options>         <option>TaxExclusive</option>         <option>TaxInclusive</option>       </options>       <contexts>         <context>export</context>       </contexts>       ...     </field>     ...   </fields> </object> ```  It is strongly recommended that your integration checks `<contexts>` elements in the response. If your integration does not check `<contexts>` elements, your integration may process fields that are not available for use in data source exports. See [Changes to the Describe API](https://knowledgecenter.zuora.com/DC_Developers/M_Export_ZOQL/Changes_to_the_Describe_API) for more information. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::DescribeApi.new

object = "object_example" # String | API name of an object in your Zuora tenant. For example, `InvoiceItem`. See [Zuora Object Model](https://www.zuora.com/developer/api-reference/#section/Zuora-Object-Model) for the list of valid object names.  Depending on the features enabled in your Zuora tenant, you may not be able to list the fields of some objects. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Describe object
  api_instance.get_describe(object, opts)
rescue Zuora::ApiError => e
  puts "Exception when calling DescribeApi->get_describe: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **object** | **String**| API name of an object in your Zuora tenant. For example, &#x60;InvoiceItem&#x60;. See [Zuora Object Model](https://www.zuora.com/developer/api-reference/#section/Zuora-Object-Model) for the list of valid object names.  Depending on the features enabled in your Zuora tenant, you may not be able to list the fields of some objects.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: text/xml; charset=utf-8



