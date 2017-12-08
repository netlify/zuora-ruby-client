# Zuora::OAuthApi

All URIs are relative to *https://rest.zuora.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_token**](OAuthApi.md#create_token) | **POST** /oauth/token | Generate an OAuth token


# **create_token**
> TokenResponse create_token(client_id, client_secret, grant_type)

Generate an OAuth token

Generates a bearer token that enables an OAuth client to authenticate with the Zuora REST API. The OAuth client must have been created using the Zuora UI. See [Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication) for more information.  **Note:** When using this operation, do not set any authentication headers such as `Authorization`, `apiAccessKeyId`, or `apiSecretAccessKey`. 

### Example
```ruby
# load the gem
require 'zuora'

api_instance = Zuora::OAuthApi.new

client_id = "client_id_example" # String | The Client ID of the OAuth client. 

client_secret = "client_secret_example" # String | The Client Secret that was displayed when the OAuth client was created. 

grant_type = "grant_type_example" # String | The OAuth grant type that will be used to generate the token. The value of this parameter must be `client_credentials`. 


begin
  #Generate an OAuth token
  result = api_instance.create_token(client_id, client_secret, grant_type)
  p result
rescue Zuora::ApiError => e
  puts "Exception when calling OAuthApi->create_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **client_id** | **String**| The Client ID of the OAuth client.  | 
 **client_secret** | **String**| The Client Secret that was displayed when the OAuth client was created.  | 
 **grant_type** | **String**| The OAuth grant type that will be used to generate the token. The value of this parameter must be &#x60;client_credentials&#x60;.  | 

### Return type

[**TokenResponse**](TokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json; charset=utf-8



