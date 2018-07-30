# Zuora::CustomFieldsDefinition

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**created_by_id** | **String** | The internal ID of the Zuora user who first set the schema.  | [optional] 
**created_date** | **DateTime** | The date and time when the schema was first set.  | [optional] 
**id** | **String** | The internal ID of the custom fields definition.  | [optional] 
**schema** | **Object** | The schema of the custom fields definition.  If the namespace is not &#x60;zuora&#x60;, the schema conforms to draft-04 of the [JSON Schema](http://json-schema.org/specification.html) specification.  If the namespace is &#x60;zuora&#x60;, the schema is based on draft-04 of the JSON Schema specification, but has the following Zuora-specific features:  * The schema has &#x60;\&quot;type\&quot;: \&quot;object\&quot;&#x60;. * Each property in the schema contains a string keyword called &#x60;label&#x60;. The value of &#x60;label&#x60; specifies the name of the property in the Zuora user interface. * The schema contains an array keyword called &#x60;readOnlyOnUI&#x60;. The value of &#x60;readOnlyOnUI&#x60; specifies which properties can be modified by users in the Zuora user interface. * The schema contains an array keyword called &#x60;indexed&#x60;. The value of &#x60;indexed&#x60; specifies which properties are indexed for improved performance. Non-indexed properties are functionally identical to indexed properties, but have lower performance. | [optional] 
**type** | **String** | The type of the custom fields definition. The type is unique within the namespace that contains the custom fields definition.  The value &#x60;_internal&#x60; indicates that no schema has been set for the custom fields definition.  | [optional] 
**updated_by_id** | **String** | The internal ID of the Zuora user who last set the schema.  | [optional] 
**updated_date** | **DateTime** | The date and time when the schema was last set.  | [optional] 


