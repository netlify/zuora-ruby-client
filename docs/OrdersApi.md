# SwaggerClient::OrdersApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**d_elete_order**](OrdersApi.md#d_elete_order) | **DELETE** /v1/orders/{orderNumber} | Delete order
[**g_et_all_orders**](OrdersApi.md#g_et_all_orders) | **GET** /v1/orders | Get all orders
[**g_et_order**](OrdersApi.md#g_et_order) | **GET** /v1/orders/{orderNumber} | Get an order
[**g_et_order_billing_info**](OrdersApi.md#g_et_order_billing_info) | **GET** /v1/orders/{orderNumber}/billingInfo | Get billing information for order
[**g_et_order_metricsfor_evergreen_subscription**](OrdersApi.md#g_et_order_metricsfor_evergreen_subscription) | **GET** /v1/orders/{orderNumber}/evergreenMetrics/{subscriptionNumber} | Get order metrics for evergreen subscription
[**g_et_order_rated_result**](OrdersApi.md#g_et_order_rated_result) | **GET** /v1/orders/{orderNumber}/ratedResults | Get rated result for order
[**g_et_orders_by_invoice_owner**](OrdersApi.md#g_et_orders_by_invoice_owner) | **GET** /v1/orders/invoiceOwner/{accountNumber} | Get orders by invoice owner
[**g_et_orders_by_subscription_number**](OrdersApi.md#g_et_orders_by_subscription_number) | **GET** /v1/orders/subscription/{subscriptionNumber} | Get orders by subscription number
[**g_et_orders_by_subscription_owner**](OrdersApi.md#g_et_orders_by_subscription_owner) | **GET** /v1/orders/subscriptionOwner/{accountNumber} | Get orders by subscription owner
[**p_ost_order**](OrdersApi.md#p_ost_order) | **POST** /v1/orders | Create and activate order
[**p_ost_preview_order**](OrdersApi.md#p_ost_preview_order) | **POST** /v1/orders/preview | Preview order
[**p_ut_update_order_custom_fields**](OrdersApi.md#p_ut_update_order_custom_fields) | **PUT** /v1/orders/{orderNumber}/customFields | Update order custom fields


# **d_elete_order**
> CommonResponse d_elete_order(order_number, opts)

Delete order

**Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Deletes a specified order. All the subscriptions changed by this order are deleted. After the deletion, the subscriptions are rolled back to the previous version.   You are not allowed to delete an order if the charges that are affected by this order are invoiced. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OrdersApi.new

order_number = "order_number_example" # String | The number of the order to be deleted.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Delete order
  result = api_instance.d_elete_order(order_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OrdersApi->d_elete_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_number** | **String**| The number of the order to be deleted. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_all_orders**
> GetAllOrdersResponseType g_et_all_orders(opts)

Get all orders

**Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.   Retrieves information about all orders in your tenant. By default, it returns the first page of the orders.  

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OrdersApi.new

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page: 1, # Integer | The page number of the orders retrieved.  
  page_size: 20 # Integer | Number of rows returned per page. 
  date_filter_option: "date_filter_option_example", # String | The date type to filter on.This field value can be orderDate or updatedDate. Default is orderDate. 
  start_date: Date.parse("2013-10-20"), # Date | The result will only contain the orders with the date of dateFilterOption later than or equal to this date. 
  end_date: Date.parse("2013-10-20") # Date | The result will only contains orders with the date of dateFilterOption earlier than or equal to this date. 
}

begin
  #Get all orders
  result = api_instance.g_et_all_orders(opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OrdersApi->g_et_all_orders: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page** | **Integer**| The page number of the orders retrieved.   | [optional] [default to 1]
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]
 **date_filter_option** | **String**| The date type to filter on.This field value can be orderDate or updatedDate. Default is orderDate.  | [optional] 
 **start_date** | **Date**| The result will only contain the orders with the date of dateFilterOption later than or equal to this date.  | [optional] 
 **end_date** | **Date**| The result will only contains orders with the date of dateFilterOption earlier than or equal to this date.  | [optional] 

### Return type

[**GetAllOrdersResponseType**](GetAllOrdersResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_order**
> GetOrderResponse g_et_order(order_number, opts)

Get an order

**Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.   Retrieves the detailed information about a specified order. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OrdersApi.new

order_number = "order_number_example" # String | The order number to be retrieved.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get an order
  result = api_instance.g_et_order(order_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OrdersApi->g_et_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_number** | **String**| The order number to be retrieved. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GetOrderResponse**](GetOrderResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_order_billing_info**
> GetOrderBillingInfoResponseType g_et_order_billing_info(order_number, opts)

Get billing information for order

**Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the billing information about a specified order. The information includes the billed and unbilled amount of the order. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OrdersApi.new

order_number = "order_number_example" # String | The order number.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  as_of_date: Date.parse("2013-10-20") # Date | Billing states of the order will be calculated as of this date. Invoices with the invoice date later than this date will not be counted into the billed amount. The default value is today.
}

begin
  #Get billing information for order
  result = api_instance.g_et_order_billing_info(order_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OrdersApi->g_et_order_billing_info: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_number** | **String**| The order number. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **as_of_date** | **Date**| Billing states of the order will be calculated as of this date. Invoices with the invoice date later than this date will not be counted into the billed amount. The default value is today. | [optional] 

### Return type

[**GetOrderBillingInfoResponseType**](GetOrderBillingInfoResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_order_metricsfor_evergreen_subscription**
> GetOrderResponse g_et_order_metricsfor_evergreen_subscription(order_number, subscription_number, start_date, end_date, opts)

Get order metrics for evergreen subscription

**Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.   Retrieves the metrics of an evergreen subscription in a specified order. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OrdersApi.new

order_number = "order_number_example" # String | The order number. 

subscription_number = "subscription_number_example" # String | The subscription number you want to get the metrics for. 

start_date = Date.parse("2013-10-20") # Date | The start date of the date range for which you want to get the metrics. The date must be in yyyy-mm-dd format. For example, 2017-12-03. 

end_date = Date.parse("2013-10-20") # Date | The end date of the date range for which you want to get the metrics. The date must be in yyyy-mm-dd format. For example, 2017-12-03. 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get order metrics for evergreen subscription
  result = api_instance.g_et_order_metricsfor_evergreen_subscription(order_number, subscription_number, start_date, end_date, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OrdersApi->g_et_order_metricsfor_evergreen_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_number** | **String**| The order number.  | 
 **subscription_number** | **String**| The subscription number you want to get the metrics for.  | 
 **start_date** | **Date**| The start date of the date range for which you want to get the metrics. The date must be in yyyy-mm-dd format. For example, 2017-12-03.  | 
 **end_date** | **Date**| The end date of the date range for which you want to get the metrics. The date must be in yyyy-mm-dd format. For example, 2017-12-03.  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GetOrderResponse**](GetOrderResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_order_rated_result**
> GetOrderRatedResultResponseType g_et_order_rated_result(order_number, opts)

Get rated result for order

**Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the rated results of all the subscriptions in the specified order. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OrdersApi.new

order_number = "order_number_example" # String | The order number.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Get rated result for order
  result = api_instance.g_et_order_rated_result(order_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OrdersApi->g_et_order_rated_result: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_number** | **String**| The order number. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**GetOrderRatedResultResponseType**](GetOrderRatedResultResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_orders_by_invoice_owner**
> GetOrdersResponse g_et_orders_by_invoice_owner(account_number, opts)

Get orders by invoice owner

**Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the detailed information about all orders for a specified invoice owner. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OrdersApi.new

account_number = "account_number_example" # String | The invoice owner account number.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page: 56, # Integer | The page number of the orders retrieved. The default is 1. 
  page_size: 20 # Integer | Number of rows returned per page. 
  date_filter_option: "date_filter_option_example", # String | The date type to filter on. This field value can be orderDate or updatedDate. Default is orderDate. 
  start_date: Date.parse("2013-10-20"), # Date | The result will only contain the orders with the date of dateFilterOption later than or equal to this date. 
  end_date: Date.parse("2013-10-20") # Date | The result will only contain the orders with the date of dateFilterOption earlier than or equal to this date. 
}

begin
  #Get orders by invoice owner
  result = api_instance.g_et_orders_by_invoice_owner(account_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OrdersApi->g_et_orders_by_invoice_owner: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_number** | **String**| The invoice owner account number. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page** | **Integer**| The page number of the orders retrieved. The default is 1.  | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]
 **date_filter_option** | **String**| The date type to filter on. This field value can be orderDate or updatedDate. Default is orderDate.  | [optional] 
 **start_date** | **Date**| The result will only contain the orders with the date of dateFilterOption later than or equal to this date.  | [optional] 
 **end_date** | **Date**| The result will only contain the orders with the date of dateFilterOption earlier than or equal to this date.  | [optional] 

### Return type

[**GetOrdersResponse**](GetOrdersResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_orders_by_subscription_number**
> GetOrdersResponse g_et_orders_by_subscription_number(subscription_number, opts)

Get orders by subscription number

**Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the detailed information about all orders for a specified subscription. Any orders containing the changes on the specified subscription are returned. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OrdersApi.new

subscription_number = "subscription_number_example" # String | The subscription number.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page: 56, # Integer | The page number of the orders retrieved. The default is '1'. 
  page_size: 20 # Integer | Number of rows returned per page. 
  date_filter_option: "date_filter_option_example", # String | The date type to filter on. This field value can be 'orderDate' or 'updatedDate'. Default is orderDate. 
  start_date: Date.parse("2013-10-20"), # Date | The result will only contain the orders with the date of 'dateFilterOption' later than or equal to this date. 
  end_date: Date.parse("2013-10-20") # Date | The result will only contain the orders with the date of 'dateFilterOption' earlier than or equal to this date. 
}

begin
  #Get orders by subscription number
  result = api_instance.g_et_orders_by_subscription_number(subscription_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OrdersApi->g_et_orders_by_subscription_number: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_number** | **String**| The subscription number. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page** | **Integer**| The page number of the orders retrieved. The default is &#39;1&#39;.  | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]
 **date_filter_option** | **String**| The date type to filter on. This field value can be &#39;orderDate&#39; or &#39;updatedDate&#39;. Default is orderDate.  | [optional] 
 **start_date** | **Date**| The result will only contain the orders with the date of &#39;dateFilterOption&#39; later than or equal to this date.  | [optional] 
 **end_date** | **Date**| The result will only contain the orders with the date of &#39;dateFilterOption&#39; earlier than or equal to this date.  | [optional] 

### Return type

[**GetOrdersResponse**](GetOrdersResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **g_et_orders_by_subscription_owner**
> GetOrdersResponse g_et_orders_by_subscription_owner(account_number, opts)

Get orders by subscription owner

**Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the detailed information about all orders for a specified subscription owner. Any orders containing the changes on the subscriptions owned by this account are returned. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OrdersApi.new

account_number = "account_number_example" # String | The subscription owner account number.

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  page: 56, # Integer | The page number of the orders retrieved. The default is 1. 
  page_size: 20 # Integer | Number of rows returned per page. 
  date_filter_option: "date_filter_option_example", # String | The date type to filter on. This field value can be 'orderDate' or 'updatedDate'. Default is orderDate. 
  start_date: Date.parse("2013-10-20"), # Date | The result will only contain the orders with the date of 'dateFilterOption' later than or equal to this date. 
  end_date: Date.parse("2013-10-20") # Date | The result will only contain the orders with the date of 'dateFilterOption' earlier than or equal to this date. 
}

begin
  #Get orders by subscription owner
  result = api_instance.g_et_orders_by_subscription_owner(account_number, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OrdersApi->g_et_orders_by_subscription_owner: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_number** | **String**| The subscription owner account number. | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **page** | **Integer**| The page number of the orders retrieved. The default is 1.  | [optional] 
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]
 **date_filter_option** | **String**| The date type to filter on. This field value can be &#39;orderDate&#39; or &#39;updatedDate&#39;. Default is orderDate.  | [optional] 
 **start_date** | **Date**| The result will only contain the orders with the date of &#39;dateFilterOption&#39; later than or equal to this date.  | [optional] 
 **end_date** | **Date**| The result will only contain the orders with the date of &#39;dateFilterOption&#39; earlier than or equal to this date.  | [optional] 

### Return type

[**GetOrdersResponse**](GetOrdersResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_order**
> PostOrderResponseType p_ost_order(body, opts)

Create and activate order

**Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Creates and activates an order. You can create subscriptions and make changes to subscriptions by creating orders. Creating a draft order is currently not supported.  See [Known Limitations in Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/C_Known_Limitations_in_Orders) for more information. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OrdersApi.new

body = SwaggerClient::POSTOrderRequestType.new # POSTOrderRequestType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Create and activate order
  result = api_instance.p_ost_order(body, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OrdersApi->p_ost_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**POSTOrderRequestType**](POSTOrderRequestType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**PostOrderResponseType**](PostOrderResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_preview_order**
> PostOrderPreviewResponseType p_ost_preview_order(body, opts)

Preview order

**Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Retrieves the preview of the charge metrics and invoice items of a specified order. This operation is only an order preview and no order is created. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OrdersApi.new

body = SwaggerClient::POSTOrderPreviewRequestType.new # POSTOrderPreviewRequestType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Preview order
  result = api_instance.p_ost_preview_order(body, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OrdersApi->p_ost_preview_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**POSTOrderPreviewRequestType**](POSTOrderPreviewRequestType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**PostOrderPreviewResponseType**](PostOrderPreviewResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_update_order_custom_fields**
> CommonResponse p_ut_update_order_custom_fields(order_number, body, opts)

Update order custom fields

**Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Updates the custom fields of a specified order. 

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::OrdersApi.new

order_number = "order_number_example" # String | The order number.

body = SwaggerClient::PUTOrderPatchRequestType.new # PUTOrderPatchRequestType | 

opts = { 
  entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
  entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
  #Update order custom fields
  result = api_instance.p_ut_update_order_custom_fields(order_number, body, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling OrdersApi->p_ut_update_order_custom_fields: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_number** | **String**| The order number. | 
 **body** | [**PUTOrderPatchRequestType**](PUTOrderPatchRequestType.md)|  | 
 **entity_id** | **String**| The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 
 **entity_name** | **String**| The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name). | [optional] 

### Return type

[**CommonResponse**](CommonResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



