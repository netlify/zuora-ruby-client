# Zuora::POSTRevenueScheduleByTransactionType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**notes** | **String** | Additional information about this record.  Character Limit: 2,000  | [optional] 
**revenue_distributions** | [**Array&lt;POSTDistributionItemType&gt;**](POSTDistributionItemType.md) | An array of revenue distributions. Represents how you want to distribute revenue for this revenue schedule. You can distribute revenue into a maximum of 250 accounting periods with one revenue schedule.  The sum of new Amounts must equal the the Charge Amount of the specified Invoice Item.  | [optional] 
**revenue_event** | [**POSTRevenueScheduleByTransactionTypeRevenueEvent**](POSTRevenueScheduleByTransactionTypeRevenueEvent.md) |  | [optional] 


