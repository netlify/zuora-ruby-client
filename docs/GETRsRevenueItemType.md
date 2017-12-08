# Zuora::GETRsRevenueItemType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accounting_period_end_date** | **Date** | The accounting period end date. The accounting period end date of the open-ended accounting period is null.  | [optional] 
**accounting_period_name** | **String** | The name of the accounting period. The open-ended accounting period is named &#x60;Open-Ended&#x60;.  | [optional] 
**accounting_period_start_date** | **Date** | The accounting period start date.  | [optional] 
**amount** | **String** | The amount of the revenue item.  | [optional] 
**currency** | **String** | The type of currency used.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**deferred_revenue_accounting_code** | **String** | The accounting code for deferred revenue, such as Monthly Recurring Liability. Required only when &#x60;overrideChargeAccountingCodes&#x60; is &#x60;true&#x60;. Otherwise, this value is ignored.  | [optional] 
**deferred_revenue_accounting_code_type** | **String** | The type of the deferred revenue accounting code, such as Deferred Revenue. Required only when &#x60;overrideChargeAccountingCodes&#x60; is &#x60;true&#x60;. Otherwise, this value is ignored.  | [optional] 
**is_accounting_period_closed** | **BOOLEAN** | Indicates if the accounting period is closed or open.  | [optional] 
**recognized_revenue_accounting_code** | **String** | The accounting code for recognized revenue, such as Monthly Recurring Charges or Overage Charges. Required only when &#x60;overrideChargeAccountingCodes&#x60; is &#x60;true&#x60;. Otherwise, the value is ignored.  | [optional] 
**recognized_revenue_accounting_code_type** | **String** | The type of the recognized revenue accounting code, such as Sales Revenue or Sales Discount. Required only when &#x60;overrideChargeAccountingCodes&#x60; is &#x60;true&#x60;. Otherwise, this value is ignored.  | [optional] 


