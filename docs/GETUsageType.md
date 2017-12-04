# SwaggerClient::GETUsageType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | Customer account ID.  | [optional] 
**account_name** | **String** | Customer account name.  | [optional] 
**account_number** | **String** | Customer account number.  | [optional] 
**charge_number** | **String** | Number of the rate-plan charge that pays for this usage.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**id** | **String** | Unique ID for the usage item.  | [optional] 
**quantity** | **String** | Number of units used.  | [optional] 
**source_name** | **String** | Source of the usage data. Possible values are: &#x60;Import&#x60;, &#x60;API&#x60;.  | [optional] 
**start_date_time** | **DateTime** | Start date of the time period in which usage is tracked. Zuora uses this field value to determine the usage date.  | [optional] 
**status** | **String** | Possible values are: &#x60;Importing&#x60;, &#x60;Pending&#x60;, &#x60;Processed&#x60;.  | [optional] 
**submission_date_time** | **DateTime** | Date when usage was submitted.  | [optional] 
**subscription_number** | **String** | Number of the subscription covering this usage.  | [optional] 
**unit_of_measure** | **String** | Unit used to measure consumption.  | [optional] 


