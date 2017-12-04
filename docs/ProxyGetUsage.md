# SwaggerClient::ProxyGetUsage

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** |  The ID of the account associated with the usage data. This field is required if no value is specified for the &#x60;AccountNumber&#x60; field. **Character limit**: 32 **Values**: a valid account ID  | [optional] 
**account_number** | **String** |  The number of the account associated with the usage data. This field is required if no value is specified for the &#x60;AccountId&#x60; field. **Character limit**: 50 **Values**: a valid account number  | [optional] 
**charge_id** | **String** |  The OrginalId of the rate plan charge related to the usage record, e.g., &#x60;2c9081a03c63c94c013c6873357a0117&#x60; **Character limit**: 32 **Values**: a valid rate plan charge OriginalID  | [optional] 
**created_by_id** | **String** |  The user ID of the person who uploaded the usage records. **Character limit**: 32 **Values**: automatically generated  | [optional] 
**created_date** | **DateTime** |  The date when the invoice was generated. **Character limit**: 29 **Values**: automatically generated  | [optional] 
**end_date_time** | **DateTime** |  The end date and time of a range of time when usage is tracked. Use this field for reporting; this field doesn&#39;t affect usage calculation. **Character limit**: 29 **Values**: a valid date and time value  | [optional] 
**id** | **String** | Object identifier. | [optional] 
**quantity** | **Float** |  Indicates the number of units used. **Character limit**: 16 **Values**: a valid decimal amount equal to or greater than 0  | [optional] 
**rbe_status** | **String** |  Indicates if the rating and billing engine (RBE) processed usage data for an invoice. **Character limit**: 9 **Values**: automatically generated to be one of the following values: &#x60;Importing&#x60;, &#x60;Pending&#x60;, &#x60;Processed&#x60;  | [optional] 
**source_type** | **String** |  Indicates if the usage records were imported from the web-based UI or the API. **Character limit**: 6 **Values**: automatically generated to be one of the following values: &#x60;API&#x60;, &#x60;Import&#x60;  | [optional] 
**start_date_time** | **DateTime** |  The start date and time of a range of time when usage is tracked. Zuora uses this field value to determine the usage date. Unlike the &#x60;EndDateTime&#x60;, the &#x60;StartDateTime&#x60; field does affect usage calculation. **Character limit**: 29 **Values**: a valid date and time value  | [optional] 
**submission_date_time** | **DateTime** |  The date when usage was submitted. **Character limit**: 29 **Values**: automatically generated  | [optional] 
**subscription_id** | **String** |  The ID of the subscription that contains the fees related to the usage data. **Character limit**: 32 **Values**: a valid subscription ID  | [optional] 
**uom** | **String** |  Specifies the units to measure usage. Units of measure are configured in the web-based UI. Your values depend on your configuration in **Billing Settings**. **Character limit**: **Values**: a valid unit of measure  | [optional] 
**updated_by_id** | **String** |  The ID of the user who last updated the usage upload. **Character limit**: 32 **Values**: automatically generated  | [optional] 
**updated_date** | **DateTime** |  The date when the usage upload was last updated. **Character limit**: 29 **Values**: automatically generated  | [optional] 


