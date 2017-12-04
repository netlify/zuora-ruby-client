# SwaggerClient::GETProductType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**category** | **String** | Category of the product. Used by Zuora Quotes Guided Product Selector.  Possible values are:   - Base Products   - Add On Services   - Miscellaneous Products  | [optional] 
**custom_field__c** | **String** | Any custom fields defined for this object. The custom field name is case-sensitive.  | [optional] 
**description** | **String** | Optional product description.  | [optional] 
**effective_end_date** | **Date** | The date when the product expires and cannot be subscribed to anymore, as &#x60;yyyy-mm-dd&#x60;.  | [optional] 
**effective_start_date** | **Date** | The date when the product becomes available and can be subscribed to, as &#x60;yyyy-mm-dd&#x60;.  | [optional] 
**id** | **String** | Product ID.  | [optional] 
**name** | **String** | Product name, up to 100 characters.  | [optional] 
**product_features** | [**Array&lt;GetProductFeatureType&gt;**](GetProductFeatureType.md) | Container for one or more product features. Only available when the following settings are enabled: - The Entitlements feature in your tenant - The Enable Feature Specification in Product and Subscriptions setting in Settings &gt; Billing  | [optional] 
**product_rate_plans** | [**Array&lt;GETProductRatePlanType&gt;**](GETProductRatePlanType.md) | Container for one or more product rate plans:  | [optional] 
**sku** | **String** | Unique product SKU, up to 50 characters.  | [optional] 
**tags** | **String** |  | [optional] 


