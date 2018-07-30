# Zuora::GETPaymentRunType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | The ID of the customer account associated with the payment run.  | [optional] 
**apply_credit_balance** | **BOOLEAN** | **Note:** This field is only available if you have the Credit Balance feature enabled and the Advanced AR Settlement feature disabled.  Whether to apply credit balances in the payment run. This field is only available when you have Advanced AR Settlement feature disabled.  | [optional] 
**auto_apply_credit_memo** | **BOOLEAN** | **Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Whether to automatically apply a posted credit memo to one or more receivables in the payment run.  | [optional] 
**auto_apply_unapplied_payment** | **BOOLEAN** | **Note:** The Advanced AR Settlement feature is in **Limited Availability**. This feature includes Unapplied Payments, Credit and Debit Memo, and Invoice Item Settlement. If you wish to have access to the feature, submit a request at [Zuora Global Support](http://support.zuora.com/).  Whether to automatically apply unapplied payments to  one or more receivables in the payment run.  | [optional] 
**batch** | **String** | The alias name given to a batch.  | [optional] 
**bill_cycle_day** | **Integer** | The billing cycle day (BCD), the day of the month when a bill run generates invoices for the account.   | [optional] 
**billing_run_id** | **String** | The ID of the bill run.  | [optional] 
**completed_on** | **DateTime** | The date and time when the payment run is completed, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-01 11:39:58.  | [optional] 
**consolidated_payment** | **BOOLEAN** | **Note:** The **Process Electronic Payment** permission also needs to be allowed for a Manage Payment Runs role to work. See [Payments Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/e_Payments_Roles) for more information.   Whether to process a single payment for all receivables that are due on an account.  | [optional] 
**created_by_id** | **String** | The ID of the Zuora user who created the payment run.  | [optional] 
**created_date** | **DateTime** | The date and time when the payment run was created, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-01 15:31:10.  | [optional] 
**currency** | **String** | A currency defined in the web-based UI administrative settings.  | [optional] 
**executed_on** | **DateTime** | The date and time when the payment run is executed, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-01 11:30:37.  | [optional] 
**id** | **String** | The ID of the payment run.  | [optional] 
**number** | **String** | The identification number of the payment run.  | [optional] 
**payment_gateway_id** | **String** | The ID of the gateway instance that processes the payment.  | [optional] 
**process_payment_with_closed_pm** | **BOOLEAN** | **Note:** The **Process Electronic Payment** permission also needs to be allowed for a Manage Payment Runs role to work. See [Payments Roles](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/User_Roles/e_Payments_Roles) for more information.   Whether to process payments even if the default payment method is closed.  | [optional] 
**run_date** | **DateTime** | The date and time when the scheduled payment run is to be executed for collecting payments.  | [optional] 
**status** | **String** | The status of the created payment run.  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 
**target_date** | **Date** | The target date used to determine which receivables to be collected in the payment run.   | [optional] 
**updated_by_id** | **String** | The ID of the Zuora user who last updated the payment run.  | [optional] 
**updated_date** | **DateTime** | The date and time when the payment run was last updated, in &#x60;yyyy-mm-dd hh:mm:ss&#x60; format. For example, 2017-03-02 15:36:10.  | [optional] 


