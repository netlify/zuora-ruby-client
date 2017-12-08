# Zuora::CreatePaymentType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | The ID of the customer account that the payment is created for.  | [optional] 
**amount** | **Float** | The total amount of the payment.  | 
**comment** | **String** | Additional information related to the payment.  | [optional] 
**currency** | **String** | A currency defined in the web-based UI administrative settings.  | 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**debit_memos** | [**Array&lt;PaymentDebitMemoApplicationCreateRequestType&gt;**](PaymentDebitMemoApplicationCreateRequestType.md) | Container for debit memos.  | [optional] 
**effective_date** | **Date** | The date when the payment takes effect, in &#x60;yyyy-mm-dd&#x60; format.  | [optional] 
**finance_information** | [**CreatePaymentTypeFinanceInformation**](CreatePaymentTypeFinanceInformation.md) |  | [optional] 
**gateway_id** | **String** | The ID of the gateway instance that processes the payment. When creating a payment, the ID must be a valid gateway instance name and this gateway must support the specific payment method. If not specified, the default gateway on the Account will be used.  | [optional] 
**invoices** | [**Array&lt;PaymentInvoiceApplicationCreateRequestType&gt;**](PaymentInvoiceApplicationCreateRequestType.md) | Container for invoices.  | [optional] 
**payment_method_id** | **String** | The unique ID of the payment method that the customer used to make the payment.  | 
**reference_id** | **String** | The transaction ID returned by the payment gateway. Use this field to reconcile payments between your gateway and Zuora Payments.  | [optional] 
**type** | **String** | The type of the payment.  | 


