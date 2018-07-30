# Zuora::POSTUsageType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_number** | **String** | The account number associated with the usage record. The customer account must be the subscription owner.  | 
**custom_fields** | [**CustomFields**](CustomFields.md) |  | [optional] 
**description** | **String** | The description of the usage record.  | [optional] 
**group_id** | **String** | The group ID used for [usage rating by group](https://knowledgecenter.zuora.com/CB_Billing/J_Billing_Operations/Usage/Usage_Rating_by_Group). Zuora groups the usage records based on the group ID when you choose the Custom Group option for usage rating.   **Note:** The Usage Rating by Group feature is in **Limited Availability**. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  | [optional] 
**quantity** | **Float** | The number of units the usage record is used.  | 
**start_date_time** | **DateTime** | The start date and time when the usage is consumed.   See [supported date and time format](https://knowledgecenter.zuora.com/CB_Billing/WA_Dates_in_Zuora/A_Date_and_dateTime_Format#section_2).  | 
**tag** | **String** | Specifies which subscription, charge, or account the usage record is related to.  The value of this field should be in the following formats:  - SubscriptionNumber:*value* - ChargeNumber:*value* - AccountNumber:*value*  For example, ChargeNumber:C-00000002  If the value of this field is in AccountNumber:*value* format, the value must be the same as the value of the &#x60;accountNumber&#x60; field.  | 
**unique_key** | **String** | A unique key of the usage record. You can define the unique key for each usage record.   | [optional] 
**unit_of_measure** | **String** | The unit used to measure the usage.  | 


