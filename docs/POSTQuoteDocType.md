# SwaggerClient::POSTQuoteDocType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**apiuser** | **String** | If not using Salesforce locale, this API Zuora user will be used to retrieve the locale from Zuora.  | [optional] 
**document_type** | **String** | Type of the document to generate: &#x60;PDF&#x60; or &#x60;DOC&#x60;.  | 
**locale** | **String** | Salesforce locale value to use.  | [optional] 
**password** | **String** |  | [optional] 
**quote_id** | **String** | ｜ Id of the quote。 | 
**sandbox** | **String** |  | [optional] 
**server_url** | **String** | SOAP URL used to login to Salesforce to get data. You can get the value with the following code in a Visualforce page: &#x60;{!$Api.Partner_Server_URL_100}&#x60;  | 
**session_id** | **String** | Salesforce session id used to log in to Salesforce to get data. You can get the value with the following code in a Visualforce page: *{!$Api.Session_ID}*  | 
**template_id** | **String** | Id of the quote template in Zuora.  | 
**token** | **String** |  | [optional] 
**use_sfdc_locale** | **String** | If using Salesforce org locale, set this to a value that is not null.  | [optional] 
**username** | **String** |  | [optional] 
**zquotes_major_version** | **String** | The major version number of Zuora Quotes you are generating the quote document in. You can use a quote template with hierarchy sizes bigger than 3 if this is set to 7 or higher.  | [optional] 
**zquotes_minor_version** | **String** | The minor version number of Zuora Quotes you are generating the quote document in.  | [optional] 


