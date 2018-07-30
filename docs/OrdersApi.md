# Zuora::OrdersApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**d_elete_order**](OrdersApi.md#d_elete_order) | **DELETE** /v1/orders/{orderNumber} | Delete order
[**g_et_all_orders**](OrdersApi.md#g_et_all_orders) | **GET** /v1/orders | Get all orders
[**g_et_breakdown_invoice_by_order**](OrdersApi.md#g_et_breakdown_invoice_by_order) | **GET** /v1/invoices/{invoiceNumber}/amountBreakdownByOrder | Get breakdown of invoice by order
[**g_et_order**](OrdersApi.md#g_et_order) | **GET** /v1/orders/{orderNumber} | Get an order
[**g_et_order_billing_info**](OrdersApi.md#g_et_order_billing_info) | **GET** /v1/orders/{orderNumber}/billingInfo | Get billing information for order
[**g_et_order_metricsfor_evergreen_subscription**](OrdersApi.md#g_et_order_metricsfor_evergreen_subscription) | **GET** /v1/orders/{orderNumber}/evergreenMetrics/{subscriptionNumber} | Get order metrics for evergreen subscription
[**g_et_order_rated_result**](OrdersApi.md#g_et_order_rated_result) | **GET** /v1/orders/{orderNumber}/ratedResults | Get rated result for order
[**g_et_orders_by_invoice_owner**](OrdersApi.md#g_et_orders_by_invoice_owner) | **GET** /v1/orders/invoiceOwner/{accountNumber} | Get orders by invoice owner
[**g_et_orders_by_subscription_number**](OrdersApi.md#g_et_orders_by_subscription_number) | **GET** /v1/orders/subscription/{subscriptionNumber} | Get orders by subscription number
[**g_et_orders_by_subscription_owner**](OrdersApi.md#g_et_orders_by_subscription_owner) | **GET** /v1/orders/subscriptionOwner/{accountNumber} | Get orders by subscription owner
[**g_et_subscription_term_info**](OrdersApi.md#g_et_subscription_term_info) | **GET** /v1/orders/term/{subscriptionNumber} | Get term information for subscription
[**p_ost_order**](OrdersApi.md#p_ost_order) | **POST** /v1/orders | Create and activate order
[**p_ost_preview_order**](OrdersApi.md#p_ost_preview_order) | **POST** /v1/orders/preview | Preview order
[**p_ut_update_order_custom_fields**](OrdersApi.md#p_ut_update_order_custom_fields) | **PUT** /v1/orders/{orderNumber}/customFields | Update order custom fields
[**p_ut_update_subscription_custom_fields**](OrdersApi.md#p_ut_update_subscription_custom_fields) | **PUT** /v1/subscriptions/{subscriptionNumber}/customFields | Update subscription custom fields


# **d_elete_order**
> CommonResponseType d_elete_order(order_number, opts)

Delete order

**Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Deletes a specified order. All the subscriptions changed by this order are deleted. After the deletion, the subscriptions are rolled back to the previous version.   You are not allowed to delete an order if the charges that are affected by this order are invoiced. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::OrdersApi.new

order_number = 'order_number_example' # String | The number of the order to be deleted.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Delete order
  result = api_instance.d_elete_order(order_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->d_elete_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_number** | **String**| The number of the order to be deleted. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

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
require 'zuora'

api_instance = Zuora::OrdersApi.new

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  page: 1, # Integer | The page number of the orders retrieved.  
  page_size: 20 # Integer | Number of rows returned per page. 
  date_filter_option: 'date_filter_option_example', # String | The date type to filter on.This field value can be orderDate or updatedDate. Default is orderDate. 
  start_date: Date.parse('2013-10-20'), # Date | The result will only contain the orders with the date of dateFilterOption later than or equal to this date. 
  end_date: Date.parse('2013-10-20') # Date | The result will only contains orders with the date of dateFilterOption earlier than or equal to this date. 
}

begin
  #Get all orders
  result = api_instance.g_et_all_orders(opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->g_et_all_orders: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
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



# **g_et_breakdown_invoice_by_order**
> GetInvoiceAmountBreakdownByOrderResponse g_et_breakdown_invoice_by_order(invoice_number, opts)

Get breakdown of invoice by order

**Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.   Retrieves a specified invoice that is broken down by orders. The invoice items might be broken down into a list of order rated items. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::OrdersApi.new

invoice_number = 'invoice_number_example' # String | Number of invoice to be broken down.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get breakdown of invoice by order
  result = api_instance.g_et_breakdown_invoice_by_order(invoice_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->g_et_breakdown_invoice_by_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_number** | **String**| Number of invoice to be broken down. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**GetInvoiceAmountBreakdownByOrderResponse**](GetInvoiceAmountBreakdownByOrderResponse.md)

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
require 'zuora'

api_instance = Zuora::OrdersApi.new

order_number = 'order_number_example' # String | The order number to be retrieved.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get an order
  result = api_instance.g_et_order(order_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->g_et_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_number** | **String**| The order number to be retrieved. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

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
require 'zuora'

api_instance = Zuora::OrdersApi.new

order_number = 'order_number_example' # String | The order number.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  as_of_date: Date.parse('2013-10-20') # Date | Billing states of the order will be calculated as of this date. Invoices with the invoice date later than this date will not be counted into the billed amount. The default value is today.
}

begin
  #Get billing information for order
  result = api_instance.g_et_order_billing_info(order_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->g_et_order_billing_info: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_number** | **String**| The order number. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
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
require 'zuora'

api_instance = Zuora::OrdersApi.new

order_number = 'order_number_example' # String | The order number. 

subscription_number = 'subscription_number_example' # String | The subscription number you want to get the metrics for. 

start_date = Date.parse('2013-10-20') # Date | The start date of the date range for which you want to get the metrics. The date must be in yyyy-mm-dd format. For example, 2017-12-03. 

end_date = Date.parse('2013-10-20') # Date | The end date of the date range for which you want to get the metrics. The date must be in yyyy-mm-dd format. For example, 2017-12-03. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get order metrics for evergreen subscription
  result = api_instance.g_et_order_metricsfor_evergreen_subscription(order_number, subscription_number, start_date, end_date, opts)
  p result
rescue Zuora::ApiError => e
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
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

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
require 'zuora'

api_instance = Zuora::OrdersApi.new

order_number = 'order_number_example' # String | The order number.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Get rated result for order
  result = api_instance.g_et_order_rated_result(order_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->g_et_order_rated_result: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_number** | **String**| The order number. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

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
require 'zuora'

api_instance = Zuora::OrdersApi.new

account_number = 'account_number_example' # String | The invoice owner account number.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  page: 56, # Integer | The page number of the orders retrieved. The default is 1. 
  page_size: 20 # Integer | Number of rows returned per page. 
  date_filter_option: 'date_filter_option_example', # String | The date type to filter on. This field value can be orderDate or updatedDate. Default is orderDate. 
  start_date: Date.parse('2013-10-20'), # Date | The result will only contain the orders with the date of dateFilterOption later than or equal to this date. 
  end_date: Date.parse('2013-10-20') # Date | The result will only contain the orders with the date of dateFilterOption earlier than or equal to this date. 
}

begin
  #Get orders by invoice owner
  result = api_instance.g_et_orders_by_invoice_owner(account_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->g_et_orders_by_invoice_owner: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_number** | **String**| The invoice owner account number. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
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
require 'zuora'

api_instance = Zuora::OrdersApi.new

subscription_number = 'subscription_number_example' # String | The subscription number.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  page: 56, # Integer | The page number of the orders retrieved. The default is '1'. 
  page_size: 20 # Integer | Number of rows returned per page. 
  date_filter_option: 'date_filter_option_example', # String | The date type to filter on. This field value can be 'orderDate' or 'updatedDate'. Default is orderDate. 
  start_date: Date.parse('2013-10-20'), # Date | The result will only contain the orders with the date of 'dateFilterOption' later than or equal to this date. 
  end_date: Date.parse('2013-10-20') # Date | The result will only contain the orders with the date of 'dateFilterOption' earlier than or equal to this date. 
}

begin
  #Get orders by subscription number
  result = api_instance.g_et_orders_by_subscription_number(subscription_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->g_et_orders_by_subscription_number: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_number** | **String**| The subscription number. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
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
require 'zuora'

api_instance = Zuora::OrdersApi.new

account_number = 'account_number_example' # String | The subscription owner account number.

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  page: 56, # Integer | The page number of the orders retrieved. The default is 1. 
  page_size: 20 # Integer | Number of rows returned per page. 
  date_filter_option: 'date_filter_option_example', # String | The date type to filter on. This field value can be 'orderDate' or 'updatedDate'. Default is orderDate. 
  start_date: Date.parse('2013-10-20'), # Date | The result will only contain the orders with the date of 'dateFilterOption' later than or equal to this date. 
  end_date: Date.parse('2013-10-20') # Date | The result will only contain the orders with the date of 'dateFilterOption' earlier than or equal to this date. 
}

begin
  #Get orders by subscription owner
  result = api_instance.g_et_orders_by_subscription_owner(account_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->g_et_orders_by_subscription_owner: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_number** | **String**| The subscription owner account number. | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
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



# **g_et_subscription_term_info**
> GetSubscriptionTermInfoResponseType g_et_subscription_term_info(subscription_number, opts)

Get term information for subscription

**Note:** This feature is only available if you have the [Order Metrics](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/Orders_Generation_for_Subscriptions_and_Amendments) feature enabled. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/). We will investigate your use cases and data before enabling this feature for you. If you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled, you already have the Order Metrics feature enabled.  Retrieves the terms of the specified subscription. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::OrdersApi.new

subscription_number = 'subscription_number_example' # String | The number of the subscription to retrieve terms for. For example, A-S00000001. 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
  version: 56, # Integer | The version of the subscription to retrieve terms for. If you do not specify this parameter, Zuora returns the terms for the latest version of the subscription. 
  page: 1, # Integer | The page number of the terms retrieved. 
  page_size: 20 # Integer | Number of rows returned per page. 
}

begin
  #Get term information for subscription
  result = api_instance.g_et_subscription_term_info(subscription_number, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->g_et_subscription_term_info: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_number** | **String**| The number of the subscription to retrieve terms for. For example, A-S00000001.  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 
 **version** | **Integer**| The version of the subscription to retrieve terms for. If you do not specify this parameter, Zuora returns the terms for the latest version of the subscription.  | [optional] 
 **page** | **Integer**| The page number of the terms retrieved.  | [optional] [default to 1]
 **page_size** | **Integer**| Number of rows returned per page.  | [optional] [default to 20]

### Return type

[**GetSubscriptionTermInfoResponseType**](GetSubscriptionTermInfoResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ost_order**
> PostOrderResponseType p_ost_order(body, opts)

Create and activate order

**Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   You can use this operation to create subscriptions and make changes to subscriptions by creating orders. The following tutorials demonstrate how to use this operation:   * [Add a Product to a Subscription](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AC_Orders_Tutorials/A_Add_a_Product_to_a_Subscription)  * [Create a Ramp Deal](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AC_Orders_Tutorials/A_Create_a_Ramp_Deal)  * [Create a Subscription](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AC_Orders_Tutorials/A_Create_a_Subscription)  * [Change the Owner of a Subscription](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AC_Orders_Tutorials/C_Change_the_Owner_of_a_Subscription)  * [Change the Terms and Conditions of a Subscription](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AC_Orders_Tutorials/C_Change_the_Terms_and_Conditions_of_a_Subscription)  * [Renew a Subscription](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AC_Orders_Tutorials/C_Renew_a_Subscription)  * [Renew a Subscription and Upgrade a Product](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AC_Orders_Tutorials/C_Renew_a_Subscription_and_Upgrade_a_Product)  * [Replace a Product in a Subscription](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AC_Orders_Tutorials/C_Replace_a_Product_in_a_Subscription)  * [Update a Product in a Subscription](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AC_Orders_Tutorials/C_Update_a_Product_in_a_Subscription)  * [Cancel a Subscription](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AC_Orders_Tutorials/D_Cancel_a_Subscription)  * [Remove a Product from a Subscription](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/AC_Orders_Tutorials/D_Remove_a_Product_from_a_Subscription)  Creating a draft order is currently not supported. See [Known Limitations in Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders/C_Known_Limitations_in_Orders) for additional limitations. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::OrdersApi.new

body = Zuora::POSTOrderRequestType.new # POSTOrderRequestType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Create and activate order
  result = api_instance.p_ost_order(body, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->p_ost_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**POSTOrderRequestType**](POSTOrderRequestType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

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
require 'zuora'

api_instance = Zuora::OrdersApi.new

body = Zuora::POSTOrderPreviewRequestType.new # POSTOrderPreviewRequestType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Preview order
  result = api_instance.p_ost_preview_order(body, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->p_ost_preview_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**POSTOrderPreviewRequestType**](POSTOrderPreviewRequestType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**PostOrderPreviewResponseType**](PostOrderPreviewResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_update_order_custom_fields**
> CommonResponseType p_ut_update_order_custom_fields(order_number, body, opts)

Update order custom fields

**Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).   Updates the custom fields of a specified order. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::OrdersApi.new

order_number = 'order_number_example' # String | The order number.

body = Zuora::PUTOrderPatchRequestType.new # PUTOrderPatchRequestType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Update order custom fields
  result = api_instance.p_ut_update_order_custom_fields(order_number, body, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->p_ut_update_order_custom_fields: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_number** | **String**| The order number. | 
 **body** | [**PUTOrderPatchRequestType**](PUTOrderPatchRequestType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



# **p_ut_update_subscription_custom_fields**
> CommonResponseType p_ut_update_subscription_custom_fields(subscription_number, body, opts)

Update subscription custom fields

**Note:** This feature is only available if you have the [Orders](https://knowledgecenter.zuora.com/BC_Subscription_Management/Orders) feature enabled. We are actively soliciting feedback from a small set of early adopters. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).    Updates the custom fields of a specified subscription. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::OrdersApi.new

subscription_number = 'subscription_number_example' # String | The subscription number to be updated.

body = Zuora::PUTSubscriptionPatchRequestType.new # PUTSubscriptionPatchRequestType | 

opts = { 
  zuora_entity_ids: 'zuora_entity_ids_example' # String | An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header. 
}

begin
  #Update subscription custom fields
  result = api_instance.p_ut_update_subscription_custom_fields(subscription_number, body, opts)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OrdersApi->p_ut_update_subscription_custom_fields: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_number** | **String**| The subscription number to be updated. | 
 **body** | [**PUTSubscriptionPatchRequestType**](PUTSubscriptionPatchRequestType.md)|  | 
 **zuora_entity_ids** | **String**| An entity ID. If you have [Zuora Multi-entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity) enabled and the OAuth token is valid for more than one entity, you must use this header to specify which entity to perform the operation in. If the OAuth token is only valid for a single entity, or you do not have Zuora Multi-entity enabled, you do not need to set this header.  | [optional] 

### Return type

[**CommonResponseType**](CommonResponseType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: application/json; charset=utf-8



