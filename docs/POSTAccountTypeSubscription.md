# Zuora::POSTAccountTypeSubscription

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**cpq_bundle_json_id__qt** | **String** |  | [optional] 
**opportunity_close_date__qt** | **String** |  | [optional] 
**opportunity_name__qt** | **String** |  | [optional] 
**quote_business_type__qt** | **String** |  | [optional] 
**quote_number__qt** | **String** |  | [optional] 
**quote_type__qt** | **String** |  | [optional] 
**auto_renew** | **BOOLEAN** | If &#x60;true&#x60;, auto-renew is enabled. Default is &#x60;false&#x60;.  | [optional] 
**contract_effective_date** | **Date** | Effective contract date for this subscription, as &#x60;yyyy-mm-dd&#x60;.  | 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**customer_acceptance_date** | **Date** | The date on which the services or products within a subscription have been accepted by the customer, as &#x60;yyyy-mm-dd&#x60;.  Default value is dependent on the value of other fields. See Notes section for more details.  | [optional] 
**initial_term** | **Integer** | Duration of the initial subscription term in whole months.  Default is 0.   | [optional] 
**invoice_owner_account_key** | **String** | Invoice owner account number or ID.  **Note:** This feature is in Limited Availability. If you wish to have access to the feature, submit a request at [Zuora Global Support](https://support.zuora.com).   | [optional] 
**invoice_separately** | **BOOLEAN** | Separates a single subscription from other subscriptions and invoices the charge independently.   If the value is &#x60;true&#x60;, the subscription is billed separately from other subscriptions. If the value is &#x60;false&#x60;, the subscription is included with other subscriptions in the account invoice. The default value is &#x60;false&#x60;.  Prerequisite: The default subscription setting &#x60;Enable Subscriptions to be Invoiced Separately&#x60; must be set to &#x60;Yes&#x60;.  | [optional] 
**notes** | **String** |  | [optional] 
**renewal_term** | **Integer** | Duration of the renewal term in whole months. Default is 0.  | [optional] 
**service_activation_date** | **Date** | The date on which the services or products within a subscription have been activated and access has been provided to the customer, as &#x60;yyyy-mm-dd&#x60;.  Default value is dependent on the value of other fields. See Notes section for more details.  | [optional] 
**subscribe_to_rate_plans** | [**Array&lt;POSTSrpCreateType&gt;**](POSTSrpCreateType.md) | Container for one or more rate plans for this subscription.  | [optional] 
**subscription_number** | **String** | Subscription Number. The value can be up to 1000 characters.  If you do not specify a subscription number when creating a subscription for the new account, Zuora will generate a subscription number automatically.  If the account is created successfully, the subscription number is returned in the &#x60;subscriptionNumber&#x60; response field.  | [optional] 
**term_start_date** | **Date** | The date on which the subscription term begins, as &#x60;yyyy-mm-dd&#x60;. If this is a renewal subscription, this date is different from the subscription start date.  | [optional] 
**term_type** | **String** | Possible values are: &#x60;TERMED&#x60;, &#x60;EVERGREEN&#x60;.  | 


