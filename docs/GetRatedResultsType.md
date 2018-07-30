# Zuora::GetRatedResultsType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**count** | **Integer** | The number of data sets in the returned page of the response.   | [optional] 
**cursor** | **String** | The cursor indicator of the next page of data.   You can pass the value of the &#x60;cursor&#x60; field in as the cursor parameter for a subsequent call to get the next page of data. If there is no data after the current page, the cursor returns &#x60;null&#x60;.   | [optional] 
**data_set** | [**Array&lt;GETARatedResultType&gt;**](GETARatedResultType.md) |  | [optional] 
**has_more** | **BOOLEAN** | Whether the query results have more data after the current page.  | [optional] 


