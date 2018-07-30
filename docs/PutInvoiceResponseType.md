# Zuora::PutInvoiceResponseType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | The ID of the customer account associated with the invoice.  | [optional] 
**amount** | **Float** | The total amount of the invoice.  | [optional] 
**auto_pay** | **BOOLEAN** | Whether invoices are automatically picked up for processing in the corresponding payment run.   | [optional] 
**balance** | **Float** | The balance of the invoice.  | [optional] 
**cancelled_by_id** | **String** | The ID of the Zuora user who cancelled the invoice.  | [optional] 
**cancelled_on** | **DateTime** | The date and time when the invoice was cancelled, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format.  | [optional] 
**comment** | **String** | Comments about the invoice.   | [optional] 
**created_by_id** | **String** | The ID of the Zuora user who created the invoice.  | [optional] 
**created_date** | **DateTime** | The date and time when the invoice was created, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-01 15:31:10.  | [optional] 
**credit_balance_adjustment_amount** | **Float** | **Note:** This filed is only available if you have the Credit Balance feature enabled and the Advanced AR Settlement feature disabled.  The currency amount of the adjustment applied to the customer&#39;s credit balance.  | [optional] 
**currency** | **String** | A currency defined in the web-based UI administrative settings.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**due_date** | **Date** | The date by which the payment for this invoice is due.   | [optional] 
**id** | **String** | The unique ID of the invoice.  | [optional] 
**invoice_date** | **Date** | The date on which to generate the invoice.  | [optional] 
**number** | **String** | The unique identification number of the invoice.  | [optional] 
**posted_by_id** | **String** | The ID of the Zuora user who posted the invoice.  | [optional] 
**posted_on** | **DateTime** | The date and time when the invoice was posted, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format.   | [optional] 
**status** | **String** | The status of the invoice.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 
**target_date** | **Date** | The target date for the invoice, in &#x60;yyyy-mm-dd&#x60; format. For example, 2017-07-20.   | [optional] 
**tax_amount** | **Float** | The amount of taxation.  | [optional] 
**total_tax_exempt_amount** | **Float** | The total amount of taxes or VAT for which the customer has an exemption.  | [optional] 
**transferred_to_accounting** | **String** | Whether the invoice was transferred to an external accounting system.  | [optional] 
**updated_by_id** | **String** | The ID of the Zuora user who last updated the invoice.  | [optional] 
**updated_date** | **DateTime** | The date and time when the invoice was last updated, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-02 15:36:10.  | [optional] 


