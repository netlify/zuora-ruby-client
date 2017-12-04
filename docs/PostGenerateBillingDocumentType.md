# SwaggerClient::PostGenerateBillingDocumentType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**auto_post** | **BOOLEAN** | Determines whether to auto post the billing documents once the draft billing documents are generated.   If an error occurred during posting billing documents, the draft billing documents are not generated too.  | [optional] [default to false]
**effective_date** | **Date** | The date on which to generate the billing documents, in &#x60;yyyy-mm-dd&#x60; format.  | [optional] 
**subscription_ids** | **Array&lt;String&gt;** | The IDs of the subscriptions that you want to create the billing documents for.   | [optional] 
**target_date** | **Date** | The date used to determine which charges are to be billed, in &#x60;yyyy-mm-dd&#x60; format.  | [optional] 


