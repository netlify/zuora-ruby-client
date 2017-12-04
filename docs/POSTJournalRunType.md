# SwaggerClient::POSTJournalRunType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accounting_period_name** | **String** | Name of the accounting period.  This field determines the target start and end dates of the journal run.  Required if you do not include &#x60;targetStartDate&#x60; and &#x60;targetEndDate&#x60;.  | [optional] 
**journal_entry_date** | **Date** | Date of the journal entry.  | 
**target_end_date** | **Date** | The target end date of the journal run.  If you include &#x60;accountingPeriodName&#x60;, the &#x60;targetEndDate&#x60; must be empty or the same as the end date of the accounting period specified in &#x60;accountingPeriodName&#x60;.  | [optional] 
**target_start_date** | **Date** | The target start date of the journal run.  Required if you include targetEndDate.  If you include &#x60;accountingPeriodName&#x60;, the &#x60;targetStartDate&#x60; must be empty or the same as the start date of the accounting period specified in &#x60;accountingPeriodName&#x60;.  | [optional] 
**transaction_types** | [**Array&lt;POSTJournalRunTransactionType&gt;**](POSTJournalRunTransactionType.md) | Transaction types included in the journal run.  You can include one or more transaction types.  | 


