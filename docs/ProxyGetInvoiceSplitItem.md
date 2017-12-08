# Zuora::ProxyGetInvoiceSplitItem

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**created_by_id** | **String** |  The ID of the Zuora user who created the InvoiceSplitItem object. **Character limit**: 32 **Values**: automatically generated  | [optional] 
**created_date** | **DateTime** |  The date when the InvoiceSplitItem was created. **Values**: automatically generated  | [optional] 
**id** | **String** | Object identifier. | [optional] 
**invoice_date** | **Date** |  The generation date of the new split invoice, in &#x60;yyyy-mm-dd&#x60; format. **Character limit**: 29  | [optional] 
**invoice_id** | **String** |  The new invoice after the split. **Character limit**: 32 **Values**: automatically generated  | [optional] 
**invoice_split_id** | **String** |  The ID of the invoice split associated with the individual invoice split item. **Character limit**: 32 **Values**: a valid invoice split ID  | [optional] 
**payment_term** | **String** |  Indicates when the customer pays the split invoice. **Values**: a valid, active payment term  | [optional] 
**split_percentage** | **Float** |  Specifies the percentage of the original invoice that you want to be the balance of the split invoice. The total of the SplitPercentage field values for all of the InvoiceSplitItem objects in an InvoiceSplit object must equal 100. **Values**:  | [optional] 
**updated_by_id** | **String** |  The ID of the Zuora user who last updated the invoice split. **Character limit**: 32 **Values**: automatically generated  | [optional] 
**updated_date** | **DateTime** |  The date when the invoice split was last updated. **Values**: automatically generated  | [optional] 


