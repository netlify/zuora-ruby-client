# Zuora::PUTBasicSummaryJournalEntryType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**journal_entry_items** | [**Array&lt;PUTJournalEntryItemType&gt;**](PUTJournalEntryItemType.md) | Key name that represents the list of journal entry items.  | [optional] 
**notes** | **String** | Additional information about this record.  ***Character limit:*** 2,000  | [optional] 
**transferred_to_accounting** | **String** | Status shows whether the journal entry has been transferred to an accounting system.   This field cannot be changed after the summary journal entry has been canceled.  **Note:** The Zuora Finance ***Override Transferred to Accounting*** permission is required to change &#x60;transferredToAccounting&#x60; from &#x60;Yes&#x60; to any other value.  | [optional] 


