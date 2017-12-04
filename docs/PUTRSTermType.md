# SwaggerClient::PUTRSTermType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**distribution_type** | **String** | How you want to distribute the revenue.    * Daily Distribution: Distributes revenue evenly across each day between the recognitionStart and recognitionEnd dates. * Monthly Distribution (Back Load): Back loads the revenue so you distribute the monthly amount in the partial month in the end only. * Monthly Distribution (Front Load): Front loads the revenue so you distribute the monthly amount in the partial month in the beginning only. * Monthly Distribution (Proration by Days): Splits the revenue amount between the two partial months.  **Note:** To use any of the Monthly Distribution options, you must have the \&quot;Monthly recognition over time\&quot; model enabled in **Settings &gt; Finance &gt; Manage Revenue Recognition Models** in the Zuora UI.  | [optional] 
**event_type** | **String** | Label of the revenue event type. Revenue event type labels can be duplicated. You can configure your revenue event type labels by navigating to **Settings &gt; Finance &gt; Configure Revenue Event Types** in the Zuora UI.  Note that &#x60;Credit Memo Posted&#x60; and &#x60;Debit Memo Posted&#x60; are only available if you enable the Advanced AR Settlement feature.  | [optional] 
**event_type_system_id** | **String** | System ID of the revenue event type. Each eventType has a unique system ID. You can configure your revenue event type system IDs by navigating to **Settings &gt; Finance &gt; Configure Revenue Event Types** in the Zuora UI.  | [optional] 
**notes** | **String** | Additional information about this record.  | [optional] 
**recognition_end** | **Date** | The end date of a recognition period in &#x60;yyyy-mm-dd&#x60; format.   The maximum difference between the &#x60;recognitionStart&#x60; and &#x60;recognitionEnd&#x60; date fields is equal to 250 multiplied by the length of an accounting period.  | 
**recognition_start** | **Date** | The start date of a recognition period in &#x60;yyyy-mm-dd&#x60; format.  If there is a closed accounting period between the &#x60;recognitionStart&#x60; and &#x60;recognitionEnd&#x60; dates, the revenue that would be placed in the closed accounting period is instead placed in the next open accounting period.  | 


