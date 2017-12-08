# Zuora::POSTRevenueScheduleByTransactionRatablyTypeRevenueEvent

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**custom_fields_values** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**event_type** | **String** | The label of the revenue event type. Revenue event type labels can be duplicated. You can configure your revenue event type labels by navigating to **Settings &gt; Finance &gt; Configure Revenue Event Types** in the Zuora UI.  Note that &#x60;Credit Memo Posted&#x60; and &#x60;Debit Memo Posted&#x60; are only available if you enable the Advanced AR Settlement feature.  | [optional] 
**event_type_system_id** | **String** | System ID of the revenue event type. Each eventType has a unique system ID. You can configure your revenue event type system IDs by navigating to **Settings &gt; Finance &gt; Configure Revenue Event Types** in the Zuora UI.  Required only if there is more than one revenue event type with the same label.  | [optional] 
**notes** | **String** | Additional information about the revenue event.  | [optional] 


