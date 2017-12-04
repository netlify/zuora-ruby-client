# SwaggerClient::GETPaymentType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | Customer account ID.  | [optional] 
**account_name** | **String** | Customer account name.  | [optional] 
**account_number** | **String** | Customer account number.  | [optional] 
**amount** | **String** | Payment amount.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**effective_date** | **Date** | Effective payment date as _yyyy-mm-dd_.  | [optional] 
**gateway_transaction_number** | **String** | Transaction ID from payment gateway.  | [optional] 
**id** | **String** | PaymentID.  | [optional] 
**paid_invoices** | [**Array&lt;GETPaidInvoicesType&gt;**](GETPaidInvoicesType.md) | Information about one or more invoices to which this payment was applied:  | [optional] 
**payment_method_id** | **String** | Payment method.  | [optional] 
**payment_number** | **String** | Unique payment number.  | [optional] 
**status** | **String** | Possible values are: &#x60;Draft&#x60;, &#x60;Processing&#x60;, &#x60;Processed&#x60;, &#x60;Error&#x60;, &#x60;Voided&#x60;, &#x60;Canceled&#x60;, &#x60;Posted.  | [optional] 
**type** | **String** | Possible values are: &#x60;External&#x60;, &#x60;Electronic&#x60;.  | [optional] 


