# Zuora::GETJournalRunType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**aggregate_currency** | **BOOLEAN** |  | [optional] 
**executed_on** | **DateTime** | Date and time the journal run was executed.  | [optional] 
**journal_entry_date** | **Date** | Date of the journal entry.  | [optional] 
**number** | **String** | Journal run number.  | [optional] 
**segmentation_rule_name** | **String** | Name of GL segmentation rule used in the journal run.  | [optional] 
**status** | **String** | Status of the journal run.   | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 
**target_end_date** | **Date** | The target end date of the journal run.  | [optional] 
**target_start_date** | **Date** | The target start date of the journal run.  | [optional] 
**total_journal_entry_count** | **Integer** | Total number of journal entries in the journal run.  | [optional] 
**transaction_types** | [**Array&lt;GETJournalRunTransactionType&gt;**](GETJournalRunTransactionType.md) | Transaction types included in the journal run.  | [optional] 


