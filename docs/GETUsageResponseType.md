# Zuora::GETUsageResponseType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_number** | **String** | The account number associated with this usage record.  | [optional] 
**created_by** | **String** | The ID of the user who created this usage record.  | [optional] 
**created_on** | **DateTime** | The start date and time when this usage record is created.  | [optional] 
**custom_fields** | [**CustomFields**](CustomFields.md) |  | [optional] 
**description** | **String** | The description of this usage record.  | [optional] 
**file_name** | **String** | The name of the import file when the usage record is imported from the file.  | [optional] 
**group_id** | **String** | The group ID used for [usage rating by group](https://knowledgecenter.zuora.com/CB_Billing/J_Billing_Operations/Usage/Usage_Rating_by_Group). Zuora groups the usage records based on the group ID when you choose the Custom Group option for usage rating.      **Note:** The Usage Rating by Group feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  | [optional] 
**id** | **String** | The ID of this usage record.  | [optional] 
**import_id** | **String** | The ID of the usage import if this usage record is imported through a usage file.   | [optional] 
**quantity** | **Float** | The number of units this usage record is used.  | [optional] 
**start_date_time** | **DateTime** | The start date and time when this usage is consumed.  | [optional] 
**status** | **String** | The status of this usage record.  | [optional] 
**tag** | **String** | Specifies which subscription, charge, or account this usage record is related to.  | [optional] 
**unique_key** | **String** | A unique key of this usage record. You can define the unique key for each usage record.   | [optional] 
**unit_of_measure** | **String** | The unit used to measure the usage.  | [optional] 
**updated_by** | **String** | The ID of the user who last updated this usage record.  | [optional] 
**updated_on** | **DateTime** | The date and time when this usage record is last updated.  | [optional] 


