# Zuora::GETDebitMemoType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | The ID of the customer account associated with the debit memo.  | [optional] 
**amount** | **Float** | The total amount of the debit memo.  | [optional] 
**balance** | **Float** | The balance of the debit memo.  | [optional] 
**be_applied_amount** | **Float** | The amount that is applied to the debit memo.  | [optional] 
**cancelled_by_id** | **String** | The ID of the Zuora user who cancelled the debit memo.  | [optional] 
**cancelled_on** | **DateTime** | The date and time when the debit memo was cancelled, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format.  | [optional] 
**comment** | **String** | Comments about the debit memo.  | [optional] 
**created_by_id** | **String** | The ID of the Zuora user who created the debit memo.  | [optional] 
**created_date** | **DateTime** | The date and time when the debit memo was created, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-01 15:31:10.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**debit_memo_date** | **Date** | The date when the debit memo takes effect, in &#x60;yyyy-mm-dd&#x60; format. For example, 2017-05-20.  | [optional] 
**due_date** | **Date** | The date by which the payment for the debit memo is due, in &#x60;yyyy-mm-dd&#x60; format.  | [optional] 
**id** | **String** | The unique ID of the debit memo.  | [optional] 
**latest_pdf_file_id** | **String** | The ID of the latest PDF file generated for the debit memo.  | [optional] 
**number** | **String** | The unique identification number of the debit memo.  | [optional] 
**posted_by_id** | **String** | The ID of the Zuora user who posted the debit memo.   | [optional] 
**posted_on** | **DateTime** | The date and time when the debit memo was posted, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format.  | [optional] 
**reason_code** | **String** | A code identifying the reason for the transaction. The value must be an existing reason code or empty.  | [optional] 
**referred_invoice_id** | **String** | The ID of a referred invoice.  | [optional] 
**status** | **String** | The status of the debit memo.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully. | [optional] 
**target_date** | **Date** | The target date for the debit memo, in &#x60;yyyy-mm-dd&#x60; format. For example, 2017-07-20.  | [optional] 
**tax_amount** | **Float** | The amount of taxation.  | [optional] 
**total_tax_exempt_amount** | **Float** | The total amount of taxes or VAT for which the customer has an exemption.  | [optional] 
**transferred_to_accounting** | **String** | Whether the debit memo was transferred to an external accounting system.  | [optional] 
**updated_by_id** | **String** | The ID of the Zuora user who last updated the debit memo.  | [optional] 
**updated_date** | **DateTime** | The date and time when the debit memo was last updated, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-02 15:36:10.  | [optional] 


