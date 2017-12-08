# Zuora::RevenueSchedulesApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_rs**](RevenueSchedulesApi.md#delete_rs) | **DELETE** /v1/revenue-schedules/{rs-number} | Delete revenue schedule
[**get_r_sby_credit_memo_item**](RevenueSchedulesApi.md#get_r_sby_credit_memo_item) | **GET** /v1/revenue-schedules/credit-memo-items/{cmi-id} | Get revenue schedule by credit memo item ID 
[**get_r_sby_debit_memo_item**](RevenueSchedulesApi.md#get_r_sby_debit_memo_item) | **GET** /v1/revenue-schedules/debit-memo-items/{dmi-id} | Get revenue schedule by debit memo item ID 
[**get_r_sby_invoice_item**](RevenueSchedulesApi.md#get_r_sby_invoice_item) | **GET** /v1/revenue-schedules/invoice-items/{invoice-item-id} | Get revenue schedule by invoice item ID
[**get_r_sby_invoice_item_adjustment**](RevenueSchedulesApi.md#get_r_sby_invoice_item_adjustment) | **GET** /v1/revenue-schedules/invoice-item-adjustments/{invoice-item-adj-id}/ | Get revenue schedule by invoice item adjustment
[**get_r_sby_product_charge_and_billing_account**](RevenueSchedulesApi.md#get_r_sby_product_charge_and_billing_account) | **GET** /v1/revenue-schedules/product-charges/{charge-key}/{account-key} | Get all revenue schedules of product charge by charge ID and billing account ID 
[**get_r_sfor_subsc_charge**](RevenueSchedulesApi.md#get_r_sfor_subsc_charge) | **GET** /v1/revenue-schedules/subscription-charges/{charge-key} | Get revenue schedule by subscription charge
[**get_rs**](RevenueSchedulesApi.md#get_rs) | **GET** /v1/revenue-schedules/{rs-number} | Get revenue schedule details
[**post_r_sfor_credit_memo_item_distribute_by_date_range**](RevenueSchedulesApi.md#post_r_sfor_credit_memo_item_distribute_by_date_range) | **POST** /v1/revenue-schedules/credit-memo-items/{cmi-id}/distribute-revenue-with-date-range | Create revenue schedule for credit memo item (distribute by date range) 
[**post_r_sfor_credit_memo_item_manual_distribution**](RevenueSchedulesApi.md#post_r_sfor_credit_memo_item_manual_distribution) | **POST** /v1/revenue-schedules/credit-memo-items/{cmi-id} | Create revenue schedule for credit memo item (manual distribution) 
[**post_r_sfor_debit_memo_item_distribute_by_date_range**](RevenueSchedulesApi.md#post_r_sfor_debit_memo_item_distribute_by_date_range) | **POST** /v1/revenue-schedules/debit-memo-items/{dmi-id}/distribute-revenue-with-date-range | Create revenue schedule for debit memo item (distribute by date range) 
[**post_r_sfor_debit_memo_item_manual_distribution**](RevenueSchedulesApi.md#post_r_sfor_debit_memo_item_manual_distribution) | **POST** /v1/revenue-schedules/debit-memo-items/{dmi-id} | Create revenue schedule for debit memo item (manual distribution) 
[**post_r_sfor_invoice_item_adjustment_distribute_by_date_range**](RevenueSchedulesApi.md#post_r_sfor_invoice_item_adjustment_distribute_by_date_range) | **POST** /v1/revenue-schedules/invoice-item-adjustments/{invoice-item-adj-key}/distribute-revenue-with-date-range | Create revenue schedule for Invoice Item Adjustment (distribute by date range)
[**post_r_sfor_invoice_item_adjustment_manual_distribution**](RevenueSchedulesApi.md#post_r_sfor_invoice_item_adjustment_manual_distribution) | **POST** /v1/revenue-schedules/invoice-item-adjustments/{invoice-item-adj-key} | Create revenue schedule for Invoice Item Adjustment (manual distribution)
[**post_r_sfor_invoice_item_distribute_by_date_range**](RevenueSchedulesApi.md#post_r_sfor_invoice_item_distribute_by_date_range) | **POST** /v1/revenue-schedules/invoice-items/{invoice-item-id}/distribute-revenue-with-date-range | Create revenue schedule for Invoice Item (distribute by date range)
[**post_r_sfor_invoice_item_manual_distribution**](RevenueSchedulesApi.md#post_r_sfor_invoice_item_manual_distribution) | **POST** /v1/revenue-schedules/invoice-items/{invoice-item-id} | Create revenue schedule for Invoice Item (manual distribution)
[**post_r_sfor_subsc_charge**](RevenueSchedulesApi.md#post_r_sfor_subsc_charge) | **POST** /v1/revenue-schedules/subscription-charges/{charge-key} | Create revenue schedule on subscription charge
[**put_revenue_across_ap**](RevenueSchedulesApi.md#put_revenue_across_ap) | **PUT** /v1/revenue-schedules/{rs-number}/distribute-revenue-across-accounting-periods | Distribute revenue across accounting periods
[**put_revenue_by_recognition_startand_end_dates**](RevenueSchedulesApi.md#put_revenue_by_recognition_startand_end_dates) | **PUT** /v1/revenue-schedules/{rs-number}/distribute-revenue-with-date-range | Distribute revenue by recognition start and end dates
[**put_revenue_specific_date**](RevenueSchedulesApi.md#put_revenue_specific_date) | **PUT** /v1/revenue-schedules/{rs-number}/distribute-revenue-on-specific-date | Distribute revenue on specific date
[**put_rs_basic_info**](RevenueSchedulesApi.md#put_rs_basic_info) | **PUT** /v1/revenue-schedules/{rs-number}/basic-information | Update revenue schedule basic information


# **delete_rs**
> CommonResponseType delete_rs(rs_number, opts)

Delete revenue schedule

Deletes a revenue schedule by specifying its revenue schedule number ## Prerequisites You must have the Delete Custom Revenue Schedule permissions in Zuora Finance. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

rs_number = "rs_number_example" # String |  Revenue schedule number of the revenue schedule you want to delete, for example, RS-00000256. To be deleted, the revenue schedule: * Must be using a custom unlimited recognition rule. * Cannot have any revenue in a closed accounting period. * Cannot be included in a summary journal entry. * Cannot have a revenue schedule date in a closed accounting period. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Delete revenue schedule
  result = api_instance.delete_rs(rs_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->delete_rs: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rs_number** | **String**|  Revenue schedule number of the revenue schedule you want to delete, for example, RS-00000256. To be deleted, the revenue schedule: * Must be using a custom unlimited recognition rule. * Cannot have any revenue in a closed accounting period. * Cannot be included in a summary journal entry. * Cannot have a revenue schedule date in a closed accounting period.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_r_sby_credit_memo_item**
> GETRSDetailType get_r_sby_credit_memo_item(cmi_id)

Get revenue schedule by credit memo item ID 

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the details about a revenue schedule by specifying a valid credit memo item ID. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

cmi_id = "cmi_id_example" # String | The unique ID of a credit memo item. You can get the credit memo item ID from the response of [Get credit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoItems). 


begin
  #Get revenue schedule by credit memo item ID 
  result = api_instance.get_r_sby_credit_memo_item(cmi_id)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->get_r_sby_credit_memo_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cmi_id** | **String**| The unique ID of a credit memo item. You can get the credit memo item ID from the response of [Get credit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoItems).  | 

### Return type

[**GETRSDetailType**](GETRSDetailType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_r_sby_debit_memo_item**
> GETRSDetailType get_r_sby_debit_memo_item(dmi_id)

Get revenue schedule by debit memo item ID 

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the details about a revenue schedule by specifying a valid debit memo item ID. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

dmi_id = "dmi_id_example" # String | The unique ID of a debit memo item. You can get the debit memo item ID from the response of [Get debit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_DebitMemoItems). 


begin
  #Get revenue schedule by debit memo item ID 
  result = api_instance.get_r_sby_debit_memo_item(dmi_id)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->get_r_sby_debit_memo_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dmi_id** | **String**| The unique ID of a debit memo item. You can get the debit memo item ID from the response of [Get debit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_DebitMemoItems).  | 

### Return type

[**GETRSDetailType**](GETRSDetailType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_r_sby_invoice_item**
> GETRSDetailType get_r_sby_invoice_item(invoice_item_id, opts)

Get revenue schedule by invoice item ID

Retrieves the details of a revenue schedule by specifying the invoice item ID. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

invoice_item_id = "invoice_item_id_example" # String | A valid Invoice Item ID.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get revenue schedule by invoice item ID
  result = api_instance.get_r_sby_invoice_item(invoice_item_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->get_r_sby_invoice_item: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_item_id** | **String**| A valid Invoice Item ID. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETRSDetailType**](GETRSDetailType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_r_sby_invoice_item_adjustment**
> GETRSDetailType get_r_sby_invoice_item_adjustment(invoice_item_adj_id, opts)

Get revenue schedule by invoice item adjustment

Retrieves the details of a revenue schedule by specifying a valid invoice item adjustment identifier. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

invoice_item_adj_id = "invoice_item_adj_id_example" # String | ID or number of the Invoice Item Adjustment, for example, e20b07fd416dcfcf0141c81164fd0a72.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get revenue schedule by invoice item adjustment
  result = api_instance.get_r_sby_invoice_item_adjustment(invoice_item_adj_id, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->get_r_sby_invoice_item_adjustment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_item_adj_id** | **String**| ID or number of the Invoice Item Adjustment, for example, e20b07fd416dcfcf0141c81164fd0a72. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETRSDetailType**](GETRSDetailType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_r_sby_product_charge_and_billing_account**
> GETRSDetailsByProductChargeType get_r_sby_product_charge_and_billing_account(account_key, charge_key, opts)

Get all revenue schedules of product charge by charge ID and billing account ID 

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Retrieves the details about all revenue schedules of a product rate plan charge by specifying the charge ID and billing account ID. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

account_key = "account_key_example" # String | The account number or account ID. 

charge_key = "charge_key_example" # String | The unique ID of a product rate plan charge. For example, 8a8082e65ba86084015bb323d3c61d82. 

opts = { 
  page_size: 8 # Integer | Number of rows returned per page. 
}

begin
  #Get all revenue schedules of product charge by charge ID and billing account ID 
  result = api_instance.get_r_sby_product_charge_and_billing_account(account_key, charge_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->get_r_sby_product_charge_and_billing_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_key** | **String**| The account number or account ID.  | 
 **charge_key** | **String**| The unique ID of a product rate plan charge. For example, 8a8082e65ba86084015bb323d3c61d82.  | 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 8]

### Return type

[**GETRSDetailsByProductChargeType**](GETRSDetailsByProductChargeType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_r_sfor_subsc_charge**
> GETRSDetailsByChargeType get_r_sfor_subsc_charge(charge_key, opts)

Get revenue schedule by subscription charge

Retrieves the revenue schedule details by specifying subscription charge ID. Request and response field descriptions and sample code are provided 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

charge_key = "charge_key_example" # String | ID of the subscription rate plan charge; for example, 402892793e173340013e173b81000012.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page_size: 8 # Integer | Number of rows returned per page. 
}

begin
  #Get revenue schedule by subscription charge
  result = api_instance.get_r_sfor_subsc_charge(charge_key, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->get_r_sfor_subsc_charge: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **charge_key** | **String**| ID of the subscription rate plan charge; for example, 402892793e173340013e173b81000012. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 8]

### Return type

[**GETRSDetailsByChargeType**](GETRSDetailsByChargeType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **get_rs**
> GETRSDetailType get_rs(rs_number, opts)

Get revenue schedule details

Retrieves the details of a revenue schedule by specifying the revenue schedule number. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

rs_number = "rs_number_example" # String | Revenue schedule number. The revenue schedule number is always prefixed with \"RS\", for example, \"RS-00000001\". 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get revenue schedule details
  result = api_instance.get_rs(rs_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->get_rs: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rs_number** | **String**| Revenue schedule number. The revenue schedule number is always prefixed with \&quot;RS\&quot;, for example, \&quot;RS-00000001\&quot;.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GETRSDetailType**](GETRSDetailType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_r_sfor_credit_memo_item_distribute_by_date_range**
> POSTRevenueScheduleByTransactionResponseType post_r_sfor_credit_memo_item_distribute_by_date_range(cmi_id, body)

Create revenue schedule for credit memo item (distribute by date range) 

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Creates a revenue schedule for a credit memo item, and automatically distribute the revenue by specifying the recognition start and end dates. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

cmi_id = "cmi_id_example" # String | The unique ID of a credit memo item. You can get the credit memo item ID from the response of [Get credit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoItems). 

body = Zuora::POSTRevenueScheduleByTransactionRatablyType.new # POSTRevenueScheduleByTransactionRatablyType | 


begin
  #Create revenue schedule for credit memo item (distribute by date range) 
  result = api_instance.post_r_sfor_credit_memo_item_distribute_by_date_range(cmi_id, body)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->post_r_sfor_credit_memo_item_distribute_by_date_range: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cmi_id** | **String**| The unique ID of a credit memo item. You can get the credit memo item ID from the response of [Get credit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoItems).  | 
 **body** | [**POSTRevenueScheduleByTransactionRatablyType**](POSTRevenueScheduleByTransactionRatablyType.md)|  | 

### Return type

[**POSTRevenueScheduleByTransactionResponseType**](POSTRevenueScheduleByTransactionResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_r_sfor_credit_memo_item_manual_distribution**
> POSTRevenueScheduleByTransactionResponseType post_r_sfor_credit_memo_item_manual_distribution(cmi_id, body)

Create revenue schedule for credit memo item (manual distribution) 

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Creates a revenue schedule for a credit memo item, and manually distribute the revenue. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

cmi_id = "cmi_id_example" # String | The unique ID of a credit memo item. You can get the credit memo item ID from the response of [Get credit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoItems). 

body = Zuora::POSTRevenueScheduleByTransactionType.new # POSTRevenueScheduleByTransactionType | 


begin
  #Create revenue schedule for credit memo item (manual distribution) 
  result = api_instance.post_r_sfor_credit_memo_item_manual_distribution(cmi_id, body)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->post_r_sfor_credit_memo_item_manual_distribution: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cmi_id** | **String**| The unique ID of a credit memo item. You can get the credit memo item ID from the response of [Get credit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_CreditMemoItems).  | 
 **body** | [**POSTRevenueScheduleByTransactionType**](POSTRevenueScheduleByTransactionType.md)|  | 

### Return type

[**POSTRevenueScheduleByTransactionResponseType**](POSTRevenueScheduleByTransactionResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_r_sfor_debit_memo_item_distribute_by_date_range**
> POSTRevenueScheduleByTransactionResponseType post_r_sfor_debit_memo_item_distribute_by_date_range(dmi_id, body)

Create revenue schedule for debit memo item (distribute by date range) 

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Creates a revenue schedule for a debit memo item, and automatically distribute the revenue by specifying the recognition start and end dates. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

dmi_id = "dmi_id_example" # String | The unique ID of a debit memo item. You can get the debit memo item ID from the response of [Get debit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_DebitMemoItems). 

body = Zuora::POSTRevenueScheduleByTransactionRatablyType.new # POSTRevenueScheduleByTransactionRatablyType | 


begin
  #Create revenue schedule for debit memo item (distribute by date range) 
  result = api_instance.post_r_sfor_debit_memo_item_distribute_by_date_range(dmi_id, body)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->post_r_sfor_debit_memo_item_distribute_by_date_range: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dmi_id** | **String**| The unique ID of a debit memo item. You can get the debit memo item ID from the response of [Get debit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_DebitMemoItems).  | 
 **body** | [**POSTRevenueScheduleByTransactionRatablyType**](POSTRevenueScheduleByTransactionRatablyType.md)|  | 

### Return type

[**POSTRevenueScheduleByTransactionResponseType**](POSTRevenueScheduleByTransactionResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_r_sfor_debit_memo_item_manual_distribution**
> POSTRevenueScheduleByTransactionResponseType post_r_sfor_debit_memo_item_manual_distribution(dmi_id, body)

Create revenue schedule for debit memo item (manual distribution) 

**Note:** This feature is only available if you have the Advanced AR Settlement feature enabled. The Advanced AR Settlement feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Creates a revenue schedule for a debit memo item, and manually distribute the revenue. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

dmi_id = "dmi_id_example" # String | The unique ID of a debit memo item. You can get the debit memo item ID from the response of [Get debit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_DebitMemoItems). 

body = Zuora::POSTRevenueScheduleByTransactionType.new # POSTRevenueScheduleByTransactionType | 


begin
  #Create revenue schedule for debit memo item (manual distribution) 
  result = api_instance.post_r_sfor_debit_memo_item_manual_distribution(dmi_id, body)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->post_r_sfor_debit_memo_item_manual_distribution: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dmi_id** | **String**| The unique ID of a debit memo item. You can get the debit memo item ID from the response of [Get debit memo items](https://www.zuora.com/developer/api-reference/#operation/GET_DebitMemoItems).  | 
 **body** | [**POSTRevenueScheduleByTransactionType**](POSTRevenueScheduleByTransactionType.md)|  | 

### Return type

[**POSTRevenueScheduleByTransactionResponseType**](POSTRevenueScheduleByTransactionResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_r_sfor_invoice_item_adjustment_distribute_by_date_range**
> POSTRevenueScheduleByTransactionResponseType post_r_sfor_invoice_item_adjustment_distribute_by_date_range(invoice_item_adj_key, request, opts)

Create revenue schedule for Invoice Item Adjustment (distribute by date range)

Creates a revenue schedule for an Invoice Item Adjustment and distribute the revenue by specifying the recognition start and end dates. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

invoice_item_adj_key = "invoice_item_adj_key_example" # String | ID or number of the Invoice Item Adjustment, for example, e20b07fd416dcfcf0141c81164fd0a72. If the specified Invoice Item Adjustment is already associated with a revenue schedule, the call will fail. 

request = Zuora::POSTRevenueScheduleByDateRangeType.new # POSTRevenueScheduleByDateRangeType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create revenue schedule for Invoice Item Adjustment (distribute by date range)
  result = api_instance.post_r_sfor_invoice_item_adjustment_distribute_by_date_range(invoice_item_adj_key, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->post_r_sfor_invoice_item_adjustment_distribute_by_date_range: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_item_adj_key** | **String**| ID or number of the Invoice Item Adjustment, for example, e20b07fd416dcfcf0141c81164fd0a72. If the specified Invoice Item Adjustment is already associated with a revenue schedule, the call will fail.  | 
 **request** | [**POSTRevenueScheduleByDateRangeType**](POSTRevenueScheduleByDateRangeType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**POSTRevenueScheduleByTransactionResponseType**](POSTRevenueScheduleByTransactionResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_r_sfor_invoice_item_adjustment_manual_distribution**
> POSTRevenueScheduleByTransactionResponseType post_r_sfor_invoice_item_adjustment_manual_distribution(invoice_item_adj_key, request, opts)

Create revenue schedule for Invoice Item Adjustment (manual distribution)

Creates a revenue schedule for an Invoice Item Adjustment and manually distribute the revenue. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

invoice_item_adj_key = "invoice_item_adj_key_example" # String | ID or number of the Invoice Item Adjustment, for example, e20b07fd416dcfcf0141c81164fd0a72. If the specified Invoice Item Adjustment is already associated with a revenue schedule, the call will fail. 

request = Zuora::POSTRevenueScheduleByTransactionType.new # POSTRevenueScheduleByTransactionType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create revenue schedule for Invoice Item Adjustment (manual distribution)
  result = api_instance.post_r_sfor_invoice_item_adjustment_manual_distribution(invoice_item_adj_key, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->post_r_sfor_invoice_item_adjustment_manual_distribution: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_item_adj_key** | **String**| ID or number of the Invoice Item Adjustment, for example, e20b07fd416dcfcf0141c81164fd0a72. If the specified Invoice Item Adjustment is already associated with a revenue schedule, the call will fail.  | 
 **request** | [**POSTRevenueScheduleByTransactionType**](POSTRevenueScheduleByTransactionType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**POSTRevenueScheduleByTransactionResponseType**](POSTRevenueScheduleByTransactionResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_r_sfor_invoice_item_distribute_by_date_range**
> POSTRevenueScheduleByTransactionResponseType post_r_sfor_invoice_item_distribute_by_date_range(invoice_item_id, request, opts)

Create revenue schedule for Invoice Item (distribute by date range)

Creates a revenue schedule for an Invoice Item and distribute the revenue by specifying the recognition start and end dates. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

invoice_item_id = "invoice_item_id_example" # String | ID of the Invoice Item, for example, e20b07fd416dcfcf0141c81164fd0a75. If the specified Invoice Item is already associated with a revenue schedule, the call will fail. 

request = Zuora::POSTRevenueScheduleByDateRangeType.new # POSTRevenueScheduleByDateRangeType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create revenue schedule for Invoice Item (distribute by date range)
  result = api_instance.post_r_sfor_invoice_item_distribute_by_date_range(invoice_item_id, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->post_r_sfor_invoice_item_distribute_by_date_range: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_item_id** | **String**| ID of the Invoice Item, for example, e20b07fd416dcfcf0141c81164fd0a75. If the specified Invoice Item is already associated with a revenue schedule, the call will fail.  | 
 **request** | [**POSTRevenueScheduleByDateRangeType**](POSTRevenueScheduleByDateRangeType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**POSTRevenueScheduleByTransactionResponseType**](POSTRevenueScheduleByTransactionResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_r_sfor_invoice_item_manual_distribution**
> POSTRevenueScheduleByTransactionResponseType post_r_sfor_invoice_item_manual_distribution(invoice_item_id, request, opts)

Create revenue schedule for Invoice Item (manual distribution)

Creates a revenue schedule for an Invoice Item and manually distribute the revenue. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

invoice_item_id = "invoice_item_id_example" # String | ID of the Invoice Item, for example, e20b07fd416dcfcf0141c81164fd0a75. If the specified Invoice Item is already associated with a revenue schedule, the call will fail. 

request = Zuora::POSTRevenueScheduleByTransactionType.new # POSTRevenueScheduleByTransactionType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create revenue schedule for Invoice Item (manual distribution)
  result = api_instance.post_r_sfor_invoice_item_manual_distribution(invoice_item_id, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->post_r_sfor_invoice_item_manual_distribution: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_item_id** | **String**| ID of the Invoice Item, for example, e20b07fd416dcfcf0141c81164fd0a75. If the specified Invoice Item is already associated with a revenue schedule, the call will fail.  | 
 **request** | [**POSTRevenueScheduleByTransactionType**](POSTRevenueScheduleByTransactionType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**POSTRevenueScheduleByTransactionResponseType**](POSTRevenueScheduleByTransactionResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **post_r_sfor_subsc_charge**
> POSTRevenueScheduleByChargeResponseType post_r_sfor_subsc_charge(charge_key, request, opts)

Create revenue schedule on subscription charge

Creates a revenue schedule by specifying the subscription charge. This method is for custom unlimited revenue recognition only. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

charge_key = "charge_key_example" # String | ID of the subscription rate plan charge; for example, 402892793e173340013e173b81000012.

request = Zuora::POSTRevenueScheduleByChargeType.new # POSTRevenueScheduleByChargeType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create revenue schedule on subscription charge
  result = api_instance.post_r_sfor_subsc_charge(charge_key, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->post_r_sfor_subsc_charge: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **charge_key** | **String**| ID of the subscription rate plan charge; for example, 402892793e173340013e173b81000012. | 
 **request** | [**POSTRevenueScheduleByChargeType**](POSTRevenueScheduleByChargeType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**POSTRevenueScheduleByChargeResponseType**](POSTRevenueScheduleByChargeResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_revenue_across_ap**
> PUTRevenueScheduleResponseType put_revenue_across_ap(rs_number, request, opts)

Distribute revenue across accounting periods

Distributes revenue by specifying the revenue schedule number. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

rs_number = "rs_number_example" # String | Revenue schedule number. The revenue schedule number is always prefixed with \"RS\", for example, \"RS-00000001\". 

request = Zuora::PUTAllocateManuallyType.new # PUTAllocateManuallyType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Distribute revenue across accounting periods
  result = api_instance.put_revenue_across_ap(rs_number, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->put_revenue_across_ap: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rs_number** | **String**| Revenue schedule number. The revenue schedule number is always prefixed with \&quot;RS\&quot;, for example, \&quot;RS-00000001\&quot;.  | 
 **request** | [**PUTAllocateManuallyType**](PUTAllocateManuallyType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**PUTRevenueScheduleResponseType**](PUTRevenueScheduleResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_revenue_by_recognition_startand_end_dates**
> PUTRevenueScheduleResponseType put_revenue_by_recognition_startand_end_dates(rs_number, request, opts)

Distribute revenue by recognition start and end dates

Distributes revenue by specifying the recognition start and end dates. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

rs_number = "rs_number_example" # String | Revenue schedule number. Specify the revenue schedule whose revenue you want to distribute.    The revenue schedule number is always prefixed with \"RS\", for example, \"RS-00000001\". 

request = Zuora::PUTRSTermType.new # PUTRSTermType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Distribute revenue by recognition start and end dates
  result = api_instance.put_revenue_by_recognition_startand_end_dates(rs_number, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->put_revenue_by_recognition_startand_end_dates: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rs_number** | **String**| Revenue schedule number. Specify the revenue schedule whose revenue you want to distribute.    The revenue schedule number is always prefixed with \&quot;RS\&quot;, for example, \&quot;RS-00000001\&quot;.  | 
 **request** | [**PUTRSTermType**](PUTRSTermType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**PUTRevenueScheduleResponseType**](PUTRevenueScheduleResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_revenue_specific_date**
> PUTRevenueScheduleResponseType put_revenue_specific_date(rs_number, request, opts)

Distribute revenue on specific date

Distributes revenue on a specific recognition date. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

rs_number = "rs_number_example" # String | Revenue schedule number. The revenue schedule number is always prefixed with \"RS\", for example, \"RS-00000001\". 

request = Zuora::PUTSpecificDateAllocationType.new # PUTSpecificDateAllocationType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Distribute revenue on specific date
  result = api_instance.put_revenue_specific_date(rs_number, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->put_revenue_specific_date: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rs_number** | **String**| Revenue schedule number. The revenue schedule number is always prefixed with \&quot;RS\&quot;, for example, \&quot;RS-00000001\&quot;.  | 
 **request** | [**PUTSpecificDateAllocationType**](PUTSpecificDateAllocationType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**PUTRevenueScheduleResponseType**](PUTRevenueScheduleResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **put_rs_basic_info**
> CommonResponseType put_rs_basic_info(rs_number, request, opts)

Update revenue schedule basic information

Retrieves basic information of a revenue schedule by specifying the revenue schedule number. Request and response field descriptions and sample code are provided. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::RevenueSchedulesApi.new

rs_number = "rs_number_example" # String | Revenue schedule number. The revenue schedule number is always prefixed with \"RS\", for example, \"RS-00000001\". 

request = Zuora::PUTRSBasicInfoType.new # PUTRSBasicInfoType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Update revenue schedule basic information
  result = api_instance.put_rs_basic_info(rs_number, request, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling RevenueSchedulesApi->put_rs_basic_info: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rs_number** | **String**| Revenue schedule number. The revenue schedule number is always prefixed with \&quot;RS\&quot;, for example, \&quot;RS-00000001\&quot;.  | 
 **request** | [**PUTRSBasicInfoType**](PUTRSBasicInfoType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



