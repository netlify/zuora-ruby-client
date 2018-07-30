# Zuora::UsageImport

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**created_by** | **String** | The ID of the user who imported this usage file.  | [optional] 
**created_on** | **DateTime** | The date and time when you submit the request for importing the usage file.       | [optional] 
**description** | **String** | The description of the import file.   You can add some comments about the import file in this field. For example, &#x60;This import file contains 50 usage records related to four customer accounts.&#x60;  | [optional] 
**error** | **String** | The error message of the usage import failure.   The value of this field is the detailed error message if the usage import status is &#x60;FAILED&#x60;. Otherwise, the value of this field is &#x60;null&#x60;.  | [optional] 
**error_count** | **Float** | The number of usage records with validation errors.   If a validation error occurs in any usage record, no usage records will be imported from the usage import file.  | [optional] 
**id** | **String** | The ID of the usage import.  | [optional] 
**imported_count** | **Float** | The number of usage records that are imported successfully.   | [optional] 
**name** | **String** | The name of the import file.  | [optional] 
**process_end** | **DateTime** | The date and time when the file processing is completed.  | [optional] 
**process_start** | **DateTime** | The date and time when the file processing is started.  | [optional] 
**status** | **String** | The processing status of the usage import file.  | [optional] 
**total_count** | **Float** | The total number of usage records that are validated.  | [optional] 
**updated_by** | **String** | The ID of the user who updated the usage import file.  | [optional] 
**updated_on** | **DateTime** | The date and time when the progress of the file processing is updated.        | [optional] 


