# Zuora::GETRSDetailsByChargeType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**next_page** | **String** | URL to retrieve the next page of the response if it exists; otherwise absent.  | [optional] 
**revenue_schedules** | [**Array&lt;GETRSDetailWithoutSuccessType&gt;**](GETRSDetailWithoutSuccessType.md) | Represents how revenue will be recognized over time.  This contains the details of a revenue schedule. If you do not specify the &#x60;pageSize&#x60; variable, the default number of revenue schedules returned per invocation is 8, and if there are more than 8 revenue schedules to be returned, the &#x60;nextPage&#x60; field will provide a hyperlink to view the next page(s) of revenue events. The order of revenue schedules is descending by the &#x60;updatedOn&#x60; field.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 


