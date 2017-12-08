# Zuora::ProxyCreateProductRatePlan

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**description** | **String** | A description of the product rate plan. **Character limit**: 500 **Values**: a string of 500 characters or fewer  | [optional] 
**effective_end_date** | **Date** |  The date when the product rate plan expires and can&#39;t be subscribed to, in &#x60;yyyy-mm-dd&#x60; format. **Character limit**: 29  | [optional] 
**effective_start_date** | **Date** |  The date when the product rate plan becomes available and can be subscribed to, in &#x60;yyyy-mm-dd&#x60; format. **Character limit**: 29  | [optional] 
**name** | **String** | The name of the product rate plan. The name doesn&#39;t have to be unique in a Product Catalog, but the name has to be unique within a product. **Character limit**: 100 **Values**: a string of 100 characters or fewer  | 
**product_id** | **String** | The ID of the product that contains the product rate plan. **Character limit**: 32 **Values**: a string of 32 characters or fewer  | 


