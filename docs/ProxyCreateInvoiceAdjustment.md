# SwaggerClient::ProxyCreateInvoiceAdjustment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** |  The ID of the account that owns the invoice. **Character limit**: 32 **Values**: inherited from Account.ID for the invoice owner  | [optional] 
**accounting_code** | **String** | The accounting code for the invoice adjustment.  | [optional] 
**adjustment_date** | **Date** |  The date when the invoice adjustment is applied. This date must be the same as the invoice&#39;s date or later. **Character limit**: 29 **Values**: Leave null to automatically generate the current date  | [optional] 
**adjustment_number** | **String** |  A unique string to identify an individual invoice adjustment. **Character limit**: 255 **Values**: automatically generated  | [optional] 
**amount** | **Float** |  The amount of the invoice adjustment. **Character limit**: 16 **Values**: a valid currency amount  | 
**comments** | **String** |  Use this field to record comments about the invoice adjustment. **Character limit**: 255 **Values**: a string of 255 characters or fewer  | [optional] 
**customer_name** | **String** |  The name of the account that owns the associated invoice. **Character limit**: 50 **Values**: inherited from Account.Name  | [optional] 
**customer_number** | **String** |  The unique account number of the customer&#39;s account. **Character limit**: 70 **Values**: inherited from Account.AccountNumber  | [optional] 
**impact_amount** | **Float** |  The amount that changes the balance of the associated invoice. **Character limit**: 16 **Values**: automatically calculated  | [optional] 
**invoice_id** | **String** |  The ID of the invoice associated with the adjustment. This field is only required if you don&#39;t specify a value for the &#x60;InvoiceNumber&#x60; field. **Character limit**: 32 **Values**: a valid invoice ID  | [optional] 
**invoice_number** | **String** |  The unique identification number for the associated invoice. This field is only required if you don&#39;t specify a value for the &#x60;InvoiceId&#x60; field. **Character limit**: 32 **Values**: a valid invoice number  | [optional] 
**reason_code** | **String** |  A code identifying the reason for the transaction. Must be an existing reason code or empty. If you do not specify a value, Zuora uses the default reason code. **Character limit**: 32 **V****alues**: a valid reason code  | [optional] 
**reference_id** | **String** |  A code to reference an object external to Zuora. For example, you can use this field to reference a case number in an external system. **Character limit**: 60 **Values**: a string of 60 characters or fewer  | [optional] 
**status** | **String** |  The status of the invoice adjustment. This field is only required in the Query call, but is automatically generated in other calls. **Character limit**: 9 **Values**: &#x60;Canceled&#x60;, &#x60;Processed&#x60;  | [optional] 
**type** | **String** |  Indicates whether the adjustment credits or debits the invoice amount. **Character limit**: 6 **Values**: &#x60;Credit&#x60;, &#x60;Charge&#x60;  | 


