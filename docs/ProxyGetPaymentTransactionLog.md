# SwaggerClient::ProxyGetPaymentTransactionLog

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**avs_response_code** | **String** | The response code returned by the payment gateway referring to the AVS international response of the payment transaction.  | [optional] 
**batch_id** | **String** | The ID of the batch used to send the transaction if the request was sent in a batch.  | [optional] 
**cvv_response_code** | **String** | The response code returned by the payment gateway referring to the CVV international response of the payment transaction.  | [optional] 
**gateway** | **String** | The name of the payment gateway used to transact the current payment transaction log.  | [optional] 
**gateway_reason_code** | **String** | The code returned by the payment gateway for the payment. This code is gateway-dependent.  | [optional] 
**gateway_reason_code_description** | **String** | The message returned by the payment gateway for the payment. This message is gateway-dependent.   | [optional] 
**gateway_state** | **String** | The state of the transaction at the payment gateway.  | [optional] 
**gateway_transaction_type** | **String** | The type of the transaction, either making a payment, or canceling a payment.   | [optional] 
**id** | **String** | The ID of the payment transaction log.  | [optional] 
**payment_id** | **String** | The ID of the payment wherein the payment transaction log was recorded.   | [optional] 
**request_string** | **String** | The payment transaction request string sent to the payment gateway.   | [optional] 
**response_string** | **String** | The payment transaction response string returned by the payment gateway.   | [optional] 
**transaction_date** | **DateTime** | The transaction date when the payment was performed.   | [optional] 
**transaction_id** | **String** | The transaction ID returned by the payment gateway. This field is used to reconcile payment transactions between the payment gateway and records in Zuora.  | [optional] 


