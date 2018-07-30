# Zuora::GetRatedUsageResultsType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**count** | **Integer** | The number of data sets in the returned page of the response.   | [optional] 
**cursor** | **String** | The cursor indicator of the next page of data.    Pass the value of this field in as the &#x60;cursor&#x60; parameter for a subsequent call to get the next page of data. If there is no data after the current page, the cursor returns null.   | [optional] 
**data_set** | [**Array&lt;GetARatedUsageResultType&gt;**](GetARatedUsageResultType.md) |  | [optional] 
**has_more** | **BOOLEAN** | Whether the query results have more data after the current page.  | [optional] 


