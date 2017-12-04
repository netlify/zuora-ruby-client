# SwaggerClient::ListOfExchangeRates

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**currency** | **String** | The exchange rate on the **providerExchangeRateDate**. The field name is the ISO currency code of the currency, for example, &#x60;EUR&#x60;.  There may be more than one currency returned for a given **providerExchangeRateDate**. If the rate for a certain currency is not available on the **providerExchangeRateDate**, the currency is not returned in the response.  | [optional] 
**provider_exchange_rate_date** | **Date** | The date of the exchange rate used. The date is in &#x60;yyyy-mm-dd&#x60; format.  Corresponds to the value specified in the Provider Exchange Rate Date column in the Import Foreign Exchange Rates template when you uploaded the rates through the Mass Updater.  | [optional] 


