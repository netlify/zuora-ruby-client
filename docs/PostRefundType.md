# SwaggerClient::PostRefundType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**comment** | **String** | Comments about the refund.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**finance_information** | [**PostRefundTypeFinanceInformation**](PostRefundTypeFinanceInformation.md) |  | [optional] 
**method_type** | **String** | How an external refund was issued to a customer. This field is required for an external refund and must be left empty for an electronic refund. You can issue an external refund on an electronic payment.  | [optional] 
**reason_code** | **String** | A code identifying the reason for the transaction. The value must be an existing reason code or empty. If you do not specify a value, Zuora uses the default reason code.  | [optional] 
**reference_id** | **String** | The transaction ID returned by the payment gateway for an electronic refund. Use this field to reconcile refunds between your gateway and Zuora Payments.  | [optional] 
**refund_date** | **Date** | The date when the refund takes effect, in &#x60;yyyy-mm-dd&#x60; format. The date of the refund cannot be before the payment date. Specify this field only for external refunds. Zuora automatically generates this field for electronic refunds.  | [optional] 
**second_refund_reference_id** | **String** | The transaction ID returned by the payment gateway if there is an additional transaction for the refund. Use this field to reconcile payments between your gateway and Zuora Payments.  | [optional] 
**total_amount** | **Float** | The total amount of the refund. The amount cannot exceed the unapplied amount of the associated payment. If the original payment was applied to one or more invoices or debit memos, you have to unapply a full or partial payment from the invoices or debit memos, and then refund the full or partial unapplied payment to your customers.   | 
**type** | **String** | The type of the refund.  | 


