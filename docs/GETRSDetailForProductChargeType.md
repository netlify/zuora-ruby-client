# Zuora::GETRSDetailForProductChargeType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | The ID of a customer account.  | [optional] 
**amount** | **String** | The revenue schedule amount, which is the sum of all revenue items.   This field cannot be null and must be formatted based on the currency, such as &#x60;JPY 30&#x60; or &#x60;USD 30.15&#x60;. Test out the currency to ensure you are using the proper formatting; otherwise, the response will fail and this error message is returned: &#x60;Allocation amount with wrong decimal places&#x60;.  | [optional] 
**created_on** | **DateTime** | The date and time when the record was created, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format.  | [optional] 
**currency** | **String** | The type of currency used.  | [optional] 
**custom_fields_values** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**linked_transaction_id** | **String** | The linked transaction ID for billing transactions. This field is used for all rules except for the custom unlimited or manual recognition rule models. If using the custom unlimited rule model, then the field value must be null. If the field is not null, then the referenceId field must be null.  | [optional] 
**linked_transaction_number** | **String** | The number for the linked invoice item, invoice item adjustment, or debit memo item transaction. This field is used for all rules except for the custom unlimited or manual recognition rule models. If using the custom unlimited or manual recognition rule models, then the field value is null.  | [optional] 
**linked_transaction_type** | **String** | The type of linked transaction for billing transactions, which can be invoice item, invoice item adjustment, or debit memo item. This field is used for all rules except for the custom unlimited or manual recognition rule models.  | [optional] 
**notes** | **String** | Additional information about this record.  | [optional] 
**number** | **String** | The revenue schedule number. The revenue schedule number is always prefixed with \&quot;RS\&quot;, for example, \&quot;RS-00000001\&quot;.  | [optional] 
**product_charge_id** | **String** | The ID of a product rate plan charge.  | [optional] 
**recognition_rule_name** | **String** | The name of the recognition rule.  | [optional] 
**recognized_revenue** | **String** | The revenue that was distributed in a closed accounting period.  | [optional] 
**reference_id** | **String** | The reference ID is used only in the custom unlimited rule to create a revenue schedule. In this scenario, the revenue schedule is not linked to a credit memo item.  | [optional] 
**revenue_items** | [**Array&lt;GETRsRevenueItemType&gt;**](GETRsRevenueItemType.md) | Revenue items are listed in ascending order by the accounting period start date.  | [optional] 
**revenue_schedule_date** | **Date** | The effective date of the revenue schedule. For example, the revenue schedule date for bookings-based revenue recognition is typically set to the order date or contract date.  The date cannot be in a closed accounting period. The date must be in &#x60;yyyy-mm-dd&#x60; format.  | [optional] 
**undistributed_unrecognized_revenue** | **String** | The revenue in the open-ended accounting period.  | [optional] 
**unrecognized_revenue** | **String** | The revenue distributed in all open accounting periods, which includes the open-ended accounting period.  | [optional] 
**updated_on** | **DateTime** | The date and time when the revenue automation start date was set, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format.  | [optional] 


