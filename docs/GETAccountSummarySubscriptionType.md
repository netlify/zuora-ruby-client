# Zuora::GETAccountSummarySubscriptionType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**cpq_bundle_json_id__qt** | **String** |  | [optional] 
**opportunity_close_date__qt** | **String** |  | [optional] 
**opportunity_name__qt** | **String** |  | [optional] 
**quote_business_type__qt** | **String** |  | [optional] 
**quote_number__qt** | **String** |  | [optional] 
**quote_type__qt** | **String** |  | [optional] 
**auto_renew** | **BOOLEAN** | If &#x60;true&#x60;, auto-renew is enabled. If &#x60;false&#x60;, auto-renew is disabled.  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**id** | **String** | Subscription ID.  | [optional] 
**initial_term** | **String** | Duration of the initial subscription term in whole months.   | [optional] 
**rate_plans** | [**Array&lt;GETAccountSummarySubscriptionRatePlanType&gt;**](GETAccountSummarySubscriptionRatePlanType.md) | Container for rate plans for this subscription.  | [optional] 
**renewal_term** | **String** | Duration of the renewal term in whole months.  | [optional] 
**status** | **String** | Subscription status; possible values are: &#x60;Draft&#x60;, &#x60;PendingActivation&#x60;, &#x60;PendingAcceptance&#x60;, &#x60;Active&#x60;, &#x60;Cancelled&#x60;, &#x60;Expired&#x60;.  | [optional] 
**subscription_number** | **String** | Subscription Number.  | [optional] 
**subscription_start_date** | **Date** | Subscription start date.  | [optional] 
**term_end_date** | **Date** | End date of the subscription term. If the subscription is evergreen, this is either null or equal to the cancellation date, as appropriate.  | [optional] 
**term_start_date** | **Date** | Start date of the subscription term. If this is a renewal subscription, this date is different than the subscription start date.  | [optional] 
**term_type** | **String** | Possible values are: &#x60;TERMED&#x60;, &#x60;EVERGREEN&#x60;.  | [optional] 


