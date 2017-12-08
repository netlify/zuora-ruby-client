# Zuora::GETCreditMemoTypewithSuccess

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | The ID of the customer account associated with the credit memo.  | [optional] 
**amount** | **Float** | The total amount of the credit memo.  | [optional] 
**applied_amount** | **Float** | The applied amount of the credit memo.  | [optional] 
**auto_apply_upon_posting** | **BOOLEAN** | Whether the credit memo automatically applies to the invoice upon posting.  | [optional] 
**cancelled_by_id** | **String** | The ID of the Zuora user who cancelled the credit memo.  | [optional] 
**cancelled_on** | **DateTime** | The date and time when the credit memo was cancelled, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format.  | [optional] 
**comment** | **String** | Comments about the credit memo.  | [optional] 
**created_by_id** | **String** | The ID of the Zuora user who created the credit memo.  | [optional] 
**created_date** | **DateTime** | The date and time when the credit memo was created, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-01 15:31:10.  | [optional] 
**credit_memo_date** | **Date** | The date when the credit memo takes effect, in &#x60;yyyy-mm-dd&#x60; format. For example, 2017-05-20.  | [optional] 
**currency** | **String** | A currency defined in the web-based UI administrative settings.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**exclude_from_auto_apply_rules** | **BOOLEAN** | Whether the credit memo is excluded from the rule of automatically applying credit memos to invoices.  | [optional] 
**id** | **String** | The unique ID of the credit memo.  | [optional] 
**latest_pdf_file_id** | **String** | The ID of the latest PDF file generated for the credit memo.  | [optional] 
**number** | **String** | The unique identification number of the credit memo.  | [optional] 
**posted_by_id** | **String** | The ID of the Zuora user who posted the credit memo.  | [optional] 
**posted_on** | **DateTime** | The date and time when the credit memo was posted, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format.  | [optional] 
**reason_code** | **String** | A code identifying the reason for the transaction. The value must be an existing reason code or empty.  | [optional] 
**referred_invoice_id** | **String** | The ID of a referred invoice.  | [optional] 
**refund_amount** | **Float** | The amount of the refund on the credit memo.  | [optional] 
**source** | **String** | The source of the credit memo.  | [optional] 
**source_id** | **String** | The ID of the credit memo source.  | [optional] 
**status** | **String** | The status of the credit memo.   | [optional] 
**target_date** | **Date** | The target date for the credit memo, in &#x60;yyyy-mm-dd&#x60; format. For example, 2017-07-20.  | [optional] 
**tax_amount** | **Float** | The amount of taxation.  | [optional] 
**total_tax_exempt_amount** | **Float** | The total amount of taxes or VAT for which the customer has an exemption.  | [optional] 
**transferred_to_accounting** | **String** | Whether the credit memo was transferred to an external accounting system.   | [optional] 
**unapplied_amount** | **Float** | The unapplied amount of the credit memo.  | [optional] 
**updated_by_id** | **String** | The ID of the Zuora user who last updated the credit memo.  | [optional] 
**updated_date** | **DateTime** | The date and time when the credit memo was last updated, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-02 15:36:10.  | [optional] 


