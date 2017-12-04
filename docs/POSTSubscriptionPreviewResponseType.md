# SwaggerClient::POSTSubscriptionPreviewResponseType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **String** | Invoice amount.  | [optional] 
**amount_without_tax** | **String** | Invoice amount minus tax.  | [optional] 
**charge_metrics** | [**POSTSubscriptionPreviewResponseTypeChargeMetrics**](POSTSubscriptionPreviewResponseTypeChargeMetrics.md) |  | [optional] 
**contracted_mrr** | **String** | Monthly recurring revenue of the subscription.  | [optional] 
**credit_memo** | [**POSTSubscriptionPreviewResponseTypeCreditMemo**](POSTSubscriptionPreviewResponseTypeCreditMemo.md) |  | [optional] 
**invoice** | **Object** | Container for invoices.    **Note:** This field is only available if you set the Zuora REST API minor version to 207.0 or later in the request header. Also, the response structure is changed and the following invoice related response fields are moved to this **invoice** container:       * amount    * amountWithoutTax    * taxAmount    * invoiceItems    * targetDate    * chargeMetrics      | [optional] 
**invoice_items** | [**Array&lt;POSTSubscriptionPreviewInvoiceItemsType&gt;**](POSTSubscriptionPreviewInvoiceItemsType.md) | Container for invoice items.  | [optional] 
**invoice_target_date** | **Date** | Date through which charges are calculated on the invoice, as yyyy-mm-dd.  **Note:** This field is only available if you do not specify the Zuora REST API minor version or specify the minor version to 186.0, 187.0, 188.0, 189.0, and 196.0. See [Zuora REST API Versions](https://www.zuora.com/developer/api-reference/#section/API-Versions) for more information.  | [optional] 
**preview_charge_metrics_response** | **String** |  | [optional] 
**success** | **BOOLEAN** | Returns &#x60;true&#x60; if the request was processed successfully.  | [optional] 
**target_date** | **Date** | Date through which to calculate charges if an invoice is generated, as yyyy-mm-dd. Default is current date.  **Note:** This field is only available if you set the Zuora REST API minor version to 207.0 or later in the request header. See [Zuora REST API Versions](https://www.zuora.com/developer/api-reference/#section/API-Versions) for more information.  | [optional] 
**tax_amount** | **String** | Tax amount on the invoice.  | [optional] 
**total_contracted_value** | **String** | Total contracted value of the subscription.  | [optional] 


