# SwaggerClient::Invoice

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** |  | [optional] 
**adjustment_amount** | **Float** |  The amount of the invoice adjustments associated with the invoice. **Character limi**t: 16   **Values**: a valid currency amount  | [optional] 
**amount** | **Float** |  The sum of all charges and taxes associated with the invoice.   **Character limit**: 16   **Values**: automatically generated  | [optional] 
**amount_without_tax** | **Float** |  The sum of all charges associated with the invoice. Taxes are excluded from this value.   **Character limit**: 16   **Values**: automatically generated  | [optional] 
**balance** | **Float** |  The remaining balance of the invoice after all payments, adjustments, and refunds are applied.   **Character limit**: 16   **Values**: automatically generated  | [optional] 
**bill_run_id** | **String** |  The ID of a Bill Run.   **Character limit**: 32   **Values**: a BillRun ID  | [optional] 
**body** | **String** |  Required  | [optional] 
**comments** | **String** |  Additional information related to the invoice that a Zuora user added to the invoice.   **Character limit**: 255 **Values:** a string of 255 characters or fewer  | [optional] 
**created_by_id** | **String** |  The user ID of the person who created the invoice. If a bill run generated the invoice, then the value is the user ID of person who created the bill run.   **Character limit**: 32   **Values**: automatically generated  | [optional] 
**created_date** | **DateTime** |  The date when the invoice was generated.   **Character limit**: 29   **Values**: automatically generated  | [optional] 
**credit_balance_adjustment_amount** | **Float** |  The currency amount of the adjustment applied to the customer&#39;s credit balance.   **Character limit**: 16   **Values**: a valid currency amount This field is only available if the [Zuora Global Support](http://support.zuora.com/) to enable this feature.    | [optional] 
**due_date** | **Date** |  The date by which the payment for this invoice is due.   **Character limit**: 29  | [optional] 
**includes_one_time** | **BOOLEAN** |  Specifies whether the invoice includes one-time charges. You can use this field only with the &#x60;generate &#x60; call for the Invoice object.   **Character limit**: 5   **Values**: automatically generated from one of the following: &#x60;True&#x60; (default), &#x60;False&#x60;  | [optional] 
**includes_recurring** | **BOOLEAN** |  Specifies whether the invoice includes recurring charges. You can use this field only with the &#x60;generate &#x60;call for the Invoice object.   **Character limit**: 5   **Values**: automatically generated from one of the following: &#x60;True&#x60; (default), &#x60;False&#x60;  | [optional] 
**includes_usage** | **BOOLEAN** |  Specifies whether the invoice includes usage charges. You can use this field only with the &#x60;generate &#x60;call for the Invoice object.   **Character limit**: 5   **Values**: automatically generated from one of the following: &#x60;True &#x60;(default), &#x60;False&#x60;  | [optional] 
**invoice_date** | **Date** |  Specifies the date on which to generate the invoice.   **Character limit**: 29  | [optional] 
**invoice_number** | **String** |  The unique identification number for the invoice. This number is returned as a string.   **Character limit**: 32   **Values**: automatically generated  | [optional] 
**last_email_sent_date** | **DateTime** |  The date when the invoice was last emailed.   **Character limit**: 29   **Values**: automatically generated  | [optional] 
**payment_amount** | **Float** |  The amount of payments applied to the invoice.   **Character limit**: 16 **Value**s: automatically generated  | [optional] 
**posted_by** | **String** |  The user ID of the person who moved the invoice to Posted status.   **Character limit**: 32   **Values**: automatically generated  | [optional] 
**posted_date** | **DateTime** |  The date when the invoice was posted. **Character limit:** 29   **Values**: automatically generated  | [optional] 
**refund_amount** | **Float** |  Specifies the amount of a refund that was applied against an earlier payment on the invoice.   **Character limit**: 16   **Values**: automatically generated  | [optional] 
**regenerate_invoice_pdf** | **BOOLEAN** |  Regenerates a PDF of an invoice that was already generated. Add this field to an &#x60;update &#x60; call to regenerate an invoice PDF. Note that when you set the &#x60;RegenerateInvoicePDF&#x60; field to &#x60;true&#x60;, you cannot update any other fields in the same &#x60;update &#x60; call. Otherwise, you will receive the following &#x60;INVALID_VALUE&#x60; error: &amp;quot;When field RegenerateInvoicePDF is set to true to regenerate the invoice PDF file, changes on other fields of the invoice are not allowed.&amp;quot;  **Character limit**: 5   **Values**: &#x60;True&#x60;, &#x60;False&#x60;  | [optional] 
**status** | **String** |  The status of the invoice in the system. This status is not the status of the payment of the invoice, just the status of the invoice itself.   **Character limit**: 8   **Values**: one of the following:  -  Draft (default, automatically set upon invoice creation)  -  Posted  -  Canceled   | [optional] 
**target_date** | **Date** |  This date is used to determine which charges are to be billed. All charges that are to be billed on this date or prior will be included in this bill run.   **Character limit**: 29  | [optional] 
**tax_amount** | **Float** |  The total amount of the taxes applied to the invoice.   **Character limit**: 16   **Values**: automatically generated  | [optional] 
**tax_exempt_amount** | **Float** |  The total amount of the invoice that is exempt from taxation.   **Character limit**: 16   **Values**: automatically generated  | [optional] 
**transferred_to_accounting** | **String** |  Specifies whether or not the invoice was transferred to an external accounting system, such as NetSuite.   **Character limit**: 10   **Values**: Processing, Yes, Error, Ignore  | [optional] 
**updated_by_id** | **String** |  | [optional] 
**updated_date** | **DateTime** |  The date when the invoice was last updated.   **Character limit**: 29   **Values**: automatically generated  | [optional] 


