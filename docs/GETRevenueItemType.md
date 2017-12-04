# SwaggerClient::GETRevenueItemType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accounting_period_end_date** | **Date** | The accounting period end date. The accounting period end date of the open-ended accounting period is null.   | [optional] 
**accounting_period_name** | **String** | Name of the accounting period. The open-ended accounting period is named &#x60;Open-Ended&#x60;.   | [optional] 
**accounting_period_start_date** | **Date** | The accounting period start date.  | [optional] 
**amount** | **String** | The revenue schedule amount, which is the sum of all revenue items. This field cannot be null and must be formatted based on the currency, such as *JPY 30* or *USD 30.15*. Test out the currency to ensure you are using the proper formatting otherwise, the response will fail and this error message is returned:  &#x60;Allocation amount with wrong decimal places.&#x60;  | [optional] 
**currency** | **String** | The type of currency used.   | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**is_accounting_period_closed** | **BOOLEAN** | Indicates if the accounting period is closed or open.   | [optional] 


