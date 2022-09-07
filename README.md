# zuora

Zuora - the Ruby gem for the Zuora API Reference

# Introduction

Welcome to the reference for the Zuora REST API!  

[REST](http://en.wikipedia.org/wiki/REST_API) is a web-service protocol that lends itself to rapid development by using everyday HTTP and JSON technology. The Zuora REST API provides a broad set of operations and resources that:
* Enable Web Storefront integration from your website.
* Support self-service subscriber sign-ups and account management.
* Process revenue schedules through custom revenue rule models.
* Enable manipulation of most objects in the Zuora Object Model.      

## Endpoints

The Zuora REST API is provided via the following endpoints.   

| Tenant              | Base URL for REST Endpoints |
|-------------------------|-------------------------|   
|US Production | https://rest.zuora.com   |
|US API Sandbox    | https://rest.apisandbox.zuora.com|
|US Performance Test | https://rest.pt1.zuora.com |
|EU Production | https://rest.eu.zuora.com |
|EU Sandbox | https://rest.sandbox.eu.zuora.com |

The production endpoint provides access to your live user data. The API Sandbox tenant is a good place to test your code without affecting real-world data. To use it, you must be provisioned with an API Sandbox tenant - your Zuora representative can help you if needed.

## Access to the API

If you have a Zuora tenant, you already have access to the API.

If you don't have a Zuora tenant, [click here](https://www.zuora.com/resource/zuora-test-drive) to sign up for a Production Test Drive tenant. The tenant comes with seed data, such as a sample product catalog. We recommend that you [create an API user](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/Manage_Users/Create_an_API_User) specifically for making API calls. Don't log in to the Zuora UI with this account. Logging in to the UI enables a security feature that periodically expires the account's password, which may eventually cause authentication failures with the API. 

> Note that a user role does not have write access to Zuora REST services unless it has the API Write Access permission as described in those instructions.

# API Changelog

You can find the changelog of the API Reference in the Zuora Community [here](https://community.zuora.com/t5/Developers/API-Changelog/gpm-p/18092).

# Authentication  

## OAuth v2.0  

Zuora recommends that you use OAuth v2.0 to authenticate to the Zuora REST API. Currently, OAuth is not available in every environment. See [Zuora Testing Environments](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/D_Zuora_Environments) for more information. 

Authenticating via OAuth requires the following steps: 

1. Create a Client 
2. Generate a Token  

### Create a Client  

You must first [create an OAuth client](https://knowledgecenter.zuora.com/CF_Users_and_Administrators/A_Administrator_Settings/Manage_Users#Create_an_OAuth_Client_for_a_User) in the Zuora UI. To do this, you must be an administrator of your Zuora tenant. This is a one-time operation. You will be provided with a Client ID and a Client Secret. Please note this information down, as it will be required for the next step.

**Note:** The OAuth client will be owned by a Zuora user account. If you want to perform PUT, POST, or DELETE operations using the OAuth client, the owner of the OAuth client must have a Platform role that includes the `API Write Access` permission.

### Generate a Token

After creating a client, you must make a call to obtain a bearer token using the [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) operation. This operation requires the following parameters: - `client_id` - the Client ID displayed when you created the OAuth client in the previous step - `client_secret` - the Client Secret displayed when you created the OAuth client in the previous step - `grant_type` - must be set to `client_credentials`

**Note**: The Client ID and Client Secret mentioned above were displayed when you created the OAuth Client in the prior step. The [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) response specifies how long the bearer token is valid for. 

Call [Generate an OAuth token](https://www.zuora.com/developer/api-reference/#operation/createToken) again to generate a new bearer token. For every subsequent API request, a valid bearer token must be provided in an HTTP header:  `Authorization: Bearer {bearer_token}`

## Other Supported Authentication Schemes  

Zuora continues to support the following additional legacy means of authentication:    
* Use username and password. 
* Authentication headers
* Authorization cookies

### Authentication headers

* Include authentication with each request in the header: 
 * `apiAccessKeyId`
 * `apiSecretAccessKey` 
 * `entityId` or `entityName` (Only for Zuora Multi-entity).

### Authorization cookie
The cookie authorizes the user to make calls to the REST API for the duration specified in `Administration > Security Policies > Session timeout`. The cookie expiration time is reset with this duration after every call to the REST API.

To obtain a cookie, call the REST `connections` resource with the following API user information:
* ID
* password
* entity Id or entity name (Only for Zuora Multi-entity)
* For CORS-enabled APIs only: Include a 'single-use' token in the request header, which re-authenticates the user with each request.

## Entity Id and Entity Name
The `entityId` and `entityName` parameters are only used for [Zuora Multi-entity](https://knowledgecenter.zuora.com/Billing/Tenant_Management/Multi-entity).

The  `entityId` and `entityName` parameters specify the Id and the [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access, respectively. 

Note that you must have permission to access the entity.   You can specify either the `entityId` or `entityName` parameter in the authentication to access and view an entity.    * If both `entityId` and `entityName` are specified in the authentication, an error occurs.

> If neither `entityId` nor `entityName` is specified in the authentication, you will log in to the entity in which your user account is created.

To get the entity Id and entity name, you can use the `GET` Entities REST call. 

For more information, see [API User Authentication](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/A_Overview_of_Multi-entity#API_User_Authentication).

### Token Authentication for CORS-Enabled APIs

The CORS mechanism enables REST API calls to Zuora to be made directly from your customer's browser, with all credit card and security information transmitted directly to Zuora. This minimizes your PCI compliance burden, allows you to implement advanced validation on your payment forms, and  makes your payment forms look just like any other part of your website.

For security reasons, instead of using cookies, an API request via CORS uses **tokens** for authentication. The token method of authentication is only designed for use with requests that must originate from your customer's browser; **it should  not be considered a replacement to the existing cookie authentication** mechanism. 

See [Zuora CORS REST](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/G_CORS_REST) for details on how CORS works and how you can begin to implement customer calls to the Zuora REST APIs. See [HMAC Signatures](https://www.zuora.com/developer/api-reference/#operation/POSTHMACSignature) for details on the HMAC method that returns the authentication token.

# Requests and Responses

## Request IDs  

As a general rule, when asked to supply a `key` for an account or subscription (`accountKey`, `account-key`, `subscriptionKey`, `subscription-key`), you can provide either the actual ID or  the number of the entity.

## HTTP Request Body

Most of the parameters and data accompanying your requests will be contained in the body of the HTTP request. The Zuora REST API accepts JSON in the HTTP request body. No other data format (e.g., XML) is supported.

### Data Type

([Actions](https://www.zuora.com/developer/api-reference/#tag/Actions) and CRUD operations only) 

We recommend that you do not specify the decimal values with quotation marks, commas, and spaces. Use characters of `+-0-9.eE`, for example, `5`, `1.9`, `-8.469`, and `7.7e2`. Also, Zuora does not convert currencies for decimal values.

## Testing a Request

Use a third party client, such as [curl](https://curl.haxx.se), [Postman](https://www.getpostman.com), or [Advanced REST Client](https://advancedrestclient.com), to test the Zuora REST API.

You can test the Zuora REST API from the Zuora API Sandbox or Production tenants. If connecting to Production, bear in mind that you are working with your live production data, not sample data or test data.

## Testing with Credit Cards

Sooner or later it will probably be necessary to test some transactions that involve credit cards. For suggestions on how to handle this, see [Going Live With Your Payment Gateway](https://knowledgecenter.zuora.com/CB_Billing/M_Payment_Gateways/C_Managing_Payment_Gateways/B_Going_Live_Payment_Gateways#Testing_with_Credit_Cards).

## Concurrent Request Limits

Zuora enforces tenant-level concurrent request limits. See [Concurrent Request Limits](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Policies/Concurrent_Request_Limits) for more information.

## Error Handling

Responses and error codes are detailed in [Responses and errors](https://knowledgecenter.zuora.com/DC_Developers/REST_API/A_REST_basics/3_Responses_and_errors).

# Pagination

When retrieving information (using `GET` methods), the optional `pageSize` query parameter sets the maximum number of rows to return in a response. The maximum is `40`; larger values are treated as `40`.

If this value is empty or invalid, `pageSize` typically defaults to `10`.

The default value for the maximum number of rows retrieved can be overridden at the method level. If more rows are available, the response will include a `nextPage` element, which contains a URL for requesting the next page. If this value is not provided, no more rows are available. No `previous page` element is explicitly provided; to support backward paging, use the previous call.

## Array Size

For data items that are not paginated, the REST API supports arrays of up to 300 rows. Thus, for instance, repeated pagination can retrieve thousands of customer accounts, but within any account an array of no more than 300 rate plans is returned.

# API Versions

The Zuora REST API are version controlled. Versioning ensures that Zuora REST API changes are backward compatible. Zuora uses a major and minor version nomenclature to manage changes. By specifying a version in a REST request, you can get expected responses regardless of future changes to the API.

## Major Version

The major version number of the REST API appears in the REST URL. Currently, Zuora only supports the **v1** major version. 

For example, `POST https://rest.zuora.com/v1/subscriptions`.

## Minor Version

Zuora uses minor versions for the REST API to control small changes. For example, a field in a REST method is deprecated and a new field is used to replace it. Some fields in the REST methods are supported as of minor versions. If a field is not noted with a minor version, this field is available for all minor versions. 

If a field is noted with a minor version, this field is in version control. You must specify the supported minor version in the request header to process without an error.

If a field is in version control, it is either with a minimum minor version or a maximum minor version, or both of them. You can only use this field with the minor version between the minimum and the maximum minor versions. For example, the `invoiceCollect` field in the POST Subscription method is in version control and its maximum minor version is 189.0. You can only use this field with the minor version 189.0 or earlier.

If you specify a version number in the request header that is not supported, Zuora will use the minimum minor version of the REST API. In our REST API documentation, if a field or feature requires a minor version number, we note that in the field description.

You only need to specify the version number when you use the fields require a minor version. To specify the minor version, set the `zuora-version` parameter to the minor version number in the request header for the request call. For example, the `collect` field is in 196.0 minor version. If you want to use this field for the `POST` Subscription method, set the  `zuora-version` parameter to `196.0` in the request header. 

The `zuora-version` parameter is case sensitive.

For all the REST API fields, by default, if the minor version is not specified in the request header, Zuora will use the minimum minor version of the REST API to avoid breaking your integration.

### Minor Version History

The supported minor versions are not serial. 

This section documents the changes made to each Zuora REST API minor version.

The following table lists the supported versions and the fields that have a Zuora REST API minor version.  

| Fields         | Minor Version      | REST Methods    | Description |
|:--------|:--------|:--------|:--------|
| invoiceCollect | 189.0 and earlier  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account)|Generates an invoice and collects a payment for a subscription. |
| collect        | 196.0 and later    | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription"); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account)|Collects an automatic payment for a subscription. |
| invoice | 196.0 and 207.0| [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account)|Generates an invoice for a subscription. |
| invoiceTargetDate | 196.0 and earlier  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview) |Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. |
| invoiceTargetDate | 207.0 and earlier  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account)|Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. |
| targetDate | 207.0 and later | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview \"Preview Subscription\") |Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. |
| targetDate | 211.0 and later | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account)|Date through which charges are calculated on the invoice, as `yyyy-mm-dd`. |
| includeExisting DraftInvoiceItems | 196.0 and earlier| [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription) | Specifies whether to include draft invoice items in subscription previews. Specify it to be `true` (default) to include draft invoice items in the preview result. Specify it to be `false` to excludes draft invoice items in the preview result. |
| includeExisting DraftDocItems | 207.0 and later  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription) | Specifies whether to include draft invoice items in subscription previews. Specify it to be `true` (default) to include draft invoice items in the preview result. Specify it to be `false` to excludes draft invoice items in the preview result. |
| previewType | 196.0 and earlier| [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription) | The type of preview you will receive. The possible values are `InvoiceItem`(default), `ChargeMetrics`, and `InvoiceItemChargeMetrics`. |
| previewType | 207.0 and later  | [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription) | The type of preview you will receive. The possible values are `LegalDoc`(default), `ChargeMetrics`, and `LegalDocChargeMetrics`. |
| runBilling  | 211.0 and later  | [Create Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_Subscription); [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription); [Renew Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_RenewSubscription); [Cancel Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_CancelSubscription); [Suspend Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_SuspendSubscription); [Resume Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_ResumeSubscription); [Create Account](https://www.zuora.com/developer/api-reference/#operation/POST_Account)|Generates an invoice or credit memo for a subscription. **Note:** Credit memos are only available if you have the Advanced AR Settlement feature enabled. |
| invoiceDate | 214.0 and earlier  | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment) |Date that should appear on the invoice being generated, as `yyyy-mm-dd`. |
| invoiceTargetDate | 214.0 and earlier  | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment) |Date through which to calculate charges on this account if an invoice is generated, as `yyyy-mm-dd`. |
| documentDate | 215.0 and later | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment) |Date that should appear on the invoice and credit memo being generated, as `yyyy-mm-dd`. | | targetDate | 215.0 and later | [Invoice and Collect](https://www.zuora.com/developer/api-reference/#operation/POST_TransactionInvoicePayment) |Date through which to calculate charges on this account if an invoice or a credit memo is generated, as `yyyy-mm-dd`. |

#### Version 207.0 and Later

The response structure of the [Preview Subscription](https://www.zuora.com/developer/api-reference/#operation/POST_SubscriptionPreview) and [Update Subscription](https://www.zuora.com/developer/api-reference/#operation/PUT_Subscription) methods are changed.

The following invoice related response fields are moved to the invoice container:
* `amount`
* `amountWithoutTax`
* `taxAmount`
* `invoiceItems`
* `targetDate`
* `chargeMetrics` 

# Zuora Object Model

The following diagram presents a high-level view of the key Zuora objects. Click the image to open it in a new tab to resize it.

<a href="https://www.zuora.com/wp-content/uploads/2017/01/ZuoraERD.jpeg" target="_blank\"><img src="https://www.zuora.com/wp-content/uploads/2017/01/ZuoraERD.jpeg" alt="Zuora Object Model Diagram"></a>

You can use the [Describe object](https://www.zuora.com/developer/api-reference/#operation/GET_Describe) operation to list the fields of each Zuora object that is available in your tenant. When you call the operation, you must specify the API name of the Zuora object.

The following table provides the API name of each Zuora object:  

| Object                                        | API Name                                   | 
|-----------------------------------------------|--------------------------------------------| 
| Account                                       | `Account`                                  |
| Accounting Code                               | `AccountingCode`                           |
| Accounting Period                             | `AccountingPeriod`                         |
| Amendment                                     | `Amendment`                                |
| Application Group                             | `ApplicationGroup`                         |
| Billing Run                                   | `BillingRun`                               |
| Contact                                       | `Contact`                                  |
| Contact Snapshot                              | `ContactSnapshot`                          |
| Credit Balance Adjustment                     | `CreditBalanceAdjustment`                  |
| Credit Memo                                   | `CreditMemo`                               |
| Credit Memo Application                       | `CreditMemoApplication`                    |
| Credit Memo Application Item                  | `CreditMemoApplicationItem`                |
| Credit Memo Item                              | `CreditMemoItem`                           |
| Credit Memo Part                              | `CreditMemoPart`                           |
| Credit Memo Part Item                         | `CreditMemoPartItem`                       |
| Credit Taxation Item                          | `CreditTaxationItem`                       |
| Custom Exchange Rate                          | `FXCustomRate`                             |
| Debit Memo                                    | `DebitMemo`                                |
| Debit Memo Item                               | `DebitMemoItem`                            |
| Debit Taxation Item                           | `DebitTaxationItem`                        |
| Discount Applied Metrics                      | `DiscountAppliedMetrics`                   |
| Entity                                        | `Tenant`                                   |
| Gateway Reconciliation Event                  | `PaymentGatewayReconciliationEventLog`     |
| Gateway Reconciliation Job                    | `PaymentReconciliationJob`                 |
| Gateway Reconciliation Log                    | `PaymentReconciliationLog`                 |
| Invoice                                       | `Invoice`                                  |
| Invoice Adjustment                            | `InvoiceAdjustment`                        |
| Invoice Item                                  | `InvoiceItem`                              |
| Invoice Item Adjustment                       | `InvoiceItemAdjustment`                    |
| Invoice Payment                               | `InvoicePayment`                           |
| Journal Entry                                 | `JournalEntry`                             |
| Journal Entry Item                            | `JournalEntryItem`                         |
| Journal Run                                   | `JournalRun`                               |
| Order                                         | `Order`                                    |
| Order Action                                  | `OrderAction`                              |
| Order MRR                                     | `OrderMrr`                                 |
| Order Quantity                                | `OrderQuantity`                            |
| Order TCB                                     | `OrderTcb`                                 |
| Order TCV                                     | `OrderTcv`                                 |
| Payment                                       | `Payment`                                  |
| Payment Application                           | `PaymentApplication`                       |
| Payment Application Item                      | `PaymentApplicationItem`                   |
| Payment Method                                | `PaymentMethod`                            |
| Payment Method Snapshot                       | `PaymentMethodSnapshot`                    |
| Payment Method Transaction Log                | `PaymentMethodTransactionLog`              |
| Payment Method Update                         | `UpdaterDetail`                            |
| Payment Part                                  | `PaymentPart`                              |
| Payment Part Item                             | `PaymentPartItem`                          |
| Payment Run                                   | `PaymentRun`                               |
| Payment Transaction Log                       | `PaymentTransactionLog`                    |
| Processed Usage                               | `ProcessedUsage`                           |
| Product                                       | `Product`                                  |
| Product Rate Plan                             | `ProductRatePlan`                          |
| Product Rate Plan Charge                      | `ProductRatePlanCharge`                    |
| Product Rate Plan Charge Tier                 | `ProductRatePlanChargeTier`                |
| Rate Plan                                     | `RatePlan`                                 |
| Rate Plan Charge                              | `RatePlanCharge`                           |
| Rate Plan Charge Tier                         | `RatePlanChargeTier`                       |
| Refund                                        | `Refund`                                   |
| Refund Application                            | `RefundApplication`                        |
| Refund Application Item                       | `RefundApplicationItem`                    |
| Refund Invoice Payment                        | `RefundInvoicePayment`                     |
| Refund Part                                   | `RefundPart`                               |
| Refund Part Item                              | `RefundPartItem`                           |
| Refund Transaction Log                        | `RefundTransactionLog`                     |
| Revenue Charge Summary                        | `RevenueChargeSummary`                     |
| Revenue Charge Summary Item                   | `RevenueChargeSummaryItem`                 |
| Revenue Event                                 | `RevenueEvent`                             |
| Revenue Event Credit Memo Item                | `RevenueEventCreditMemoItem`               |
| Revenue Event Debit Memo Item                 | `RevenueEventDebitMemoItem`                |
| Revenue Event Invoice Item                    | `RevenueEventInvoiceItem`                  |
| Revenue Event Invoice Item Adjustment         | `RevenueEventInvoiceItemAdjustment`        |
| Revenue Event Item                            | `RevenueEventItem`                         |
| Revenue Event Item Credit Memo Item           | `RevenueEventItemCreditMemoItem`           |
| Revenue Event Item Debit Memo Item            | `RevenueEventItemDebitMemoItem`            |
| Revenue Event Item Invoice Item               | `RevenueEventItemInvoiceItem`              |
| Revenue Event Item Invoice Item Adjustment    | `RevenueEventItemInvoiceItemAdjustment`    |
| Revenue Event Type                            | `RevenueEventType`                         |
| Revenue Schedule                              | `RevenueSchedule`                          |
| Revenue Schedule Credit Memo Item             | `RevenueScheduleCreditMemoItem`            |
| Revenue Schedule Debit Memo Item              | `RevenueScheduleDebitMemoItem`             |
| Revenue Schedule Invoice Item                 | `RevenueScheduleInvoiceItem`               |
| Revenue Schedule Invoice Item Adjustment      | `RevenueScheduleInvoiceItemAdjustment`     |
| Revenue Schedule Item                         | `RevenueScheduleItem`                      |
| Revenue Schedule Item Credit Memo Item        | `RevenueScheduleItemCreditMemoItem`        | 
| Revenue Schedule Item Debit Memo Item         | `RevenueScheduleItemDebitMemoItem`         |
| Revenue Schedule Item Invoice Item            | `RevenueScheduleItemInvoiceItem`           |
| Revenue Schedule Item Invoice Item Adjustment | `RevenueScheduleItemInvoiceItemAdjustment` |
| Subscription                                  | `Subscription`                             |
| Taxable Item Snapshot                         | `TaxableItemSnapshot`                      |
| Taxation Item                                 | `TaxationItem`                             |
| Updater Batch                                 | `UpdaterBatch`                             |
| Usage                                         | `Usage`                                    | 

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 2017-11-15
- Package version: 1.0.0
- Build package: io.swagger.codegen.languages.RubyClientCodegen

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build zuora.gemspec
```

Then either install the gem locally:

```shell
gem install ./zuora-1.0.0.gem
```
(for development, run `gem install --dev ./zuora-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

  gem 'zuora', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

  gem 'zuora', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'zuora'

api_instance = Zuora::AccountingCodesApi.new

ac_id = "ac_id_example" # String | ID of the accounting code you want to delete.

opts = { 
entity_id: "entity_id_example", # String | The Id of the entity that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
entity_name: "entity_name_example" # String | The [name of the entity](https://knowledgecenter.zuora.com/BB_Introducing_Z_Business/Multi-entity/B_Introduction_to_Entity_and_Entity_Hierarchy#Name_and_Display_Name) that you want to access. Note that you must have permission to access the entity. For more information, see [REST Authentication](https://www.zuora.com/developer/api-reference/#section/Authentication/Entity-Id-and-Entity-Name).
}

begin
#Delete accounting code
result = api_instance.delete_accounting_code(ac_id, opts)
p result
rescue Zuora::ApiError => e
puts "Exception when calling AccountingCodesApi->delete_accounting_code: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://rest.zuora.com*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*Zuora::AccountingCodesApi* | [**delete_accounting_code**](docs/AccountingCodesApi.md#delete_accounting_code) | **DELETE** /v1/accounting-codes/{ac-id} | Delete accounting code
*Zuora::AccountingCodesApi* | [**get_accounting_code**](docs/AccountingCodesApi.md#get_accounting_code) | **GET** /v1/accounting-codes/{ac-id} | Query an accounting code
*Zuora::AccountingCodesApi* | [**get_all_accounting_codes**](docs/AccountingCodesApi.md#get_all_accounting_codes) | **GET** /v1/accounting-codes | Get all accounting codes
*Zuora::AccountingCodesApi* | [**post_accounting_code**](docs/AccountingCodesApi.md#post_accounting_code) | **POST** /v1/accounting-codes | Create accounting code
*Zuora::AccountingCodesApi* | [**put_accounting_code**](docs/AccountingCodesApi.md#put_accounting_code) | **PUT** /v1/accounting-codes/{ac-id} | Update an accounting code
*Zuora::AccountingCodesApi* | [**put_activate_accounting_code**](docs/AccountingCodesApi.md#put_activate_accounting_code) | **PUT** /v1/accounting-codes/{ac-id}/activate | Activate accounting code
*Zuora::AccountingCodesApi* | [**put_deactivate_accounting_code**](docs/AccountingCodesApi.md#put_deactivate_accounting_code) | **PUT** /v1/accounting-codes/{ac-id}/deactivate | Deactivate accounting code
*Zuora::AccountingPeriodsApi* | [**delete_accounting_period**](docs/AccountingPeriodsApi.md#delete_accounting_period) | **DELETE** /v1/accounting-periods/{ap-id} | Delete accounting period
*Zuora::AccountingPeriodsApi* | [**get_accounting_period**](docs/AccountingPeriodsApi.md#get_accounting_period) | **GET** /v1/accounting-periods/{ap-id} | Get accounting period
*Zuora::AccountingPeriodsApi* | [**get_all_accounting_periods**](docs/AccountingPeriodsApi.md#get_all_accounting_periods) | **GET** /v1/accounting-periods | Get all accounting periods
*Zuora::AccountingPeriodsApi* | [**post_accounting_period**](docs/AccountingPeriodsApi.md#post_accounting_period) | **POST** /v1/accounting-periods | Create accounting period
*Zuora::AccountingPeriodsApi* | [**put_close_accounting_period**](docs/AccountingPeriodsApi.md#put_close_accounting_period) | **PUT** /v1/accounting-periods/{ap-id}/close | Close accounting period
*Zuora::AccountingPeriodsApi* | [**put_pending_close_accounting_period**](docs/AccountingPeriodsApi.md#put_pending_close_accounting_period) | **PUT** /v1/accounting-periods/{ap-id}/pending-close | Set accounting period to pending close
*Zuora::AccountingPeriodsApi* | [**put_reopen_accounting_period**](docs/AccountingPeriodsApi.md#put_reopen_accounting_period) | **PUT** /v1/accounting-periods/{ap-id}/reopen | Re-open accounting period
*Zuora::AccountingPeriodsApi* | [**put_run_trial_balance**](docs/AccountingPeriodsApi.md#put_run_trial_balance) | **PUT** /v1/accounting-periods/{ap-id}/run-trial-balance | Run trial balance
*Zuora::AccountingPeriodsApi* | [**put_update_accounting_period**](docs/AccountingPeriodsApi.md#put_update_accounting_period) | **PUT** /v1/accounting-periods/{ap-id} | Update accounting period
*Zuora::AccountsApi* | [**get_account**](docs/AccountsApi.md#get_account) | **GET** /v1/accounts/{account-key} | Get account
*Zuora::AccountsApi* | [**get_account_summary**](docs/AccountsApi.md#get_account_summary) | **GET** /v1/accounts/{account-key}/summary | Get account summary
*Zuora::AccountsApi* | [**object_delete_account**](docs/AccountsApi.md#object_delete_account) | **DELETE** /v1/object/account/{id} | CRUD: Delete Account
*Zuora::AccountsApi* | [**object_get_account**](docs/AccountsApi.md#object_get_account) | **GET** /v1/object/account/{id} | CRUD: Retrieve Account
*Zuora::AccountsApi* | [**object_post_account**](docs/AccountsApi.md#object_post_account) | **POST** /v1/object/account | CRUD: Create Account
*Zuora::AccountsApi* | [**object_put_account**](docs/AccountsApi.md#object_put_account) | **PUT** /v1/object/account/{id} | CRUD: Update Account
*Zuora::AccountsApi* | [**post_account**](docs/AccountsApi.md#post_account) | **POST** /v1/accounts | Create account
*Zuora::AccountsApi* | [**post_generate_billing_documents**](docs/AccountsApi.md#post_generate_billing_documents) | **POST** /v1/accounts/{id}/billing-documents/generate | Generate billing documents by account
*Zuora::AccountsApi* | [**put_account**](docs/AccountsApi.md#put_account) | **PUT** /v1/accounts/{account-key} | Update account
*Zuora::ActionsApi* | [**action_pos_tamend**](docs/ActionsApi.md#action_pos_tamend) | **POST** /v1/action/amend | Amend
*Zuora::ActionsApi* | [**action_pos_tcreate**](docs/ActionsApi.md#action_pos_tcreate) | **POST** /v1/action/create | Create
*Zuora::ActionsApi* | [**action_pos_tdelete**](docs/ActionsApi.md#action_pos_tdelete) | **POST** /v1/action/delete | Delete
*Zuora::ActionsApi* | [**action_pos_texecute**](docs/ActionsApi.md#action_pos_texecute) | **POST** /v1/action/execute | Execute
*Zuora::ActionsApi* | [**action_pos_tgenerate**](docs/ActionsApi.md#action_pos_tgenerate) | **POST** /v1/action/generate | Generate
*Zuora::ActionsApi* | [**action_pos_tquery**](docs/ActionsApi.md#action_pos_tquery) | **POST** /v1/action/query | Query
*Zuora::ActionsApi* | [**action_pos_tquery_more**](docs/ActionsApi.md#action_pos_tquery_more) | **POST** /v1/action/queryMore | QueryMore
*Zuora::ActionsApi* | [**action_pos_tsubscribe**](docs/ActionsApi.md#action_pos_tsubscribe) | **POST** /v1/action/subscribe | Subscribe
*Zuora::ActionsApi* | [**action_pos_tupdate**](docs/ActionsApi.md#action_pos_tupdate) | **POST** /v1/action/update | Update
*Zuora::AmendmentsApi* | [**get_amendments_by_key**](docs/AmendmentsApi.md#get_amendments_by_key) | **GET** /v1/amendments/{amendment-key} | Get amendments by key
*Zuora::AmendmentsApi* | [**get_amendments_by_subscription_id**](docs/AmendmentsApi.md#get_amendments_by_subscription_id) | **GET** /v1/amendments/subscriptions/{subscription-id} | Get amendments by subscription ID
*Zuora::AmendmentsApi* | [**object_delete_amendment**](docs/AmendmentsApi.md#object_delete_amendment) | **DELETE** /v1/object/amendment/{id} | CRUD: Delete amendment
*Zuora::AmendmentsApi* | [**object_get_amendment**](docs/AmendmentsApi.md#object_get_amendment) | **GET** /v1/object/amendment/{id} | CRUD: Get amendment
*Zuora::AmendmentsApi* | [**object_post_amendment**](docs/AmendmentsApi.md#object_post_amendment) | **POST** /v1/object/amendment | CRUD: Create amendment
*Zuora::AmendmentsApi* | [**object_put_amendment**](docs/AmendmentsApi.md#object_put_amendment) | **PUT** /v1/object/amendment/{id} | CRUD: Update amendment
*Zuora::AttachmentsApi* | [**delete_attachments**](docs/AttachmentsApi.md#delete_attachments) | **DELETE** /v1/attachments/{attachment-id} | Delete attachments
*Zuora::AttachmentsApi* | [**get_attachments**](docs/AttachmentsApi.md#get_attachments) | **GET** /v1/attachments/{attachment-id} | View attachments
*Zuora::AttachmentsApi* | [**get_attachments_list**](docs/AttachmentsApi.md#get_attachments_list) | **GET** /v1/attachments/{object-type}/{object-key} | View attachments list
*Zuora::AttachmentsApi* | [**post_attachments**](docs/AttachmentsApi.md#post_attachments) | **POST** /v1/attachments | Add attachments
*Zuora::AttachmentsApi* | [**put_attachments**](docs/AttachmentsApi.md#put_attachments) | **PUT** /v1/attachments/{attachment-id} | Edit attachments
*Zuora::BillRunApi* | [**object_delete_bill_run**](docs/BillRunApi.md#object_delete_bill_run) | **DELETE** /v1/object/bill-run/{id} | CRUD: Delete Bill Run
*Zuora::BillRunApi* | [**object_get_bill_run**](docs/BillRunApi.md#object_get_bill_run) | **GET** /v1/object/bill-run/{id} | CRUD: Retrieve Bill Run
*Zuora::BillRunApi* | [**object_post_bill_run**](docs/BillRunApi.md#object_post_bill_run) | **POST** /v1/object/bill-run | CRUD: Create Bill Run
*Zuora::BillRunApi* | [**object_put_bill_run**](docs/BillRunApi.md#object_put_bill_run) | **PUT** /v1/object/bill-run/{id} | CRUD: Post or Cancel Bill Run
*Zuora::BillRunApi* | [**post_email_billing_documentsfrom_bill_run**](docs/BillRunApi.md#post_email_billing_documentsfrom_bill_run) | **POST** /v1/bill-runs/{billRunId}/emails | Email billing documents generated from bill run
*Zuora::BillingDocumentsApi* | [**get_billing_documents**](docs/BillingDocumentsApi.md#get_billing_documents) | **GET** /v1/billing-documents | Get billing documents
*Zuora::BillingPreviewRunApi* | [**get_billing_preview_run**](docs/BillingPreviewRunApi.md#get_billing_preview_run) | **GET** /v1/billing-preview-runs/{billingPreviewRunId} | Get Billing Preview Run
*Zuora::BillingPreviewRunApi* | [**post_billing_preview_run**](docs/BillingPreviewRunApi.md#post_billing_preview_run) | **POST** /v1/billing-preview-runs | Create Billing Preview Run
*Zuora::CatalogApi* | [**get_catalog**](docs/CatalogApi.md#get_catalog) | **GET** /v1/catalog/products | Get product catalog
*Zuora::CatalogApi* | [**put_catalog**](docs/CatalogApi.md#put_catalog) | **PUT** /v1/catalog/products/{product-id}/share | Multi-entity: Share a Product with an Entity
*Zuora::ChargeRevenueSummariesApi* | [**get_crs_by_charge_id**](docs/ChargeRevenueSummariesApi.md#get_crs_by_charge_id) | **GET** /v1/charge-revenue-summaries/subscription-charges/{charge-key} | Get charge summary details by charge ID
*Zuora::ChargeRevenueSummariesApi* | [**get_crs_by_crs_number**](docs/ChargeRevenueSummariesApi.md#get_crs_by_crs_number) | **GET** /v1/charge-revenue-summaries/{crs-number} | Get charge summary details by CRS number
*Zuora::CommunicationProfilesApi* | [**object_get_communication_profile**](docs/CommunicationProfilesApi.md#object_get_communication_profile) | **GET** /v1/object/communication-profile/{id} | CRUD: Retrieve CommunicationProfile
*Zuora::ConnectionsApi* | [**post_connections**](docs/ConnectionsApi.md#post_connections) | **POST** /v1/connections | Establish connection to Zuora REST API service
*Zuora::ContactsApi* | [**object_delete_contact**](docs/ContactsApi.md#object_delete_contact) | **DELETE** /v1/object/contact/{id} | CRUD: Delete Contact
*Zuora::ContactsApi* | [**object_get_contact**](docs/ContactsApi.md#object_get_contact) | **GET** /v1/object/contact/{id} | CRUD: Retrieve Contact
*Zuora::ContactsApi* | [**object_post_contact**](docs/ContactsApi.md#object_post_contact) | **POST** /v1/object/contact | CRUD: Create Contact
*Zuora::ContactsApi* | [**object_put_contact**](docs/ContactsApi.md#object_put_contact) | **PUT** /v1/object/contact/{id} | CRUD: Update Contact
*Zuora::CreditBalanceAdjustmentsApi* | [**object_get_credit_balance_adjustment**](docs/CreditBalanceAdjustmentsApi.md#object_get_credit_balance_adjustment) | **GET** /v1/object/credit-balance-adjustment/{id} | CRUD: Retrieve CreditBalanceAdjustment
*Zuora::CreditMemosApi* | [**delete_credit_memo**](docs/CreditMemosApi.md#delete_credit_memo) | **DELETE** /v1/creditmemos/{creditMemoId} | Delete credit memo
*Zuora::CreditMemosApi* | [**get_breakdown_credit_memo_by_order**](docs/CreditMemosApi.md#get_breakdown_credit_memo_by_order) | **GET** /v1/creditmemos/{creditMemoNumber}/amountBreakdownByOrder | Get breakdown of credit memo by order
*Zuora::CreditMemosApi* | [**get_credit_memo**](docs/CreditMemosApi.md#get_credit_memo) | **GET** /v1/creditmemos/{creditMemoId} | Get credit memo
*Zuora::CreditMemosApi* | [**get_credit_memo_item**](docs/CreditMemosApi.md#get_credit_memo_item) | **GET** /v1/creditmemos/{creditMemoId}/items/{cmitemid} | Get credit memo item
*Zuora::CreditMemosApi* | [**get_credit_memo_item_part**](docs/CreditMemosApi.md#get_credit_memo_item_part) | **GET** /v1/creditmemos/{creditMemoId}/parts/{partid}/itemparts/{itempartid} | Get credit memo part item
*Zuora::CreditMemosApi* | [**get_credit_memo_item_parts**](docs/CreditMemosApi.md#get_credit_memo_item_parts) | **GET** /v1/creditmemos/{creditMemoId}/parts/{partid}/itemparts | Get credit memo part items
*Zuora::CreditMemosApi* | [**get_credit_memo_items**](docs/CreditMemosApi.md#get_credit_memo_items) | **GET** /v1/creditmemos/{creditMemoId}/items | Get credit memo items
*Zuora::CreditMemosApi* | [**get_credit_memo_part**](docs/CreditMemosApi.md#get_credit_memo_part) | **GET** /v1/creditmemos/{creditMemoId}/parts/{partid} | Get credit memo part
*Zuora::CreditMemosApi* | [**get_credit_memo_parts**](docs/CreditMemosApi.md#get_credit_memo_parts) | **GET** /v1/creditmemos/{creditMemoId}/parts | Get credit memo parts
*Zuora::CreditMemosApi* | [**get_credit_memos**](docs/CreditMemosApi.md#get_credit_memos) | **GET** /v1/creditmemos | Get credit memos
*Zuora::CreditMemosApi* | [**post_credit_memo_from_prpc**](docs/CreditMemosApi.md#post_credit_memo_from_prpc) | **POST** /v1/creditmemos | Create credit memo from charge
*Zuora::CreditMemosApi* | [**post_credit_memo_pdf**](docs/CreditMemosApi.md#post_credit_memo_pdf) | **POST** /v1/creditmemos/{creditMemoId}/pdfs | Create credit memo PDF
*Zuora::CreditMemosApi* | [**post_email_credit_memo**](docs/CreditMemosApi.md#post_email_credit_memo) | **POST** /v1/creditmemos/{creditMemoId}/emails | Email credit memo
*Zuora::CreditMemosApi* | [**post_refund_credit_memo**](docs/CreditMemosApi.md#post_refund_credit_memo) | **POST** /v1/creditmemos/{creditmemoId}/refunds | Refund credit memo
*Zuora::CreditMemosApi* | [**post_cm_taxation_items**](docs/CreditMemosApi.md#post_cm_taxation_items) | **POST** /v1/creditmemos/{creditMemoId}/taxationitems | Create taxation items for credit memo
*Zuora::CreditMemosApi* | [**put_apply_credit_memo**](docs/CreditMemosApi.md#put_apply_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/apply | Apply credit memo
*Zuora::CreditMemosApi* | [**put_cancel_credit_memo**](docs/CreditMemosApi.md#put_cancel_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/cancel | Cancel credit memo
*Zuora::CreditMemosApi* | [**put_post_credit_memo**](docs/CreditMemosApi.md#put_post_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/post | Post credit memo
*Zuora::CreditMemosApi* | [**put_unapply_credit_memo**](docs/CreditMemosApi.md#put_unapply_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId}/unapply | Unapply credit memo
*Zuora::CreditMemosApi* | [**put_update_credit_memo**](docs/CreditMemosApi.md#put_update_credit_memo) | **PUT** /v1/creditmemos/{creditMemoId} | Update credit memo
*Zuora::CustomExchangeRatesApi* | [**get_custom_exchange_rates**](docs/CustomExchangeRatesApi.md#get_custom_exchange_rates) | **GET** /v1/custom-exchange-rates/{currency} | Get custom foreign currency exchange rates
*Zuora::DebitMemosApi* | [**delete_debit_memo**](docs/DebitMemosApi.md#delete_debit_memo) | **DELETE** /v1/debitmemos/{debitMemoId} | Delete debit memo
*Zuora::DebitMemosApi* | [**get_debit_memo**](docs/DebitMemosApi.md#get_debit_memo) | **GET** /v1/debitmemos/{debitMemoId} | Get debit memo
*Zuora::DebitMemosApi* | [**get_debit_memo_item**](docs/DebitMemosApi.md#get_debit_memo_item) | **GET** /v1/debitmemos/{debitMemoId}/items/{dmitemid} | Get debit memo item
*Zuora::DebitMemosApi* | [**get_debit_memo_items**](docs/DebitMemosApi.md#get_debit_memo_items) | **GET** /v1/debitmemos/{debitMemoId}/items | Get debit memo items
*Zuora::DebitMemosApi* | [**get_debit_memos**](docs/DebitMemosApi.md#get_debit_memos) | **GET** /v1/debitmemos | Get debit memos
*Zuora::DebitMemosApi* | [**post_debit_memo_from_prpc**](docs/DebitMemosApi.md#post_debit_memo_from_prpc) | **POST** /v1/debitmemos | Create debit memo from charge
*Zuora::DebitMemosApi* | [**post_debit_memo_pdf**](docs/DebitMemosApi.md#post_debit_memo_pdf) | **POST** /v1/debitmemos/{debitMemoId}/pdfs | Create debit memo PDF
*Zuora::DebitMemosApi* | [**post_email_debit_memo**](docs/DebitMemosApi.md#post_email_debit_memo) | **POST** /v1/debitmemos/{debitMemoId}/emails | Email debit memo
*Zuora::DebitMemosApi* | [**post_dm_taxation_items**](docs/DebitMemosApi.md#post_dm_taxation_items) | **POST** /v1/debitmemos/{debitMemoId}/taxationitems | Create taxation items for debit memo
*Zuora::DebitMemosApi* | [**put_cancel_debit_memo**](docs/DebitMemosApi.md#put_cancel_debit_memo) | **PUT** /v1/debitmemos/{debitMemoId}/cancel | Cancel debit memo
*Zuora::DebitMemosApi* | [**put_debit_memo**](docs/DebitMemosApi.md#put_debit_memo) | **PUT** /v1/debitmemos/{debitMemoId} | Update debit memo
*Zuora::DebitMemosApi* | [**put_post_debit_memo**](docs/DebitMemosApi.md#put_post_debit_memo) | **PUT** /v1/debitmemos/{debitMemoId}/post | Post debit memo
*Zuora::DescribeApi* | [**get_describe**](docs/DescribeApi.md#get_describe) | **GET** /v1/describe/{object} | Describe object
*Zuora::EntitiesApi* | [**delete_entities**](docs/EntitiesApi.md#delete_entities) | **DELETE** /v1/entities/{id} | Multi-entity: Delete entity
*Zuora::EntitiesApi* | [**get_entities**](docs/EntitiesApi.md#get_entities) | **GET** /v1/entities | Multi-entity: Get entities
*Zuora::EntitiesApi* | [**get_entity_by_id**](docs/EntitiesApi.md#get_entity_by_id) | **GET** /v1/entities/{id} | Multi-entity: Get entity by Id
*Zuora::EntitiesApi* | [**post_entities**](docs/EntitiesApi.md#post_entities) | **POST** /v1/entities | Multi-entity: Create entity
*Zuora::EntitiesApi* | [**put_entities**](docs/EntitiesApi.md#put_entities) | **PUT** /v1/entities/{id} | Multi-entity: Update entity
*Zuora::EntitiesApi* | [**put_provision_entity**](docs/EntitiesApi.md#put_provision_entity) | **PUT** /v1/entities/{id}/provision | Multi-entity: Provision entity
*Zuora::EntityConnectionsApi* | [**get_entity_connections**](docs/EntityConnectionsApi.md#get_entity_connections) | **GET** /v1/entity-connections | Multi-entity: Get connections
*Zuora::EntityConnectionsApi* | [**post_entity_connections**](docs/EntityConnectionsApi.md#post_entity_connections) | **POST** /v1/entity-connections | Multi-entity: Initiate connection
*Zuora::EntityConnectionsApi* | [**put_entity_connections_accept**](docs/EntityConnectionsApi.md#put_entity_connections_accept) | **PUT** /v1/entity-connections/{connection-id}/accept | Multi-entity: Accept connection
*Zuora::EntityConnectionsApi* | [**put_entity_connections_deny**](docs/EntityConnectionsApi.md#put_entity_connections_deny) | **PUT** /v1/entity-connections/{connection-id}/deny | Multi-entity: Deny connection
*Zuora::EntityConnectionsApi* | [**put_entity_connections_disconnect**](docs/EntityConnectionsApi.md#put_entity_connections_disconnect) | **PUT** /v1/entity-connections/{connection-id}/disconnect | Multi-entity: Disconnect connection
*Zuora::ExportsApi* | [**object_get_export**](docs/ExportsApi.md#object_get_export) | **GET** /v1/object/export/{id} | CRUD: Retrieve Export
*Zuora::ExportsApi* | [**object_post_export**](docs/ExportsApi.md#object_post_export) | **POST** /v1/object/export | CRUD: Create Export
*Zuora::FeaturesApi* | [**object_delete_feature**](docs/FeaturesApi.md#object_delete_feature) | **DELETE** /v1/object/feature/{id} | CRUD: Delete Feature
*Zuora::FeaturesApi* | [**object_get_feature**](docs/FeaturesApi.md#object_get_feature) | **GET** /v1/object/feature/{id} | CRUD: Retrieve Feature
*Zuora::GetFilesApi* | [**get_files**](docs/GetFilesApi.md#get_files) | **GET** /v1/files/{file-id} | Get files
*Zuora::HMACSignaturesApi* | [**post_hmac_signatures**](docs/HMACSignaturesApi.md#post_hmac_signatures) | **POST** /v1/hmac-signatures | Return HMAC signatures
*Zuora::HostedPagesApi* | [**get_hosted_pages**](docs/HostedPagesApi.md#get_hosted_pages) | **GET** /v1/hostedpages | Return hosted pages
*Zuora::ImportsApi* | [**object_get_import**](docs/ImportsApi.md#object_get_import) | **GET** /v1/object/import/{id} | CRUD: Retrieve Import
*Zuora::InvoiceAdjustmentsApi* | [**object_delete_invoice_adjustment**](docs/InvoiceAdjustmentsApi.md#object_delete_invoice_adjustment) | **DELETE** /v1/object/invoice-adjustment/{id} | CRUD: Delete InvoiceAdjustment
*Zuora::InvoiceAdjustmentsApi* | [**object_get_invoice_adjustment**](docs/InvoiceAdjustmentsApi.md#object_get_invoice_adjustment) | **GET** /v1/object/invoice-adjustment/{id} | CRUD: Retrieve InvoiceAdjustment
*Zuora::InvoiceAdjustmentsApi* | [**object_post_invoice_adjustment**](docs/InvoiceAdjustmentsApi.md#object_post_invoice_adjustment) | **POST** /v1/object/invoice-adjustment | CRUD: Create InvoiceAdjustment
*Zuora::InvoiceAdjustmentsApi* | [**object_put_invoice_adjustment**](docs/InvoiceAdjustmentsApi.md#object_put_invoice_adjustment) | **PUT** /v1/object/invoice-adjustment/{id} | CRUD: Update InvoiceAdjustment
*Zuora::InvoiceItemAdjustmentsApi* | [**object_delete_invoice_item_adjustment**](docs/InvoiceItemAdjustmentsApi.md#object_delete_invoice_item_adjustment) | **DELETE** /v1/object/invoice-item-adjustment/{id} | CRUD: Delete InvoiceItemAdjustment
*Zuora::InvoiceItemAdjustmentsApi* | [**object_get_invoice_item_adjustment**](docs/InvoiceItemAdjustmentsApi.md#object_get_invoice_item_adjustment) | **GET** /v1/object/invoice-item-adjustment/{id} | CRUD: Retrieve InvoiceItemAdjustment
*Zuora::InvoiceItemsApi* | [**object_get_invoice_item**](docs/InvoiceItemsApi.md#object_get_invoice_item) | **GET** /v1/object/invoice-item/{id} | CRUD: Retrieve InvoiceItem
*Zuora::InvoicePaymentsApi* | [**object_get_invoice_payment**](docs/InvoicePaymentsApi.md#object_get_invoice_payment) | **GET** /v1/object/invoice-payment/{id} | CRUD: Retrieve InvoicePayment
*Zuora::InvoicePaymentsApi* | [**object_post_invoice_payment**](docs/InvoicePaymentsApi.md#object_post_invoice_payment) | **POST** /v1/object/invoice-payment | CRUD: Create InvoicePayment
*Zuora::InvoicePaymentsApi* | [**object_put_invoice_payment**](docs/InvoicePaymentsApi.md#object_put_invoice_payment) | **PUT** /v1/object/invoice-payment/{id} | CRUD: Update InvoicePayment
*Zuora::InvoiceSplitItemsApi* | [**object_get_invoice_split_item**](docs/InvoiceSplitItemsApi.md#object_get_invoice_split_item) | **GET** /v1/object/invoice-split-item/{id} | CRUD: Retrieve InvoiceSplitItem
*Zuora::InvoiceSplitsApi* | [**object_get_invoice_split**](docs/InvoiceSplitsApi.md#object_get_invoice_split) | **GET** /v1/object/invoice-split/{id} | CRUD: Retrieve InvoiceSplit
*Zuora::InvoicesApi* | [**get_breakdown_invoice_by_order**](docs/InvoicesApi.md#get_breakdown_invoice_by_order) | **GET** /v1/invoices/{invoiceNumber}/amountBreakdownByOrder | Get breakdown of invoice by order
*Zuora::InvoicesApi* | [**object_delete_invoice**](docs/InvoicesApi.md#object_delete_invoice) | **DELETE** /v1/object/invoice/{id} | CRUD: Delete Invoice
*Zuora::InvoicesApi* | [**object_get_invoice**](docs/InvoicesApi.md#object_get_invoice) | **GET** /v1/object/invoice/{id} | CRUD: Retrieve Invoice
*Zuora::InvoicesApi* | [**object_put_invoice**](docs/InvoicesApi.md#object_put_invoice) | **PUT** /v1/object/invoice/{id} | CRUD: Update Invoice
*Zuora::InvoicesApi* | [**post_credit_memo_from_invoice**](docs/InvoicesApi.md#post_credit_memo_from_invoice) | **POST** /v1/invoices/{invoiceId}/creditmemos | Create credit memo from invoice
*Zuora::InvoicesApi* | [**post_debit_memo_from_invoice**](docs/InvoicesApi.md#post_debit_memo_from_invoice) | **POST** /v1/invoices/{invoiceId}/debitmemos | Create debit memo from invoice
*Zuora::InvoicesApi* | [**post_email_invoice**](docs/InvoicesApi.md#post_email_invoice) | **POST** /v1/invoices/{invoiceId}/emails | Email invoice
*Zuora::InvoicesApi* | [**put_reverse_invoice**](docs/InvoicesApi.md#put_reverse_invoice) | **PUT** /v1/invoices/{invoiceId}/reverse | Reverse invoice
*Zuora::JournalRunsApi* | [**delete_journal_run**](docs/JournalRunsApi.md#delete_journal_run) | **DELETE** /v1/journal-runs/{jr-number} | Delete journal run
*Zuora::JournalRunsApi* | [**get_journal_run**](docs/JournalRunsApi.md#get_journal_run) | **GET** /v1/journal-runs/{jr-number} | Get journal run
*Zuora::JournalRunsApi* | [**post_journal_run**](docs/JournalRunsApi.md#post_journal_run) | **POST** /v1/journal-runs | Create journal run
*Zuora::JournalRunsApi* | [**put_journal_run**](docs/JournalRunsApi.md#put_journal_run) | **PUT** /v1/journal-runs/{jr-number}/cancel | Cancel journal run
*Zuora::MassUpdaterApi* | [**get_mass_updater**](docs/MassUpdaterApi.md#get_mass_updater) | **GET** /v1/bulk/{bulk-key} | Get mass action result
*Zuora::MassUpdaterApi* | [**post_mass_updater**](docs/MassUpdaterApi.md#post_mass_updater) | **POST** /v1/bulk | Perform mass action
*Zuora::MassUpdaterApi* | [**put_mass_updater**](docs/MassUpdaterApi.md#put_mass_updater) | **PUT** /v1/bulk/{bulk-key}/stop | Stop mass action
*Zuora::NotificationHistoryApi* | [**get_callout_history**](docs/NotificationHistoryApi.md#get_callout_history) | **GET** /v1/notification-history/callout | Get callout notification histories
*Zuora::NotificationHistoryApi* | [**get_email_history**](docs/NotificationHistoryApi.md#get_email_history) | **GET** /v1/notification-history/email | Get email notification histories
*Zuora::OAuthApi* | [**create_token**](docs/OAuthApi.md#create_token) | **POST** /oauth/token | Generate an OAuth token
*Zuora::OperationsApi* | [**post_billing_preview**](docs/OperationsApi.md#post_billing_preview) | **POST** /v1/operations/billing-preview | Create billing preview
*Zuora::OperationsApi* | [**post_transaction_invoice_payment**](docs/OperationsApi.md#post_transaction_invoice_payment) | **POST** /v1/operations/invoice-collect | Invoice and collect
*Zuora::OrdersApi* | [**delete_order**](docs/OrdersApi.md#delete_order) | **DELETE** /v1/orders/{orderNumber} | Delete order
*Zuora::OrdersApi* | [**get_all_orders**](docs/OrdersApi.md#get_all_orders) | **GET** /v1/orders | Get all orders
*Zuora::OrdersApi* | [**get_order**](docs/OrdersApi.md#get_order) | **GET** /v1/orders/{orderNumber} | Get an order
*Zuora::OrdersApi* | [**get_order_billing_info**](docs/OrdersApi.md#get_order_billing_info) | **GET** /v1/orders/{orderNumber}/billingInfo | Get billing information for order
*Zuora::OrdersApi* | [**get_order_metricsfor_evergreen_subscription**](docs/OrdersApi.md#get_order_metricsfor_evergreen_subscription) | **GET** /v1/orders/{orderNumber}/evergreenMetrics/{subscriptionNumber} | Get order metrics for evergreen subscription
*Zuora::OrdersApi* | [**get_order_rated_result**](docs/OrdersApi.md#get_order_rated_result) | **GET** /v1/orders/{orderNumber}/ratedResults | Get rated result for order
*Zuora::OrdersApi* | [**get_orders_by_invoice_owner**](docs/OrdersApi.md#get_orders_by_invoice_owner) | **GET** /v1/orders/invoiceOwner/{accountNumber} | Get orders by invoice owner
*Zuora::OrdersApi* | [**get_orders_by_subscription_number**](docs/OrdersApi.md#get_orders_by_subscription_number) | **GET** /v1/orders/subscription/{subscriptionNumber} | Get orders by subscription number
*Zuora::OrdersApi* | [**get_orders_by_subscription_owner**](docs/OrdersApi.md#get_orders_by_subscription_owner) | **GET** /v1/orders/subscriptionOwner/{accountNumber} | Get orders by subscription owner
*Zuora::OrdersApi* | [**post_order**](docs/OrdersApi.md#post_order) | **POST** /v1/orders | Create and activate order
*Zuora::OrdersApi* | [**post_preview_order**](docs/OrdersApi.md#post_preview_order) | **POST** /v1/orders/preview | Preview order
*Zuora::OrdersApi* | [**put_update_order_custom_fields**](docs/OrdersApi.md#put_update_order_custom_fields) | **PUT** /v1/orders/{orderNumber}/customFields | Update order custom fields
*Zuora::PaymentGatewaysApi* | [**get_paymentgateways**](docs/PaymentGatewaysApi.md#get_paymentgateways) | **GET** /v1/paymentgateways | Get payment gateways
*Zuora::PaymentMethodSnapshotsApi* | [**object_get_payment_method_snapshot**](docs/PaymentMethodSnapshotsApi.md#object_get_payment_method_snapshot) | **GET** /v1/object/payment-method-snapshot/{id} | CRUD: Retrieve PaymentMethodSnapshot
*Zuora::PaymentMethodTransactionLogsApi* | [**object_get_payment_method_transaction_log**](docs/PaymentMethodTransactionLogsApi.md#object_get_payment_method_transaction_log) | **GET** /v1/object/payment-method-transaction-log/{id} | CRUD: Retrieve PaymentMethodTransactionLog
*Zuora::PaymentMethodsApi* | [**delete_payment_methods**](docs/PaymentMethodsApi.md#delete_payment_methods) | **DELETE** /v1/payment-methods/{payment-method-id} | Delete payment method
*Zuora::PaymentMethodsApi* | [**get_payment_methods**](docs/PaymentMethodsApi.md#get_payment_methods) | **GET** /v1/payment-methods/credit-cards/accounts/{account-key} | Get payment methods
*Zuora::PaymentMethodsApi* | [**object_delete_payment_method**](docs/PaymentMethodsApi.md#object_delete_payment_method) | **DELETE** /v1/object/payment-method/{id} | CRUD: Delete payment method
*Zuora::PaymentMethodsApi* | [**object_get_payment_method**](docs/PaymentMethodsApi.md#object_get_payment_method) | **GET** /v1/object/payment-method/{id} | CRUD: Get payment method
*Zuora::PaymentMethodsApi* | [**object_post_payment_method**](docs/PaymentMethodsApi.md#object_post_payment_method) | **POST** /v1/object/payment-method | CRUD: Create payment method
*Zuora::PaymentMethodsApi* | [**object_put_payment_method**](docs/PaymentMethodsApi.md#object_put_payment_method) | **PUT** /v1/object/payment-method/{id} | CRUD: Update payment method
*Zuora::PaymentMethodsApi* | [**post_payment_methods**](docs/PaymentMethodsApi.md#post_payment_methods) | **POST** /v1/payment-methods/credit-cards | Create payment method
*Zuora::PaymentMethodsApi* | [**post_payment_methods_decryption**](docs/PaymentMethodsApi.md#post_payment_methods_decryption) | **POST** /v1/payment-methods/decryption | Create payment method decryption
*Zuora::PaymentMethodsApi* | [**put_payment_methods**](docs/PaymentMethodsApi.md#put_payment_methods) | **PUT** /v1/payment-methods/credit-cards/{payment-method-id} | Update payment method
*Zuora::PaymentMethodsApi* | [**put_verify_payment_methods**](docs/PaymentMethodsApi.md#put_verify_payment_methods) | **PUT** /v1/payment-methods/{payment-method-id}/verify | Verify payment method
*Zuora::PaymentTransactionLogsApi* | [**object_get_payment_transaction_log**](docs/PaymentTransactionLogsApi.md#object_get_payment_transaction_log) | **GET** /v1/object/payment-transaction-log/{id} | CRUD: Get payment transaction log
*Zuora::PaymentsApi* | [**delete_payment**](docs/PaymentsApi.md#delete_payment) | **DELETE** /v1/payments/{paymentId} | Delete payment
*Zuora::PaymentsApi* | [**get_payment**](docs/PaymentsApi.md#get_payment) | **GET** /v1/payments/{paymentId} | Get payment
*Zuora::PaymentsApi* | [**get_payment_item_part**](docs/PaymentsApi.md#get_payment_item_part) | **GET** /v1/payments/{paymentId}/parts/{partid}/itemparts/{itempartid} | Get payment part item
*Zuora::PaymentsApi* | [**get_payment_item_parts**](docs/PaymentsApi.md#get_payment_item_parts) | **GET** /v1/payments/{paymentId}/parts/{partid}/itemparts | Get payment part items
*Zuora::PaymentsApi* | [**get_payment_part**](docs/PaymentsApi.md#get_payment_part) | **GET** /v1/payments/{paymentId}/parts/{partid} | Get payment part
*Zuora::PaymentsApi* | [**get_payment_parts**](docs/PaymentsApi.md#get_payment_parts) | **GET** /v1/payments/{paymentId}/parts | Get payment parts
*Zuora::PaymentsApi* | [**get_retrieve_all_payments**](docs/PaymentsApi.md#get_retrieve_all_payments) | **GET** /v1/payments | Get all payments
*Zuora::PaymentsApi* | [**object_delete_payment**](docs/PaymentsApi.md#object_delete_payment) | **DELETE** /v1/object/payment/{id} | CRUD: Delete payment
*Zuora::PaymentsApi* | [**object_get_payment**](docs/PaymentsApi.md#object_get_payment) | **GET** /v1/object/payment/{id} | CRUD: Get payment
*Zuora::PaymentsApi* | [**object_post_payment**](docs/PaymentsApi.md#object_post_payment) | **POST** /v1/object/payment | CRUD: Create payment
*Zuora::PaymentsApi* | [**object_put_payment**](docs/PaymentsApi.md#object_put_payment) | **PUT** /v1/object/payment/{id} | CRUD: Update payment
*Zuora::PaymentsApi* | [**post_create_payment**](docs/PaymentsApi.md#post_create_payment) | **POST** /v1/payments | Create payment
*Zuora::PaymentsApi* | [**post_refund_payment**](docs/PaymentsApi.md#post_refund_payment) | **POST** /v1/payments/{paymentId}/refunds | Refund payment
*Zuora::PaymentsApi* | [**put_apply_payment**](docs/PaymentsApi.md#put_apply_payment) | **PUT** /v1/payments/{paymentId}/apply | Apply payment
*Zuora::PaymentsApi* | [**put_cancel_payment**](docs/PaymentsApi.md#put_cancel_payment) | **PUT** /v1/payments/{paymentId}/cancel | Cancel payment
*Zuora::PaymentsApi* | [**put_transfer_payment**](docs/PaymentsApi.md#put_transfer_payment) | **PUT** /v1/payments/{paymentId}/transfer | Transfer payment
*Zuora::PaymentsApi* | [**put_unapply_payment**](docs/PaymentsApi.md#put_unapply_payment) | **PUT** /v1/payments/{paymentId}/unapply | Unapply payment
*Zuora::PaymentsApi* | [**put_update_payment**](docs/PaymentsApi.md#put_update_payment) | **PUT** /v1/payments/{paymentId} | Update payment
*Zuora::ProductFeaturesApi* | [**object_delete_product_feature**](docs/ProductFeaturesApi.md#object_delete_product_feature) | **DELETE** /v1/object/product-feature/{id} | CRUD: Delete ProductFeature
*Zuora::ProductFeaturesApi* | [**object_get_product_feature**](docs/ProductFeaturesApi.md#object_get_product_feature) | **GET** /v1/object/product-feature/{id} | CRUD: Retrieve ProductFeature
*Zuora::ProductRatePlanChargeTiersApi* | [**object_get_product_rate_plan_charge_tier**](docs/ProductRatePlanChargeTiersApi.md#object_get_product_rate_plan_charge_tier) | **GET** /v1/object/product-rate-plan-charge-tier/{id} | CRUD: Retrieve ProductRatePlanChargeTier
*Zuora::ProductRatePlanChargesApi* | [**object_delete_product_rate_plan_charge**](docs/ProductRatePlanChargesApi.md#object_delete_product_rate_plan_charge) | **DELETE** /v1/object/product-rate-plan-charge/{id} | CRUD: Delete ProductRatePlanCharge
*Zuora::ProductRatePlanChargesApi* | [**object_get_product_rate_plan_charge**](docs/ProductRatePlanChargesApi.md#object_get_product_rate_plan_charge) | **GET** /v1/object/product-rate-plan-charge/{id} | CRUD: Retrieve ProductRatePlanCharge
*Zuora::ProductRatePlansApi* | [**object_delete_product_rate_plan**](docs/ProductRatePlansApi.md#object_delete_product_rate_plan) | **DELETE** /v1/object/product-rate-plan/{id} | CRUD: Delete ProductRatePlan
*Zuora::ProductRatePlansApi* | [**object_get_product_rate_plan**](docs/ProductRatePlansApi.md#object_get_product_rate_plan) | **GET** /v1/object/product-rate-plan/{id} | CRUD: Retrieve ProductRatePlan
*Zuora::ProductRatePlansApi* | [**object_post_product_rate_plan**](docs/ProductRatePlansApi.md#object_post_product_rate_plan) | **POST** /v1/object/product-rate-plan | CRUD: Create ProductRatePlan
*Zuora::ProductRatePlansApi* | [**object_put_product_rate_plan**](docs/ProductRatePlansApi.md#object_put_product_rate_plan) | **PUT** /v1/object/product-rate-plan/{id} | CRUD: Update ProductRatePlan
*Zuora::ProductsApi* | [**object_delete_product**](docs/ProductsApi.md#object_delete_product) | **DELETE** /v1/object/product/{id} | CRUD: Delete Product
*Zuora::ProductsApi* | [**object_get_product**](docs/ProductsApi.md#object_get_product) | **GET** /v1/object/product/{id} | CRUD: Retrieve Product
*Zuora::ProductsApi* | [**object_post_product**](docs/ProductsApi.md#object_post_product) | **POST** /v1/object/product | CRUD: Create Product
*Zuora::ProductsApi* | [**object_put_product**](docs/ProductsApi.md#object_put_product) | **PUT** /v1/object/product/{id} | CRUD: Update Product
*Zuora::QuotesDocumentApi* | [**post_quotes_document**](docs/QuotesDocumentApi.md#post_quotes_document) | **POST** /v1/quotes/document | Generate quotes document
*Zuora::RSASignaturesApi* | [**post_decrypt_rsa_signatures**](docs/RSASignaturesApi.md#post_decrypt_rsa_signatures) | **POST** /v1/rsa-signatures/decrypt | Decrypt RSA signature
*Zuora::RSASignaturesApi* | [**post_rsa_signatures**](docs/RSASignaturesApi.md#post_rsa_signatures) | **POST** /v1/rsa-signatures | Generate RSA signature
*Zuora::RatePlanChargeTiersApi* | [**object_get_rate_plan_charge_tier**](docs/RatePlanChargeTiersApi.md#object_get_rate_plan_charge_tier) | **GET** /v1/object/rate-plan-charge-tier/{id} | CRUD: Retrieve RatePlanChargeTier
*Zuora::RatePlanChargesApi* | [**object_get_rate_plan_charge**](docs/RatePlanChargesApi.md#object_get_rate_plan_charge) | **GET** /v1/object/rate-plan-charge/{id} | CRUD: Retrieve RatePlanCharge
*Zuora::RatePlansApi* | [**object_get_rate_plan**](docs/RatePlansApi.md#object_get_rate_plan) | **GET** /v1/object/rate-plan/{id} | CRUD: Retrieve RatePlan
*Zuora::RefundInvoicePaymentsApi* | [**object_get_refund_invoice_payment**](docs/RefundInvoicePaymentsApi.md#object_get_refund_invoice_payment) | **GET** /v1/object/refund-invoice-payment/{id} | CRUD: Retrieve RefundInvoicePayment
*Zuora::RefundTransactionLogsApi* | [**object_get_refund_transaction_log**](docs/RefundTransactionLogsApi.md#object_get_refund_transaction_log) | **GET** /v1/object/refund-transaction-log/{id} | CRUD: Retrieve RefundTransactionLog
*Zuora::RefundsApi* | [**delete_refund**](docs/RefundsApi.md#delete_refund) | **DELETE** /v1/refunds/{refundId} | Delete refund
*Zuora::RefundsApi* | [**get_refund**](docs/RefundsApi.md#get_refund) | **GET** /v1/refunds/{refundId} | Get refund
*Zuora::RefundsApi* | [**get_refund_item_part**](docs/RefundsApi.md#get_refund_item_part) | **GET** /v1/refunds/{refundId}/parts/{refundpartid}/itemparts/{itempartid} | Get refund part item
*Zuora::RefundsApi* | [**get_refund_item_parts**](docs/RefundsApi.md#get_refund_item_parts) | **GET** /v1/refunds/{refundId}/parts/{refundpartid}/itemparts | Get refund part items
*Zuora::RefundsApi* | [**get_refund_part**](docs/RefundsApi.md#get_refund_part) | **GET** /v1/refunds/{refundId}/parts/{refundpartid} | Get refund part
*Zuora::RefundsApi* | [**get_refund_parts**](docs/RefundsApi.md#get_refund_parts) | **GET** /v1/refunds/{refundId}/parts | Get refund parts
*Zuora::RefundsApi* | [**get_refunds**](docs/RefundsApi.md#get_refunds) | **GET** /v1/refunds | Get all refunds
*Zuora::RefundsApi* | [**object_delete_refund**](docs/RefundsApi.md#object_delete_refund) | **DELETE** /v1/object/refund/{id} | CRUD: Delete refund
*Zuora::RefundsApi* | [**object_get_refund**](docs/RefundsApi.md#object_get_refund) | **GET** /v1/object/refund/{id} | CRUD: Get refund
*Zuora::RefundsApi* | [**object_post_refund**](docs/RefundsApi.md#object_post_refund) | **POST** /v1/object/refund | CRUD: Create refund
*Zuora::RefundsApi* | [**object_put_refund**](docs/RefundsApi.md#object_put_refund) | **PUT** /v1/object/refund/{id} | CRUD: Update refund
*Zuora::RefundsApi* | [**put_cancel_refund**](docs/RefundsApi.md#put_cancel_refund) | **PUT** /v1/refunds/{refundId}/cancel | Cancel refund
*Zuora::RefundsApi* | [**put_update_refund**](docs/RefundsApi.md#put_update_refund) | **PUT** /v1/refunds/{refundId} | Update refund
*Zuora::RevenueEventsApi* | [**get_revenue_event_details**](docs/RevenueEventsApi.md#get_revenue_event_details) | **GET** /v1/revenue-events/{event-number} | Get revenue event details
*Zuora::RevenueEventsApi* | [**get_revenue_event_for_revenue_schedule**](docs/RevenueEventsApi.md#get_revenue_event_for_revenue_schedule) | **GET** /v1/revenue-events/revenue-schedules/{rs-number} | Get revenue events for a revenue schedule
*Zuora::RevenueItemsApi* | [**get_revenue_items_by_charge_revenue_event_number**](docs/RevenueItemsApi.md#get_revenue_items_by_charge_revenue_event_number) | **GET** /v1/revenue-items/revenue-events/{event-number} | Get revenue items by revenue event number
*Zuora::RevenueItemsApi* | [**get_revenue_items_by_charge_revenue_summary_number**](docs/RevenueItemsApi.md#get_revenue_items_by_charge_revenue_summary_number) | **GET** /v1/revenue-items/charge-revenue-summaries/{crs-number} | Get revenue items by charge revenue summary number
*Zuora::RevenueItemsApi* | [**get_revenue_items_by_revenue_schedule**](docs/RevenueItemsApi.md#get_revenue_items_by_revenue_schedule) | **GET** /v1/revenue-items/revenue-schedules/{rs-number} | Get revenue items by revenue schedule
*Zuora::RevenueItemsApi* | [**put_custom_fieldson_revenue_items_by_revenue_event**](docs/RevenueItemsApi.md#put_custom_fieldson_revenue_items_by_revenue_event) | **PUT** /v1/revenue-items/revenue-events/{event-number} | Update custom fields on revenue items by revenue event number
*Zuora::RevenueItemsApi* | [**put_custom_fieldson_revenue_items_by_revenue_schedule**](docs/RevenueItemsApi.md#put_custom_fieldson_revenue_items_by_revenue_schedule) | **PUT** /v1/revenue-items/revenue-schedules/{rs-number} | Update custom fields on revenue items by revenue schedule number
*Zuora::RevenueRulesApi* | [**get_revenue_rec_ruleby_product_rate_plan_charge**](docs/RevenueRulesApi.md#get_revenue_rec_ruleby_product_rate_plan_charge) | **GET** /v1/revenue-recognition-rules/product-charges/{charge-key} | Get revenue recognition rule by product rate plan charge
*Zuora::RevenueRulesApi* | [**get_revenue_rec_rules**](docs/RevenueRulesApi.md#get_revenue_rec_rules) | **GET** /v1/revenue-recognition-rules/subscription-charges/{charge-key} | Get revenue recognition rule by subscription charge
*Zuora::RevenueSchedulesApi* | [**delete_rs**](docs/RevenueSchedulesApi.md#delete_rs) | **DELETE** /v1/revenue-schedules/{rs-number} | Delete revenue schedule
*Zuora::RevenueSchedulesApi* | [**get_r_sby_credit_memo_item**](docs/RevenueSchedulesApi.md#get_r_sby_credit_memo_item) | **GET** /v1/revenue-schedules/credit-memo-items/{cmi-id} | Get revenue schedule by credit memo item ID 
*Zuora::RevenueSchedulesApi* | [**get_r_sby_debit_memo_item**](docs/RevenueSchedulesApi.md#get_r_sby_debit_memo_item) | **GET** /v1/revenue-schedules/debit-memo-items/{dmi-id} | Get revenue schedule by debit memo item ID 
*Zuora::RevenueSchedulesApi* | [**get_r_sby_invoice_item**](docs/RevenueSchedulesApi.md#get_r_sby_invoice_item) | **GET** /v1/revenue-schedules/invoice-items/{invoice-item-id} | Get revenue schedule by invoice item ID
*Zuora::RevenueSchedulesApi* | [**get_r_sby_invoice_item_adjustment**](docs/RevenueSchedulesApi.md#get_r_sby_invoice_item_adjustment) | **GET** /v1/revenue-schedules/invoice-item-adjustments/{invoice-item-adj-id}/ | Get revenue schedule by invoice item adjustment
*Zuora::RevenueSchedulesApi* | [**get_r_sby_product_charge_and_billing_account**](docs/RevenueSchedulesApi.md#get_r_sby_product_charge_and_billing_account) | **GET** /v1/revenue-schedules/product-charges/{charge-key}/{account-key} | Get all revenue schedules of product charge by charge ID and billing account ID 
*Zuora::RevenueSchedulesApi* | [**get_r_sfor_subsc_charge**](docs/RevenueSchedulesApi.md#get_r_sfor_subsc_charge) | **GET** /v1/revenue-schedules/subscription-charges/{charge-key} | Get revenue schedule by subscription charge
*Zuora::RevenueSchedulesApi* | [**get_rs**](docs/RevenueSchedulesApi.md#get_rs) | **GET** /v1/revenue-schedules/{rs-number} | Get revenue schedule details
*Zuora::RevenueSchedulesApi* | [**post_r_sfor_credit_memo_item_distribute_by_date_range**](docs/RevenueSchedulesApi.md#post_r_sfor_credit_memo_item_distribute_by_date_range) | **POST** /v1/revenue-schedules/credit-memo-items/{cmi-id}/distribute-revenue-with-date-range | Create revenue schedule for credit memo item (distribute by date range) 
*Zuora::RevenueSchedulesApi* | [**post_r_sfor_credit_memo_item_manual_distribution**](docs/RevenueSchedulesApi.md#post_r_sfor_credit_memo_item_manual_distribution) | **POST** /v1/revenue-schedules/credit-memo-items/{cmi-id} | Create revenue schedule for credit memo item (manual distribution) 
*Zuora::RevenueSchedulesApi* | [**post_r_sfor_debit_memo_item_distribute_by_date_range**](docs/RevenueSchedulesApi.md#post_r_sfor_debit_memo_item_distribute_by_date_range) | **POST** /v1/revenue-schedules/debit-memo-items/{dmi-id}/distribute-revenue-with-date-range | Create revenue schedule for debit memo item (distribute by date range) 
*Zuora::RevenueSchedulesApi* | [**post_r_sfor_debit_memo_item_manual_distribution**](docs/RevenueSchedulesApi.md#post_r_sfor_debit_memo_item_manual_distribution) | **POST** /v1/revenue-schedules/debit-memo-items/{dmi-id} | Create revenue schedule for debit memo item (manual distribution) 
*Zuora::RevenueSchedulesApi* | [**post_r_sfor_invoice_item_adjustment_distribute_by_date_range**](docs/RevenueSchedulesApi.md#post_r_sfor_invoice_item_adjustment_distribute_by_date_range) | **POST** /v1/revenue-schedules/invoice-item-adjustments/{invoice-item-adj-key}/distribute-revenue-with-date-range | Create revenue schedule for Invoice Item Adjustment (distribute by date range)
*Zuora::RevenueSchedulesApi* | [**post_r_sfor_invoice_item_adjustment_manual_distribution**](docs/RevenueSchedulesApi.md#post_r_sfor_invoice_item_adjustment_manual_distribution) | **POST** /v1/revenue-schedules/invoice-item-adjustments/{invoice-item-adj-key} | Create revenue schedule for Invoice Item Adjustment (manual distribution)
*Zuora::RevenueSchedulesApi* | [**post_r_sfor_invoice_item_distribute_by_date_range**](docs/RevenueSchedulesApi.md#post_r_sfor_invoice_item_distribute_by_date_range) | **POST** /v1/revenue-schedules/invoice-items/{invoice-item-id}/distribute-revenue-with-date-range | Create revenue schedule for Invoice Item (distribute by date range)
*Zuora::RevenueSchedulesApi* | [**post_r_sfor_invoice_item_manual_distribution**](docs/RevenueSchedulesApi.md#post_r_sfor_invoice_item_manual_distribution) | **POST** /v1/revenue-schedules/invoice-items/{invoice-item-id} | Create revenue schedule for Invoice Item (manual distribution)
*Zuora::RevenueSchedulesApi* | [**post_r_sfor_subsc_charge**](docs/RevenueSchedulesApi.md#post_r_sfor_subsc_charge) | **POST** /v1/revenue-schedules/subscription-charges/{charge-key} | Create revenue schedule on subscription charge
*Zuora::RevenueSchedulesApi* | [**put_revenue_across_ap**](docs/RevenueSchedulesApi.md#put_revenue_across_ap) | **PUT** /v1/revenue-schedules/{rs-number}/distribute-revenue-across-accounting-periods | Distribute revenue across accounting periods
*Zuora::RevenueSchedulesApi* | [**put_revenue_by_recognition_startand_end_dates**](docs/RevenueSchedulesApi.md#put_revenue_by_recognition_startand_end_dates) | **PUT** /v1/revenue-schedules/{rs-number}/distribute-revenue-with-date-range | Distribute revenue by recognition start and end dates
*Zuora::RevenueSchedulesApi* | [**put_revenue_specific_date**](docs/RevenueSchedulesApi.md#put_revenue_specific_date) | **PUT** /v1/revenue-schedules/{rs-number}/distribute-revenue-on-specific-date | Distribute revenue on specific date
*Zuora::RevenueSchedulesApi* | [**put_rs_basic_info**](docs/RevenueSchedulesApi.md#put_rs_basic_info) | **PUT** /v1/revenue-schedules/{rs-number}/basic-information | Update revenue schedule basic information
*Zuora::SettingsApi* | [**get_revenue_automation_start_date**](docs/SettingsApi.md#get_revenue_automation_start_date) | **GET** /v1/settings/finance/revenue-automation-start-date | Get the revenue automation start date
*Zuora::SubscriptionProductFeaturesApi* | [**object_get_subscription_product_feature**](docs/SubscriptionProductFeaturesApi.md#object_get_subscription_product_feature) | **GET** /v1/object/subscription-product-feature/{id} | CRUD: Retrieve SubscriptionProductFeature
*Zuora::SubscriptionsApi* | [**get_subscriptions_by_account**](docs/SubscriptionsApi.md#get_subscriptions_by_account) | **GET** /v1/subscriptions/accounts/{account-key} | Get subscriptions by account
*Zuora::SubscriptionsApi* | [**get_subscriptions_by_key**](docs/SubscriptionsApi.md#get_subscriptions_by_key) | **GET** /v1/subscriptions/{subscription-key} | Get subscriptions by key
*Zuora::SubscriptionsApi* | [**get_subscriptions_by_key_and_version**](docs/SubscriptionsApi.md#get_subscriptions_by_key_and_version) | **GET** /v1/subscriptions/{subscription-key}/versions/{version} | Get subscriptions by key and version
*Zuora::SubscriptionsApi* | [**object_delete_subscription**](docs/SubscriptionsApi.md#object_delete_subscription) | **DELETE** /v1/object/subscription/{id} | CRUD: Delete Subscription
*Zuora::SubscriptionsApi* | [**object_get_subscription**](docs/SubscriptionsApi.md#object_get_subscription) | **GET** /v1/object/subscription/{id} | CRUD: Retrieve Subscription
*Zuora::SubscriptionsApi* | [**object_put_subscription**](docs/SubscriptionsApi.md#object_put_subscription) | **PUT** /v1/object/subscription/{id} | CRUD: Update Subscription
*Zuora::SubscriptionsApi* | [**post_preview_subscription**](docs/SubscriptionsApi.md#post_preview_subscription) | **POST** /v1/subscriptions/preview | Preview subscription
*Zuora::SubscriptionsApi* | [**post_subscription**](docs/SubscriptionsApi.md#post_subscription) | **POST** /v1/subscriptions | Create subscription
*Zuora::SubscriptionsApi* | [**put_cancel_subscription**](docs/SubscriptionsApi.md#put_cancel_subscription) | **PUT** /v1/subscriptions/{subscription-key}/cancel | Cancel subscription
*Zuora::SubscriptionsApi* | [**put_renew_subscription**](docs/SubscriptionsApi.md#put_renew_subscription) | **PUT** /v1/subscriptions/{subscription-key}/renew | Renew subscription
*Zuora::SubscriptionsApi* | [**put_resume_subscription**](docs/SubscriptionsApi.md#put_resume_subscription) | **PUT** /v1/subscriptions/{subscription-key}/resume | Resume subscription
*Zuora::SubscriptionsApi* | [**put_subscription**](docs/SubscriptionsApi.md#put_subscription) | **PUT** /v1/subscriptions/{subscription-key} | Update subscription
*Zuora::SubscriptionsApi* | [**put_suspend_subscription**](docs/SubscriptionsApi.md#put_suspend_subscription) | **PUT** /v1/subscriptions/{subscription-key}/suspend | Suspend subscription
*Zuora::SubscriptionsApi* | [**put_update_subscription_custom_fields**](docs/SubscriptionsApi.md#put_update_subscription_custom_fields) | **PUT** /v1/subscriptions/{subscriptionNumber}/customFields | Update subscription custom fields
*Zuora::SummaryJournalEntriesApi* | [**delete_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#delete_summary_journal_entry) | **DELETE** /v1/journal-entries/{je-number} | Delete summary journal entry
*Zuora::SummaryJournalEntriesApi* | [**get_all_summary_journal_entries**](docs/SummaryJournalEntriesApi.md#get_all_summary_journal_entries) | **GET** /v1/journal-entries/journal-runs/{jr-number} | Get all summary journal entries in a journal run
*Zuora::SummaryJournalEntriesApi* | [**get_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#get_summary_journal_entry) | **GET** /v1/journal-entries/{je-number} | Get summary journal entry
*Zuora::SummaryJournalEntriesApi* | [**post_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#post_summary_journal_entry) | **POST** /v1/journal-entries | Create summary journal entry
*Zuora::SummaryJournalEntriesApi* | [**put_basic_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#put_basic_summary_journal_entry) | **PUT** /v1/journal-entries/{je-number}/basic-information | Update basic information of a summary journal entry
*Zuora::SummaryJournalEntriesApi* | [**put_summary_journal_entry**](docs/SummaryJournalEntriesApi.md#put_summary_journal_entry) | **PUT** /v1/journal-entries/{je-number}/cancel | Cancel summary journal entry
*Zuora::TaxationItemsApi* | [**delete_taxation_item**](docs/TaxationItemsApi.md#delete_taxation_item) | **DELETE** /v1/taxationitems/{id} | Delete taxation item
*Zuora::TaxationItemsApi* | [**get_taxation_item**](docs/TaxationItemsApi.md#get_taxation_item) | **GET** /v1/taxationitems/{id} | Get taxation item 
*Zuora::TaxationItemsApi* | [**object_delete_taxation_item**](docs/TaxationItemsApi.md#object_delete_taxation_item) | **DELETE** /v1/object/taxation-item/{id} | CRUD: Delete TaxationItem
*Zuora::TaxationItemsApi* | [**object_get_taxation_item**](docs/TaxationItemsApi.md#object_get_taxation_item) | **GET** /v1/object/taxation-item/{id} | CRUD: Retrieve TaxationItem
*Zuora::TaxationItemsApi* | [**object_post_taxation_item**](docs/TaxationItemsApi.md#object_post_taxation_item) | **POST** /v1/object/taxation-item | CRUD: Create TaxationItem
*Zuora::TaxationItemsApi* | [**object_put_taxation_item**](docs/TaxationItemsApi.md#object_put_taxation_item) | **PUT** /v1/object/taxation-item/{id} | CRUD: Update TaxationItem
*Zuora::TaxationItemsApi* | [**put_taxation_item**](docs/TaxationItemsApi.md#put_taxation_item) | **PUT** /v1/taxationitems/{id} | Update taxation item
*Zuora::TransactionsApi* | [**get_transaction_invoice**](docs/TransactionsApi.md#get_transaction_invoice) | **GET** /v1/transactions/invoices/accounts/{account-key} | Get invoices
*Zuora::TransactionsApi* | [**get_transaction_payment**](docs/TransactionsApi.md#get_transaction_payment) | **GET** /v1/transactions/payments/accounts/{account-key} | Get payments
*Zuora::UnitOfMeasureApi* | [**object_delete_unit_of_measure**](docs/UnitOfMeasureApi.md#object_delete_unit_of_measure) | **DELETE** /v1/object/unit-of-measure/{id} | CRUD: Delete UnitOfMeasure
*Zuora::UnitOfMeasureApi* | [**object_get_unit_of_measure**](docs/UnitOfMeasureApi.md#object_get_unit_of_measure) | **GET** /v1/object/unit-of-measure/{id} | CRUD: Retrieve UnitOfMeasure
*Zuora::UnitOfMeasureApi* | [**object_post_unit_of_measure**](docs/UnitOfMeasureApi.md#object_post_unit_of_measure) | **POST** /v1/object/unit-of-measure | CRUD: Create UnitOfMeasure
*Zuora::UnitOfMeasureApi* | [**object_put_unit_of_measure**](docs/UnitOfMeasureApi.md#object_put_unit_of_measure) | **PUT** /v1/object/unit-of-measure/{id} | CRUD: Update UnitOfMeasure
*Zuora::UsageApi* | [**get_usage**](docs/UsageApi.md#get_usage) | **GET** /v1/usage/accounts/{account-key} | Get usage
*Zuora::UsageApi* | [**object_delete_usage**](docs/UsageApi.md#object_delete_usage) | **DELETE** /v1/object/usage/{id} | CRUD: Delete Usage
*Zuora::UsageApi* | [**object_get_usage**](docs/UsageApi.md#object_get_usage) | **GET** /v1/object/usage/{id} | CRUD: Retrieve Usage
*Zuora::UsageApi* | [**object_post_usage**](docs/UsageApi.md#object_post_usage) | **POST** /v1/object/usage | CRUD: Create Usage
*Zuora::UsageApi* | [**object_put_usage**](docs/UsageApi.md#object_put_usage) | **PUT** /v1/object/usage/{id} | CRUD: Update Usage
*Zuora::UsageApi* | [**post_usage**](docs/UsageApi.md#post_usage) | **POST** /v1/usage | Post usage
*Zuora::UsersApi* | [**get_entities_user_accessible**](docs/UsersApi.md#get_entities_user_accessible) | **GET** /v1/users/{username}/accessible-entities | Multi-entity: Get entities that a user can access
*Zuora::UsersApi* | [**put_accept_user_access**](docs/UsersApi.md#put_accept_user_access) | **PUT** /v1/users/{username}/accept-access | Multi-entity: Accept user access
*Zuora::UsersApi* | [**put_deny_user_access**](docs/UsersApi.md#put_deny_user_access) | **PUT** /v1/users/{username}/deny-access | Multi-entity: Deny user access
*Zuora::UsersApi* | [**put_send_user_access_requests**](docs/UsersApi.md#put_send_user_access_requests) | **PUT** /v1/users/{username}/request-access | Multi-entity: Send user access requests


## Documentation for Models

- [Zuora::Account](docs/Account.md)
- [Zuora::AccountCreditCardHolder](docs/AccountCreditCardHolder.md)
- [Zuora::AmendRequest](docs/AmendRequest.md)
- [Zuora::AmendRequestAmendOptions](docs/AmendRequestAmendOptions.md)
- [Zuora::AmendRequestPreviewOptions](docs/AmendRequestPreviewOptions.md)
- [Zuora::AmendResult](docs/AmendResult.md)
- [Zuora::Amendment](docs/Amendment.md)
- [Zuora::AmendmentRatePlanChargeData](docs/AmendmentRatePlanChargeData.md)
- [Zuora::AmendmentRatePlanChargeDataRatePlanCharge](docs/AmendmentRatePlanChargeDataRatePlanCharge.md)
- [Zuora::AmendmentRatePlanChargeTier](docs/AmendmentRatePlanChargeTier.md)
- [Zuora::AmendmentRatePlanData](docs/AmendmentRatePlanData.md)
- [Zuora::ApplyCreditMemoType](docs/ApplyCreditMemoType.md)
- [Zuora::ApplyPaymentType](docs/ApplyPaymentType.md)
- [Zuora::BillingDocumentQueryResponseElementType](docs/BillingDocumentQueryResponseElementType.md)
- [Zuora::BillingOptions](docs/BillingOptions.md)
- [Zuora::BillingOverride](docs/BillingOverride.md)
- [Zuora::BillingPreviewResult](docs/BillingPreviewResult.md)
- [Zuora::BillingUpdate](docs/BillingUpdate.md)
- [Zuora::BreakdownDetail](docs/BreakdownDetail.md)
- [Zuora::CancelSubscription](docs/CancelSubscription.md)
- [Zuora::ChargeMetricsData](docs/ChargeMetricsData.md)
- [Zuora::ChargeOverride](docs/ChargeOverride.md)
- [Zuora::ChargePreviewMetrics](docs/ChargePreviewMetrics.md)
- [Zuora::ChargePreviewMetricsCmrr](docs/ChargePreviewMetricsCmrr.md)
- [Zuora::ChargePreviewMetricsTax](docs/ChargePreviewMetricsTax.md)
- [Zuora::ChargePreviewMetricsTcb](docs/ChargePreviewMetricsTcb.md)
- [Zuora::ChargePreviewMetricsTcv](docs/ChargePreviewMetricsTcv.md)
- [Zuora::ChargeRatedResult](docs/ChargeRatedResult.md)
- [Zuora::ChargeTier](docs/ChargeTier.md)
- [Zuora::ChargeUpdate](docs/ChargeUpdate.md)
- [Zuora::CommonResponse](docs/CommonResponse.md)
- [Zuora::CommonResponseType](docs/CommonResponseType.md)
- [Zuora::Contact](docs/Contact.md)
- [Zuora::CreateEntityResponseType](docs/CreateEntityResponseType.md)
- [Zuora::CreateEntityType](docs/CreateEntityType.md)
- [Zuora::CreatePaymentType](docs/CreatePaymentType.md)
- [Zuora::CreatePaymentTypeFinanceInformation](docs/CreatePaymentTypeFinanceInformation.md)
- [Zuora::CreateSubscription](docs/CreateSubscription.md)
- [Zuora::CreditCard](docs/CreditCard.md)
- [Zuora::CreditMemoApplyDebitMemoItemRequestType](docs/CreditMemoApplyDebitMemoItemRequestType.md)
- [Zuora::CreditMemoApplyDebitMemoRequestType](docs/CreditMemoApplyDebitMemoRequestType.md)
- [Zuora::CreditMemoApplyInvoiceItemRequestType](docs/CreditMemoApplyInvoiceItemRequestType.md)
- [Zuora::CreditMemoApplyInvoiceRequestType](docs/CreditMemoApplyInvoiceRequestType.md)
- [Zuora::CreditMemoFromChargeDetailType](docs/CreditMemoFromChargeDetailType.md)
- [Zuora::CreditMemoFromChargeDetailTypeFinanceInformation](docs/CreditMemoFromChargeDetailTypeFinanceInformation.md)
- [Zuora::CreditMemoFromChargeType](docs/CreditMemoFromChargeType.md)
- [Zuora::CreditMemoFromInvoiceType](docs/CreditMemoFromInvoiceType.md)
- [Zuora::CreditMemoItemBreakdown](docs/CreditMemoItemBreakdown.md)
- [Zuora::CreditMemoItemFromInvoiceItemType](docs/CreditMemoItemFromInvoiceItemType.md)
- [Zuora::CreditMemoItemFromInvoiceItemTypeFinanceInformation](docs/CreditMemoItemFromInvoiceItemTypeFinanceInformation.md)
- [Zuora::CreditMemoResponseType](docs/CreditMemoResponseType.md)
- [Zuora::CreditMemoTaxItemFromInvoiceTaxItemType](docs/CreditMemoTaxItemFromInvoiceTaxItemType.md)
- [Zuora::CreditMemoTaxItemFromInvoiceTaxItemTypeFinanceInformation](docs/CreditMemoTaxItemFromInvoiceTaxItemTypeFinanceInformation.md)
- [Zuora::CreditMemoUnapplyDebitMemoItemRequestType](docs/CreditMemoUnapplyDebitMemoItemRequestType.md)
- [Zuora::CreditMemoUnapplyDebitMemoRequestType](docs/CreditMemoUnapplyDebitMemoRequestType.md)
- [Zuora::CreditMemoUnapplyInvoiceItemRequestType](docs/CreditMemoUnapplyInvoiceItemRequestType.md)
- [Zuora::CreditMemoUnapplyInvoiceRequestType](docs/CreditMemoUnapplyInvoiceRequestType.md)
- [Zuora::CustomFields](docs/CustomFields.md)
- [Zuora::DELETEntityResponseType](docs/DELETEntityResponseType.md)
- [Zuora::DebitMemoFromChargeDetailType](docs/DebitMemoFromChargeDetailType.md)
- [Zuora::DebitMemoFromChargeDetailTypeFinanceInformation](docs/DebitMemoFromChargeDetailTypeFinanceInformation.md)
- [Zuora::DebitMemoFromChargeType](docs/DebitMemoFromChargeType.md)
- [Zuora::DebitMemoFromInvoiceType](docs/DebitMemoFromInvoiceType.md)
- [Zuora::DebitMemoItemFromInvoiceItemType](docs/DebitMemoItemFromInvoiceItemType.md)
- [Zuora::DebitMemoItemFromInvoiceItemTypeFinanceInformation](docs/DebitMemoItemFromInvoiceItemTypeFinanceInformation.md)
- [Zuora::DebitMemoTaxItemFromInvoiceTaxItemType](docs/DebitMemoTaxItemFromInvoiceTaxItemType.md)
- [Zuora::DebitMemoTaxItemFromInvoiceTaxItemTypeFinanceInformation](docs/DebitMemoTaxItemFromInvoiceTaxItemTypeFinanceInformation.md)
- [Zuora::DeleteResult](docs/DeleteResult.md)
- [Zuora::DiscountPricingOverride](docs/DiscountPricingOverride.md)
- [Zuora::DiscountPricingUpdate](docs/DiscountPricingUpdate.md)
- [Zuora::ElectronicPaymentOptions](docs/ElectronicPaymentOptions.md)
- [Zuora::EndConditions](docs/EndConditions.md)
- [Zuora::Error](docs/Error.md)
- [Zuora::EventRevenueItemType](docs/EventRevenueItemType.md)
- [Zuora::ExecuteResult](docs/ExecuteResult.md)
- [Zuora::ExternalPaymentOptions](docs/ExternalPaymentOptions.md)
- [Zuora::FinanceInformation](docs/FinanceInformation.md)
- [Zuora::GETAPaymentGatwayResponse](docs/GETAPaymentGatwayResponse.md)
- [Zuora::GETARPaymentType](docs/GETARPaymentType.md)
- [Zuora::GETARPaymentTypeFinanceInformation](docs/GETARPaymentTypeFinanceInformation.md)
- [Zuora::GETARPaymentTypewithSuccess](docs/GETARPaymentTypewithSuccess.md)
- [Zuora::GETAccountSummaryInvoiceType](docs/GETAccountSummaryInvoiceType.md)
- [Zuora::GETAccountSummaryPaymentInvoiceType](docs/GETAccountSummaryPaymentInvoiceType.md)
- [Zuora::GETAccountSummaryPaymentType](docs/GETAccountSummaryPaymentType.md)
- [Zuora::GETAccountSummarySubscriptionRatePlanType](docs/GETAccountSummarySubscriptionRatePlanType.md)
- [Zuora::GETAccountSummarySubscriptionType](docs/GETAccountSummarySubscriptionType.md)
- [Zuora::GETAccountSummaryType](docs/GETAccountSummaryType.md)
- [Zuora::GETAccountSummaryTypeBasicInfo](docs/GETAccountSummaryTypeBasicInfo.md)
- [Zuora::GETAccountSummaryTypeBasicInfoDefaultPaymentMethod](docs/GETAccountSummaryTypeBasicInfoDefaultPaymentMethod.md)
- [Zuora::GETAccountSummaryTypeBillToContact](docs/GETAccountSummaryTypeBillToContact.md)
- [Zuora::GETAccountSummaryTypeSoldToContact](docs/GETAccountSummaryTypeSoldToContact.md)
- [Zuora::GETAccountSummaryTypeTaxInfo](docs/GETAccountSummaryTypeTaxInfo.md)
- [Zuora::GETAccountSummaryUsageType](docs/GETAccountSummaryUsageType.md)
- [Zuora::GETAccountType](docs/GETAccountType.md)
- [Zuora::GETAccountTypeBasicInfo](docs/GETAccountTypeBasicInfo.md)
- [Zuora::GETAccountTypeBillToContact](docs/GETAccountTypeBillToContact.md)
- [Zuora::GETAccountTypeBillingAndPayment](docs/GETAccountTypeBillingAndPayment.md)
- [Zuora::GETAccountTypeMetrics](docs/GETAccountTypeMetrics.md)
- [Zuora::GETAccountTypeSoldToContact](docs/GETAccountTypeSoldToContact.md)
- [Zuora::GETAccountingCodeItemType](docs/GETAccountingCodeItemType.md)
- [Zuora::GETAccountingCodeItemWithoutSuccessType](docs/GETAccountingCodeItemWithoutSuccessType.md)
- [Zuora::GETAccountingCodesType](docs/GETAccountingCodesType.md)
- [Zuora::GETAccountingPeriodType](docs/GETAccountingPeriodType.md)
- [Zuora::GETAccountingPeriodTypeFileIds](docs/GETAccountingPeriodTypeFileIds.md)
- [Zuora::GETAccountingPeriodWithoutSuccessType](docs/GETAccountingPeriodWithoutSuccessType.md)
- [Zuora::GETAccountingPeriodsType](docs/GETAccountingPeriodsType.md)
- [Zuora::GETAmendmentType](docs/GETAmendmentType.md)
- [Zuora::GETAttachmentResponseType](docs/GETAttachmentResponseType.md)
- [Zuora::GETAttachmentResponseWithoutSuccessType](docs/GETAttachmentResponseWithoutSuccessType.md)
- [Zuora::GETAttachmentsResponseType](docs/GETAttachmentsResponseType.md)
- [Zuora::GETBillingDocumentsResponseType](docs/GETBillingDocumentsResponseType.md)
- [Zuora::GETCMTaxItemType](docs/GETCMTaxItemType.md)
- [Zuora::GETCMTaxItemTypeFinanceInformation](docs/GETCMTaxItemTypeFinanceInformation.md)
- [Zuora::GETCalloutHistoryVOType](docs/GETCalloutHistoryVOType.md)
- [Zuora::GETCalloutHistoryVOsType](docs/GETCalloutHistoryVOsType.md)
- [Zuora::GETCatalogType](docs/GETCatalogType.md)
- [Zuora::GETChargeRSDetailType](docs/GETChargeRSDetailType.md)
- [Zuora::GETCreditMemoCollectionType](docs/GETCreditMemoCollectionType.md)
- [Zuora::GETCreditMemoItemPartType](docs/GETCreditMemoItemPartType.md)
- [Zuora::GETCreditMemoItemPartTypewithSuccess](docs/GETCreditMemoItemPartTypewithSuccess.md)
- [Zuora::GETCreditMemoItemPartsCollectionType](docs/GETCreditMemoItemPartsCollectionType.md)
- [Zuora::GETCreditMemoItemType](docs/GETCreditMemoItemType.md)
- [Zuora::GETCreditMemoItemTypeFinanceInformation](docs/GETCreditMemoItemTypeFinanceInformation.md)
- [Zuora::GETCreditMemoItemTypewithSuccess](docs/GETCreditMemoItemTypewithSuccess.md)
- [Zuora::GETCreditMemoItemTypewithSuccessFinanceInformation](docs/GETCreditMemoItemTypewithSuccessFinanceInformation.md)
- [Zuora::GETCreditMemoItemsListType](docs/GETCreditMemoItemsListType.md)
- [Zuora::GETCreditMemoPartType](docs/GETCreditMemoPartType.md)
- [Zuora::GETCreditMemoPartTypewithSuccess](docs/GETCreditMemoPartTypewithSuccess.md)
- [Zuora::GETCreditMemoPartsCollectionType](docs/GETCreditMemoPartsCollectionType.md)
- [Zuora::GETCreditMemoType](docs/GETCreditMemoType.md)
- [Zuora::GETCreditMemoTypewithSuccess](docs/GETCreditMemoTypewithSuccess.md)
- [Zuora::GETCustomExchangeRatesDataType](docs/GETCustomExchangeRatesDataType.md)
- [Zuora::GETCustomExchangeRatesType](docs/GETCustomExchangeRatesType.md)
- [Zuora::GETDMTaxItemType](docs/GETDMTaxItemType.md)
- [Zuora::GETDMTaxItemTypeFinanceInformation](docs/GETDMTaxItemTypeFinanceInformation.md)
- [Zuora::GETDebitMemoCollectionType](docs/GETDebitMemoCollectionType.md)
- [Zuora::GETDebitMemoItemCollectionType](docs/GETDebitMemoItemCollectionType.md)
- [Zuora::GETDebitMemoItemType](docs/GETDebitMemoItemType.md)
- [Zuora::GETDebitMemoItemTypeFinanceInformation](docs/GETDebitMemoItemTypeFinanceInformation.md)
- [Zuora::GETDebitMemoItemTypewithSuccess](docs/GETDebitMemoItemTypewithSuccess.md)
- [Zuora::GETDebitMemoType](docs/GETDebitMemoType.md)
- [Zuora::GETDebitMemoTypewithSuccess](docs/GETDebitMemoTypewithSuccess.md)
- [Zuora::GETDiscountApplyDetailsType](docs/GETDiscountApplyDetailsType.md)
- [Zuora::GETEmailHistoryVOType](docs/GETEmailHistoryVOType.md)
- [Zuora::GETEmailHistoryVOsType](docs/GETEmailHistoryVOsType.md)
- [Zuora::GETEntitiesResponseType](docs/GETEntitiesResponseType.md)
- [Zuora::GETEntitiesResponseTypeWithId](docs/GETEntitiesResponseTypeWithId.md)
- [Zuora::GETEntitiesType](docs/GETEntitiesType.md)
- [Zuora::GETEntitiesUserAccessibleResponseType](docs/GETEntitiesUserAccessibleResponseType.md)
- [Zuora::GETEntityConnectionsArrayItemsType](docs/GETEntityConnectionsArrayItemsType.md)
- [Zuora::GETEntityConnectionsResponseType](docs/GETEntityConnectionsResponseType.md)
- [Zuora::GETInvoiceFileType](docs/GETInvoiceFileType.md)
- [Zuora::GETInvoiceFileWrapper](docs/GETInvoiceFileWrapper.md)
- [Zuora::GETInvoiceType](docs/GETInvoiceType.md)
- [Zuora::GETInvoicesInvoiceItemType](docs/GETInvoicesInvoiceItemType.md)
- [Zuora::GETJournalEntriesInJournalRunType](docs/GETJournalEntriesInJournalRunType.md)
- [Zuora::GETJournalEntryDetailType](docs/GETJournalEntryDetailType.md)
- [Zuora::GETJournalEntryDetailTypeWithoutSuccess](docs/GETJournalEntryDetailTypeWithoutSuccess.md)
- [Zuora::GETJournalEntryItemType](docs/GETJournalEntryItemType.md)
- [Zuora::GETJournalEntrySegmentType](docs/GETJournalEntrySegmentType.md)
- [Zuora::GETJournalRunTransactionType](docs/GETJournalRunTransactionType.md)
- [Zuora::GETJournalRunType](docs/GETJournalRunType.md)
- [Zuora::GETMassUpdateType](docs/GETMassUpdateType.md)
- [Zuora::GETPaidInvoicesType](docs/GETPaidInvoicesType.md)
- [Zuora::GETPaymentGatwaysResponse](docs/GETPaymentGatwaysResponse.md)
- [Zuora::GETPaymentItemPartCollectionType](docs/GETPaymentItemPartCollectionType.md)
- [Zuora::GETPaymentItemPartType](docs/GETPaymentItemPartType.md)
- [Zuora::GETPaymentItemPartTypewithSuccess](docs/GETPaymentItemPartTypewithSuccess.md)
- [Zuora::GETPaymentMethodType](docs/GETPaymentMethodType.md)
- [Zuora::GETPaymentMethodTypeCardHolderInfo](docs/GETPaymentMethodTypeCardHolderInfo.md)
- [Zuora::GETPaymentMethodsType](docs/GETPaymentMethodsType.md)
- [Zuora::GETPaymentPartType](docs/GETPaymentPartType.md)
- [Zuora::GETPaymentPartTypewithSuccess](docs/GETPaymentPartTypewithSuccess.md)
- [Zuora::GETPaymentPartsCollectionType](docs/GETPaymentPartsCollectionType.md)
- [Zuora::GETPaymentType](docs/GETPaymentType.md)
- [Zuora::GETPaymentsType](docs/GETPaymentsType.md)
- [Zuora::GETProductDiscountApplyDetailsType](docs/GETProductDiscountApplyDetailsType.md)
- [Zuora::GETProductRatePlanChargePricingTierType](docs/GETProductRatePlanChargePricingTierType.md)
- [Zuora::GETProductRatePlanChargePricingType](docs/GETProductRatePlanChargePricingType.md)
- [Zuora::GETProductRatePlanChargeType](docs/GETProductRatePlanChargeType.md)
- [Zuora::GETProductRatePlanType](docs/GETProductRatePlanType.md)
- [Zuora::GETProductType](docs/GETProductType.md)
- [Zuora::GETRSDetailForProductChargeType](docs/GETRSDetailForProductChargeType.md)
- [Zuora::GETRSDetailType](docs/GETRSDetailType.md)
- [Zuora::GETRSDetailWithoutSuccessType](docs/GETRSDetailWithoutSuccessType.md)
- [Zuora::GETRSDetailsByChargeType](docs/GETRSDetailsByChargeType.md)
- [Zuora::GETRSDetailsByProductChargeType](docs/GETRSDetailsByProductChargeType.md)
- [Zuora::GETRefundCollectionType](docs/GETRefundCollectionType.md)
- [Zuora::GETRefundCreditMemoType](docs/GETRefundCreditMemoType.md)
- [Zuora::GETRefundCreditMemoTypeFinanceInformation](docs/GETRefundCreditMemoTypeFinanceInformation.md)
- [Zuora::GETRefundItemPartCollectionType](docs/GETRefundItemPartCollectionType.md)
- [Zuora::GETRefundItemPartType](docs/GETRefundItemPartType.md)
- [Zuora::GETRefundItemPartTypewithSuccess](docs/GETRefundItemPartTypewithSuccess.md)
- [Zuora::GETRefundPartCollectionType](docs/GETRefundPartCollectionType.md)
- [Zuora::GETRefundPaymentType](docs/GETRefundPaymentType.md)
- [Zuora::GETRefundType](docs/GETRefundType.md)
- [Zuora::GETRefundTypewithSuccess](docs/GETRefundTypewithSuccess.md)
- [Zuora::GETRevenueEventDetailType](docs/GETRevenueEventDetailType.md)
- [Zuora::GETRevenueEventDetailWithoutSuccessType](docs/GETRevenueEventDetailWithoutSuccessType.md)
- [Zuora::GETRevenueEventDetailsType](docs/GETRevenueEventDetailsType.md)
- [Zuora::GETRevenueItemType](docs/GETRevenueItemType.md)
- [Zuora::GETRevenueItemsType](docs/GETRevenueItemsType.md)
- [Zuora::GETRevenueRecognitionRuleAssociationType](docs/GETRevenueRecognitionRuleAssociationType.md)
- [Zuora::GETRevenueStartDateSettingType](docs/GETRevenueStartDateSettingType.md)
- [Zuora::GETRsRevenueItemType](docs/GETRsRevenueItemType.md)
- [Zuora::GETRsRevenueItemsType](docs/GETRsRevenueItemsType.md)
- [Zuora::GETSubscriptionProductFeatureType](docs/GETSubscriptionProductFeatureType.md)
- [Zuora::GETSubscriptionRatePlanChargesType](docs/GETSubscriptionRatePlanChargesType.md)
- [Zuora::GETSubscriptionRatePlanType](docs/GETSubscriptionRatePlanType.md)
- [Zuora::GETSubscriptionType](docs/GETSubscriptionType.md)
- [Zuora::GETSubscriptionTypeWithSuccess](docs/GETSubscriptionTypeWithSuccess.md)
- [Zuora::GETSubscriptionWrapper](docs/GETSubscriptionWrapper.md)
- [Zuora::GETTaxationItemListType](docs/GETTaxationItemListType.md)
- [Zuora::GETTaxationItemType](docs/GETTaxationItemType.md)
- [Zuora::GETTaxationItemTypeFinanceInformation](docs/GETTaxationItemTypeFinanceInformation.md)
- [Zuora::GETTaxationItemTypewithSuccess](docs/GETTaxationItemTypewithSuccess.md)
- [Zuora::GETTierType](docs/GETTierType.md)
- [Zuora::GETUsageType](docs/GETUsageType.md)
- [Zuora::GETUsageWrapper](docs/GETUsageWrapper.md)
- [Zuora::GatewayOption](docs/GatewayOption.md)
- [Zuora::GenerateBillingDocumentResponseType](docs/GenerateBillingDocumentResponseType.md)
- [Zuora::GetAllOrdersResponseType](docs/GetAllOrdersResponseType.md)
- [Zuora::GetBillingPreviewRunResponse](docs/GetBillingPreviewRunResponse.md)
- [Zuora::GetHostedPageType](docs/GetHostedPageType.md)
- [Zuora::GetHostedPagesType](docs/GetHostedPagesType.md)
- [Zuora::GetOrderBillingInfoResponseTypeBillingInfo](docs/GetOrderBillingInfoResponseTypeBillingInfo.md)
- [Zuora::GetProductFeatureType](docs/GetProductFeatureType.md)
- [Zuora::InitialTerm](docs/InitialTerm.md)
- [Zuora::InlineResponse200](docs/InlineResponse200.md)
- [Zuora::Invoice](docs/Invoice.md)
- [Zuora::InvoiceData](docs/InvoiceData.md)
- [Zuora::InvoiceDataInvoice](docs/InvoiceDataInvoice.md)
- [Zuora::InvoiceItem](docs/InvoiceItem.md)
- [Zuora::InvoiceItemBreakdown](docs/InvoiceItemBreakdown.md)
- [Zuora::InvoiceItemPreviewResult](docs/InvoiceItemPreviewResult.md)
- [Zuora::InvoiceItemPreviewResultAdditionalInfo](docs/InvoiceItemPreviewResultAdditionalInfo.md)
- [Zuora::InvoicePayment](docs/InvoicePayment.md)
- [Zuora::InvoicePaymentData](docs/InvoicePaymentData.md)
- [Zuora::InvoiceProcessingOptions](docs/InvoiceProcessingOptions.md)
- [Zuora::InvoiceResponseType](docs/InvoiceResponseType.md)
- [Zuora::LastTerm](docs/LastTerm.md)
- [Zuora::ListOfExchangeRates](docs/ListOfExchangeRates.md)
- [Zuora::NewChargeMetrics](docs/NewChargeMetrics.md)
- [Zuora::OneTimeFlatFeePricingOverride](docs/OneTimeFlatFeePricingOverride.md)
- [Zuora::OneTimePerUnitPricingOverride](docs/OneTimePerUnitPricingOverride.md)
- [Zuora::OneTimeTieredPricingOverride](docs/OneTimeTieredPricingOverride.md)
- [Zuora::OneTimeVolumePricingOverride](docs/OneTimeVolumePricingOverride.md)
- [Zuora::Order](docs/Order.md)
- [Zuora::OrderAction](docs/OrderAction.md)
- [Zuora::OrderActionRequest](docs/OrderActionRequest.md)
- [Zuora::OrderMetrics](docs/OrderMetrics.md)
- [Zuora::OrderMetricsInner](docs/OrderMetricsInner.md)
- [Zuora::OrderRatedResult](docs/OrderRatedResult.md)
- [Zuora::OrderSubscriptions](docs/OrderSubscriptions.md)
- [Zuora::OwnerTransfer](docs/OwnerTransfer.md)
- [Zuora::POSTAccountResponseType](docs/POSTAccountResponseType.md)
- [Zuora::POSTAccountType](docs/POSTAccountType.md)
- [Zuora::POSTAccountTypeBillToContact](docs/POSTAccountTypeBillToContact.md)
- [Zuora::POSTAccountTypeCreditCard](docs/POSTAccountTypeCreditCard.md)
- [Zuora::POSTAccountTypeCreditCardCardHolderInfo](docs/POSTAccountTypeCreditCardCardHolderInfo.md)
- [Zuora::POSTAccountTypeSoldToContact](docs/POSTAccountTypeSoldToContact.md)
- [Zuora::POSTAccountTypeSubscription](docs/POSTAccountTypeSubscription.md)
- [Zuora::POSTAccountTypeTaxInfo](docs/POSTAccountTypeTaxInfo.md)
- [Zuora::POSTAccountingCodeResponseType](docs/POSTAccountingCodeResponseType.md)
- [Zuora::POSTAccountingCodeType](docs/POSTAccountingCodeType.md)
- [Zuora::POSTAccountingPeriodResponseType](docs/POSTAccountingPeriodResponseType.md)
- [Zuora::POSTAccountingPeriodType](docs/POSTAccountingPeriodType.md)
- [Zuora::POSTAttachmentResponseType](docs/POSTAttachmentResponseType.md)
- [Zuora::POSTAttachmentType](docs/POSTAttachmentType.md)
- [Zuora::POSTBillingPreviewCreditMemoItem](docs/POSTBillingPreviewCreditMemoItem.md)
- [Zuora::POSTBillingPreviewInvoiceItem](docs/POSTBillingPreviewInvoiceItem.md)
- [Zuora::POSTDecryptResponseType](docs/POSTDecryptResponseType.md)
- [Zuora::POSTDecryptionType](docs/POSTDecryptionType.md)
- [Zuora::POSTDistributionItemType](docs/POSTDistributionItemType.md)
- [Zuora::POSTEmailBillingDocfromBillRunType](docs/POSTEmailBillingDocfromBillRunType.md)
- [Zuora::POSTEntityConnectionsResponseType](docs/POSTEntityConnectionsResponseType.md)
- [Zuora::POSTEntityConnectionsType](docs/POSTEntityConnectionsType.md)
- [Zuora::POSTHMACSignatureResponseType](docs/POSTHMACSignatureResponseType.md)
- [Zuora::POSTHMACSignatureType](docs/POSTHMACSignatureType.md)
- [Zuora::POSTInvoiceCollectCreditMemosType](docs/POSTInvoiceCollectCreditMemosType.md)
- [Zuora::POSTInvoiceCollectInvoicesType](docs/POSTInvoiceCollectInvoicesType.md)
- [Zuora::POSTInvoiceCollectResponseType](docs/POSTInvoiceCollectResponseType.md)
- [Zuora::POSTInvoiceCollectType](docs/POSTInvoiceCollectType.md)
- [Zuora::POSTJournalEntryItemType](docs/POSTJournalEntryItemType.md)
- [Zuora::POSTJournalEntryResponseType](docs/POSTJournalEntryResponseType.md)
- [Zuora::POSTJournalEntrySegmentType](docs/POSTJournalEntrySegmentType.md)
- [Zuora::POSTJournalEntryType](docs/POSTJournalEntryType.md)
- [Zuora::POSTJournalRunResponseType](docs/POSTJournalRunResponseType.md)
- [Zuora::POSTJournalRunTransactionType](docs/POSTJournalRunTransactionType.md)
- [Zuora::POSTJournalRunType](docs/POSTJournalRunType.md)
- [Zuora::POSTMassUpdateResponseType](docs/POSTMassUpdateResponseType.md)
- [Zuora::POSTMassUpdateType](docs/POSTMassUpdateType.md)
- [Zuora::POSTMassUpdateTypeParams](docs/POSTMassUpdateTypeParams.md)
- [Zuora::POSTMemoPdfResponse](docs/POSTMemoPdfResponse.md)
- [Zuora::POSTOrderPreviewRequestType](docs/POSTOrderPreviewRequestType.md)
- [Zuora::POSTOrderPreviewRequestTypeSubscriptions](docs/POSTOrderPreviewRequestTypeSubscriptions.md)
- [Zuora::POSTOrderRequestType](docs/POSTOrderRequestType.md)
- [Zuora::POSTOrderRequestTypeSubscriptions](docs/POSTOrderRequestTypeSubscriptions.md)
- [Zuora::POSTPaymentMethodDecryption](docs/POSTPaymentMethodDecryption.md)
- [Zuora::POSTPaymentMethodDecryptionCardHolderInfo](docs/POSTPaymentMethodDecryptionCardHolderInfo.md)
- [Zuora::POSTPaymentMethodResponseDecryption](docs/POSTPaymentMethodResponseDecryption.md)
- [Zuora::POSTPaymentMethodResponseType](docs/POSTPaymentMethodResponseType.md)
- [Zuora::POSTPaymentMethodType](docs/POSTPaymentMethodType.md)
- [Zuora::POSTPaymentMethodTypeCardHolderInfo](docs/POSTPaymentMethodTypeCardHolderInfo.md)
- [Zuora::POSTQuoteDocResponseType](docs/POSTQuoteDocResponseType.md)
- [Zuora::POSTQuoteDocType](docs/POSTQuoteDocType.md)
- [Zuora::POSTRSASignatureResponseType](docs/POSTRSASignatureResponseType.md)
- [Zuora::POSTRSASignatureType](docs/POSTRSASignatureType.md)
- [Zuora::POSTRevenueScheduleByChargeResponseType](docs/POSTRevenueScheduleByChargeResponseType.md)
- [Zuora::POSTRevenueScheduleByChargeType](docs/POSTRevenueScheduleByChargeType.md)
- [Zuora::POSTRevenueScheduleByChargeTypeRevenueEvent](docs/POSTRevenueScheduleByChargeTypeRevenueEvent.md)
- [Zuora::POSTRevenueScheduleByDateRangeType](docs/POSTRevenueScheduleByDateRangeType.md)
- [Zuora::POSTRevenueScheduleByDateRangeTypeRevenueEvent](docs/POSTRevenueScheduleByDateRangeTypeRevenueEvent.md)
- [Zuora::POSTRevenueScheduleByTransactionRatablyType](docs/POSTRevenueScheduleByTransactionRatablyType.md)
- [Zuora::POSTRevenueScheduleByTransactionRatablyTypeRevenueEvent](docs/POSTRevenueScheduleByTransactionRatablyTypeRevenueEvent.md)
- [Zuora::POSTRevenueScheduleByTransactionResponseType](docs/POSTRevenueScheduleByTransactionResponseType.md)
- [Zuora::POSTRevenueScheduleByTransactionType](docs/POSTRevenueScheduleByTransactionType.md)
- [Zuora::POSTRevenueScheduleByTransactionTypeRevenueEvent](docs/POSTRevenueScheduleByTransactionTypeRevenueEvent.md)
- [Zuora::POSTScCreateType](docs/POSTScCreateType.md)
- [Zuora::POSTSrpCreateType](docs/POSTSrpCreateType.md)
- [Zuora::POSTSubscriptionCancellationResponseType](docs/POSTSubscriptionCancellationResponseType.md)
- [Zuora::POSTSubscriptionCancellationType](docs/POSTSubscriptionCancellationType.md)
- [Zuora::POSTSubscriptionPreviewCreditMemoItemsType](docs/POSTSubscriptionPreviewCreditMemoItemsType.md)
- [Zuora::POSTSubscriptionPreviewInvoiceItemsType](docs/POSTSubscriptionPreviewInvoiceItemsType.md)
- [Zuora::POSTSubscriptionPreviewResponseType](docs/POSTSubscriptionPreviewResponseType.md)
- [Zuora::POSTSubscriptionPreviewResponseTypeChargeMetrics](docs/POSTSubscriptionPreviewResponseTypeChargeMetrics.md)
- [Zuora::POSTSubscriptionPreviewResponseTypeCreditMemo](docs/POSTSubscriptionPreviewResponseTypeCreditMemo.md)
- [Zuora::POSTSubscriptionPreviewType](docs/POSTSubscriptionPreviewType.md)
- [Zuora::POSTSubscriptionPreviewTypePreviewAccountInfo](docs/POSTSubscriptionPreviewTypePreviewAccountInfo.md)
- [Zuora::POSTSubscriptionPreviewTypePreviewAccountInfoBillToContact](docs/POSTSubscriptionPreviewTypePreviewAccountInfoBillToContact.md)
- [Zuora::POSTSubscriptionResponseType](docs/POSTSubscriptionResponseType.md)
- [Zuora::POSTSubscriptionType](docs/POSTSubscriptionType.md)
- [Zuora::POSTTaxationItemForCMType](docs/POSTTaxationItemForCMType.md)
- [Zuora::POSTTaxationItemForCMTypeFinanceInformation](docs/POSTTaxationItemForCMTypeFinanceInformation.md)
- [Zuora::POSTTaxationItemForDMType](docs/POSTTaxationItemForDMType.md)
- [Zuora::POSTTaxationItemForDMTypeFinanceInformation](docs/POSTTaxationItemForDMTypeFinanceInformation.md)
- [Zuora::POSTTaxationItemListForCMType](docs/POSTTaxationItemListForCMType.md)
- [Zuora::POSTTaxationItemListForDMType](docs/POSTTaxationItemListForDMType.md)
- [Zuora::POSTTierType](docs/POSTTierType.md)
- [Zuora::POSTUsageResponseType](docs/POSTUsageResponseType.md)
- [Zuora::PUTAcceptUserAccessResponseType](docs/PUTAcceptUserAccessResponseType.md)
- [Zuora::PUTAccountType](docs/PUTAccountType.md)
- [Zuora::PUTAccountTypeBillToContact](docs/PUTAccountTypeBillToContact.md)
- [Zuora::PUTAccountTypeSoldToContact](docs/PUTAccountTypeSoldToContact.md)
- [Zuora::PUTAccountingCodeType](docs/PUTAccountingCodeType.md)
- [Zuora::PUTAccountingPeriodType](docs/PUTAccountingPeriodType.md)
- [Zuora::PUTAllocateManuallyType](docs/PUTAllocateManuallyType.md)
- [Zuora::PUTAttachmentType](docs/PUTAttachmentType.md)
- [Zuora::PUTBasicSummaryJournalEntryType](docs/PUTBasicSummaryJournalEntryType.md)
- [Zuora::PUTCatalogType](docs/PUTCatalogType.md)
- [Zuora::PUTCreditMemoItemType](docs/PUTCreditMemoItemType.md)
- [Zuora::PUTCreditMemoItemTypeFinanceInformation](docs/PUTCreditMemoItemTypeFinanceInformation.md)
- [Zuora::PUTCreditMemoType](docs/PUTCreditMemoType.md)
- [Zuora::PUTDebitMemoItemType](docs/PUTDebitMemoItemType.md)
- [Zuora::PUTDebitMemoItemTypeFinanceInformation](docs/PUTDebitMemoItemTypeFinanceInformation.md)
- [Zuora::PUTDebitMemoType](docs/PUTDebitMemoType.md)
- [Zuora::PUTDenyUserAccessResponseType](docs/PUTDenyUserAccessResponseType.md)
- [Zuora::PUTEntityConnectionsAcceptResponseType](docs/PUTEntityConnectionsAcceptResponseType.md)
- [Zuora::PUTEntityConnectionsDenyResponseType](docs/PUTEntityConnectionsDenyResponseType.md)
- [Zuora::PUTEntityConnectionsDisconnectResponseType](docs/PUTEntityConnectionsDisconnectResponseType.md)
- [Zuora::PUTEventRIDetailType](docs/PUTEventRIDetailType.md)
- [Zuora::PUTJournalEntryItemType](docs/PUTJournalEntryItemType.md)
- [Zuora::PUTOrderPatchRequestType](docs/PUTOrderPatchRequestType.md)
- [Zuora::PUTOrderPatchRequestTypeOrderActions](docs/PUTOrderPatchRequestTypeOrderActions.md)
- [Zuora::PUTOrderPatchRequestTypeSubscriptions](docs/PUTOrderPatchRequestTypeSubscriptions.md)
- [Zuora::PUTPaymentMethodResponseType](docs/PUTPaymentMethodResponseType.md)
- [Zuora::PUTPaymentMethodType](docs/PUTPaymentMethodType.md)
- [Zuora::PUTRSBasicInfoType](docs/PUTRSBasicInfoType.md)
- [Zuora::PUTRSTermType](docs/PUTRSTermType.md)
- [Zuora::PUTRefundType](docs/PUTRefundType.md)
- [Zuora::PUTRefundTypeFinanceInformation](docs/PUTRefundTypeFinanceInformation.md)
- [Zuora::PUTRenewSubscriptionResponseType](docs/PUTRenewSubscriptionResponseType.md)
- [Zuora::PUTRenewSubscriptionType](docs/PUTRenewSubscriptionType.md)
- [Zuora::PUTRevenueScheduleResponseType](docs/PUTRevenueScheduleResponseType.md)
- [Zuora::PUTScAddType](docs/PUTScAddType.md)
- [Zuora::PUTScUpdateType](docs/PUTScUpdateType.md)
- [Zuora::PUTScheduleRIDetailType](docs/PUTScheduleRIDetailType.md)
- [Zuora::PUTSendUserAccessRequestResponseType](docs/PUTSendUserAccessRequestResponseType.md)
- [Zuora::PUTSendUserAccessRequestType](docs/PUTSendUserAccessRequestType.md)
- [Zuora::PUTSpecificDateAllocationType](docs/PUTSpecificDateAllocationType.md)
- [Zuora::PUTSrpAddType](docs/PUTSrpAddType.md)
- [Zuora::PUTSrpRemoveType](docs/PUTSrpRemoveType.md)
- [Zuora::PUTSrpUpdateType](docs/PUTSrpUpdateType.md)
- [Zuora::PUTSubscriptionPatchRequestType](docs/PUTSubscriptionPatchRequestType.md)
- [Zuora::PUTSubscriptionPatchRequestTypeCharges](docs/PUTSubscriptionPatchRequestTypeCharges.md)
- [Zuora::PUTSubscriptionPatchRequestTypeRatePlans](docs/PUTSubscriptionPatchRequestTypeRatePlans.md)
- [Zuora::PUTSubscriptionPreviewInvoiceItemsType](docs/PUTSubscriptionPreviewInvoiceItemsType.md)
- [Zuora::PUTSubscriptionResponseType](docs/PUTSubscriptionResponseType.md)
- [Zuora::PUTSubscriptionResponseTypeChargeMetrics](docs/PUTSubscriptionResponseTypeChargeMetrics.md)
- [Zuora::PUTSubscriptionResponseTypeCreditMemo](docs/PUTSubscriptionResponseTypeCreditMemo.md)
- [Zuora::PUTSubscriptionResumeResponseType](docs/PUTSubscriptionResumeResponseType.md)
- [Zuora::PUTSubscriptionResumeType](docs/PUTSubscriptionResumeType.md)
- [Zuora::PUTSubscriptionSuspendResponseType](docs/PUTSubscriptionSuspendResponseType.md)
- [Zuora::PUTSubscriptionSuspendType](docs/PUTSubscriptionSuspendType.md)
- [Zuora::PUTSubscriptionType](docs/PUTSubscriptionType.md)
- [Zuora::PUTTaxationItemType](docs/PUTTaxationItemType.md)
- [Zuora::PUTVerifyPaymentMethodResponseType](docs/PUTVerifyPaymentMethodResponseType.md)
- [Zuora::PUTVerifyPaymentMethodType](docs/PUTVerifyPaymentMethodType.md)
- [Zuora::PUTVerifyPaymentMethodTypeGatewayOptions](docs/PUTVerifyPaymentMethodTypeGatewayOptions.md)
- [Zuora::PaymentCollectionResponseType](docs/PaymentCollectionResponseType.md)
- [Zuora::PaymentDebitMemoApplicationApplyRequestType](docs/PaymentDebitMemoApplicationApplyRequestType.md)
- [Zuora::PaymentDebitMemoApplicationCreateRequestType](docs/PaymentDebitMemoApplicationCreateRequestType.md)
- [Zuora::PaymentDebitMemoApplicationItemApplyRequestType](docs/PaymentDebitMemoApplicationItemApplyRequestType.md)
- [Zuora::PaymentDebitMemoApplicationItemCreateRequestType](docs/PaymentDebitMemoApplicationItemCreateRequestType.md)
- [Zuora::PaymentDebitMemoApplicationItemUnapplyRequestType](docs/PaymentDebitMemoApplicationItemUnapplyRequestType.md)
- [Zuora::PaymentDebitMemoApplicationUnapplyRequestType](docs/PaymentDebitMemoApplicationUnapplyRequestType.md)
- [Zuora::PaymentInvoiceApplicationApplyRequestType](docs/PaymentInvoiceApplicationApplyRequestType.md)
- [Zuora::PaymentInvoiceApplicationCreateRequestType](docs/PaymentInvoiceApplicationCreateRequestType.md)
- [Zuora::PaymentInvoiceApplicationItemApplyRequestType](docs/PaymentInvoiceApplicationItemApplyRequestType.md)
- [Zuora::PaymentInvoiceApplicationItemCreateRequestType](docs/PaymentInvoiceApplicationItemCreateRequestType.md)
- [Zuora::PaymentInvoiceApplicationItemUnapplyRequestType](docs/PaymentInvoiceApplicationItemUnapplyRequestType.md)
- [Zuora::PaymentInvoiceApplicationUnapplyRequestType](docs/PaymentInvoiceApplicationUnapplyRequestType.md)
- [Zuora::PostBillingPreviewParam](docs/PostBillingPreviewParam.md)
- [Zuora::PostBillingPreviewRunParam](docs/PostBillingPreviewRunParam.md)
- [Zuora::PostCreditMemoEmailRequestType](docs/PostCreditMemoEmailRequestType.md)
- [Zuora::PostDebitMemoEmailType](docs/PostDebitMemoEmailType.md)
- [Zuora::PostGenerateBillingDocumentType](docs/PostGenerateBillingDocumentType.md)
- [Zuora::PostInvoiceEmailRequestType](docs/PostInvoiceEmailRequestType.md)
- [Zuora::PostNonRefRefundType](docs/PostNonRefRefundType.md)
- [Zuora::PostNonRefRefundTypeFinanceInformation](docs/PostNonRefRefundTypeFinanceInformation.md)
- [Zuora::PostRefundType](docs/PostRefundType.md)
- [Zuora::PostRefundTypeFinanceInformation](docs/PostRefundTypeFinanceInformation.md)
- [Zuora::PreviewAccountInfo](docs/PreviewAccountInfo.md)
- [Zuora::PreviewContactInfo](docs/PreviewContactInfo.md)
- [Zuora::PreviewOptions](docs/PreviewOptions.md)
- [Zuora::PreviewResult](docs/PreviewResult.md)
- [Zuora::PreviewResultChargeMetrics](docs/PreviewResultChargeMetrics.md)
- [Zuora::PreviewResultCreditMemos](docs/PreviewResultCreditMemos.md)
- [Zuora::PreviewResultInvoices](docs/PreviewResultInvoices.md)
- [Zuora::PreviewResultOrderActions](docs/PreviewResultOrderActions.md)
- [Zuora::PreviewResultOrderMetrics](docs/PreviewResultOrderMetrics.md)
- [Zuora::PriceChangeParams](docs/PriceChangeParams.md)
- [Zuora::PricingOverride](docs/PricingOverride.md)
- [Zuora::PricingUpdate](docs/PricingUpdate.md)
- [Zuora::ProcessingOptions](docs/ProcessingOptions.md)
- [Zuora::ProvisionEntityResponseType](docs/ProvisionEntityResponseType.md)
- [Zuora::ProxyActionamendRequest](docs/ProxyActionamendRequest.md)
- [Zuora::ProxyActionamendResponse](docs/ProxyActionamendResponse.md)
- [Zuora::ProxyActioncreateRequest](docs/ProxyActioncreateRequest.md)
- [Zuora::ProxyActioncreateResponse](docs/ProxyActioncreateResponse.md)
- [Zuora::ProxyActiondeleteRequest](docs/ProxyActiondeleteRequest.md)
- [Zuora::ProxyActiondeleteResponse](docs/ProxyActiondeleteResponse.md)
- [Zuora::ProxyActionexecuteRequest](docs/ProxyActionexecuteRequest.md)
- [Zuora::ProxyActionexecuteResponse](docs/ProxyActionexecuteResponse.md)
- [Zuora::ProxyActiongenerateRequest](docs/ProxyActiongenerateRequest.md)
- [Zuora::ProxyActiongenerateResponse](docs/ProxyActiongenerateResponse.md)
- [Zuora::ProxyActionqueryMoreRequest](docs/ProxyActionqueryMoreRequest.md)
- [Zuora::ProxyActionqueryMoreResponse](docs/ProxyActionqueryMoreResponse.md)
- [Zuora::ProxyActionqueryRequest](docs/ProxyActionqueryRequest.md)
- [Zuora::ProxyActionqueryResponse](docs/ProxyActionqueryResponse.md)
- [Zuora::ProxyActionsubscribeRequest](docs/ProxyActionsubscribeRequest.md)
- [Zuora::ProxyActionsubscribeResponse](docs/ProxyActionsubscribeResponse.md)
- [Zuora::ProxyActionupdateRequest](docs/ProxyActionupdateRequest.md)
- [Zuora::ProxyActionupdateResponse](docs/ProxyActionupdateResponse.md)
- [Zuora::ProxyBadRequestResponse](docs/ProxyBadRequestResponse.md)
- [Zuora::ProxyBadRequestResponseErrors](docs/ProxyBadRequestResponseErrors.md)
- [Zuora::ProxyCreateAccount](docs/ProxyCreateAccount.md)
- [Zuora::ProxyCreateAmendment](docs/ProxyCreateAmendment.md)
- [Zuora::ProxyCreateAmendmentRatePlanData](docs/ProxyCreateAmendmentRatePlanData.md)
- [Zuora::ProxyCreateAmendmentRatePlanDataRatePlan](docs/ProxyCreateAmendmentRatePlanDataRatePlan.md)
- [Zuora::ProxyCreateBillRun](docs/ProxyCreateBillRun.md)
- [Zuora::ProxyCreateContact](docs/ProxyCreateContact.md)
- [Zuora::ProxyCreateExport](docs/ProxyCreateExport.md)
- [Zuora::ProxyCreateInvoiceAdjustment](docs/ProxyCreateInvoiceAdjustment.md)
- [Zuora::ProxyCreateInvoicePayment](docs/ProxyCreateInvoicePayment.md)
- [Zuora::ProxyCreateOrModifyResponse](docs/ProxyCreateOrModifyResponse.md)
- [Zuora::ProxyCreatePayment](docs/ProxyCreatePayment.md)
- [Zuora::ProxyCreatePaymentGatewayOptionData](docs/ProxyCreatePaymentGatewayOptionData.md)
- [Zuora::ProxyCreatePaymentMethod](docs/ProxyCreatePaymentMethod.md)
- [Zuora::ProxyCreateProduct](docs/ProxyCreateProduct.md)
- [Zuora::ProxyCreateProductRatePlan](docs/ProxyCreateProductRatePlan.md)
- [Zuora::ProxyCreateRefund](docs/ProxyCreateRefund.md)
- [Zuora::ProxyCreateRefundRefundInvoicePaymentData](docs/ProxyCreateRefundRefundInvoicePaymentData.md)
- [Zuora::ProxyCreateTaxationItem](docs/ProxyCreateTaxationItem.md)
- [Zuora::ProxyCreateUnitOfMeasure](docs/ProxyCreateUnitOfMeasure.md)
- [Zuora::ProxyCreateUsage](docs/ProxyCreateUsage.md)
- [Zuora::ProxyDeleteResponse](docs/ProxyDeleteResponse.md)
- [Zuora::ProxyGetAccount](docs/ProxyGetAccount.md)
- [Zuora::ProxyGetAmendment](docs/ProxyGetAmendment.md)
- [Zuora::ProxyGetBillRun](docs/ProxyGetBillRun.md)
- [Zuora::ProxyGetCommunicationProfile](docs/ProxyGetCommunicationProfile.md)
- [Zuora::ProxyGetContact](docs/ProxyGetContact.md)
- [Zuora::ProxyGetCreditBalanceAdjustment](docs/ProxyGetCreditBalanceAdjustment.md)
- [Zuora::ProxyGetExport](docs/ProxyGetExport.md)
- [Zuora::ProxyGetFeature](docs/ProxyGetFeature.md)
- [Zuora::ProxyGetImport](docs/ProxyGetImport.md)
- [Zuora::ProxyGetInvoice](docs/ProxyGetInvoice.md)
- [Zuora::ProxyGetInvoiceAdjustment](docs/ProxyGetInvoiceAdjustment.md)
- [Zuora::ProxyGetInvoiceItem](docs/ProxyGetInvoiceItem.md)
- [Zuora::ProxyGetInvoiceItemAdjustment](docs/ProxyGetInvoiceItemAdjustment.md)
- [Zuora::ProxyGetInvoicePayment](docs/ProxyGetInvoicePayment.md)
- [Zuora::ProxyGetInvoiceSplit](docs/ProxyGetInvoiceSplit.md)
- [Zuora::ProxyGetInvoiceSplitItem](docs/ProxyGetInvoiceSplitItem.md)
- [Zuora::ProxyGetPayment](docs/ProxyGetPayment.md)
- [Zuora::ProxyGetPaymentMethod](docs/ProxyGetPaymentMethod.md)
- [Zuora::ProxyGetPaymentMethodSnapshot](docs/ProxyGetPaymentMethodSnapshot.md)
- [Zuora::ProxyGetPaymentMethodTransactionLog](docs/ProxyGetPaymentMethodTransactionLog.md)
- [Zuora::ProxyGetPaymentTransactionLog](docs/ProxyGetPaymentTransactionLog.md)
- [Zuora::ProxyGetProduct](docs/ProxyGetProduct.md)
- [Zuora::ProxyGetProductFeature](docs/ProxyGetProductFeature.md)
- [Zuora::ProxyGetProductRatePlan](docs/ProxyGetProductRatePlan.md)
- [Zuora::ProxyGetProductRatePlanCharge](docs/ProxyGetProductRatePlanCharge.md)
- [Zuora::ProxyGetProductRatePlanChargeTier](docs/ProxyGetProductRatePlanChargeTier.md)
- [Zuora::ProxyGetRatePlan](docs/ProxyGetRatePlan.md)
- [Zuora::ProxyGetRatePlanCharge](docs/ProxyGetRatePlanCharge.md)
- [Zuora::ProxyGetRatePlanChargeTier](docs/ProxyGetRatePlanChargeTier.md)
- [Zuora::ProxyGetRefund](docs/ProxyGetRefund.md)
- [Zuora::ProxyGetRefundInvoicePayment](docs/ProxyGetRefundInvoicePayment.md)
- [Zuora::ProxyGetRefundTransactionLog](docs/ProxyGetRefundTransactionLog.md)
- [Zuora::ProxyGetSubscription](docs/ProxyGetSubscription.md)
- [Zuora::ProxyGetSubscriptionProductFeature](docs/ProxyGetSubscriptionProductFeature.md)
- [Zuora::ProxyGetTaxationItem](docs/ProxyGetTaxationItem.md)
- [Zuora::ProxyGetUnitOfMeasure](docs/ProxyGetUnitOfMeasure.md)
- [Zuora::ProxyGetUsage](docs/ProxyGetUsage.md)
- [Zuora::ProxyModifyAccount](docs/ProxyModifyAccount.md)
- [Zuora::ProxyModifyAmendment](docs/ProxyModifyAmendment.md)
- [Zuora::ProxyModifyBillRun](docs/ProxyModifyBillRun.md)
- [Zuora::ProxyModifyContact](docs/ProxyModifyContact.md)
- [Zuora::ProxyModifyInvoice](docs/ProxyModifyInvoice.md)
- [Zuora::ProxyModifyInvoiceAdjustment](docs/ProxyModifyInvoiceAdjustment.md)
- [Zuora::ProxyModifyInvoicePayment](docs/ProxyModifyInvoicePayment.md)
- [Zuora::ProxyModifyPayment](docs/ProxyModifyPayment.md)
- [Zuora::ProxyModifyPaymentMethod](docs/ProxyModifyPaymentMethod.md)
- [Zuora::ProxyModifyProduct](docs/ProxyModifyProduct.md)
- [Zuora::ProxyModifyProductRatePlan](docs/ProxyModifyProductRatePlan.md)
- [Zuora::ProxyModifyRefund](docs/ProxyModifyRefund.md)
- [Zuora::ProxyModifySubscription](docs/ProxyModifySubscription.md)
- [Zuora::ProxyModifyTaxationItem](docs/ProxyModifyTaxationItem.md)
- [Zuora::ProxyModifyUnitOfMeasure](docs/ProxyModifyUnitOfMeasure.md)
- [Zuora::ProxyModifyUsage](docs/ProxyModifyUsage.md)
- [Zuora::ProxyNoDataResponse](docs/ProxyNoDataResponse.md)
- [Zuora::PutCreditMemoTaxItemType](docs/PutCreditMemoTaxItemType.md)
- [Zuora::PutCreditMemoTaxItemTypeFinanceInformation](docs/PutCreditMemoTaxItemTypeFinanceInformation.md)
- [Zuora::PutDebitMemoTaxItemType](docs/PutDebitMemoTaxItemType.md)
- [Zuora::PutDebitMemoTaxItemTypeFinanceInformation](docs/PutDebitMemoTaxItemTypeFinanceInformation.md)
- [Zuora::PutReverseInvoiceResponseType](docs/PutReverseInvoiceResponseType.md)
- [Zuora::PutReverseInvoiceResponseTypeCreditMemo](docs/PutReverseInvoiceResponseTypeCreditMemo.md)
- [Zuora::PutReverseInvoiceType](docs/PutReverseInvoiceType.md)
- [Zuora::RatePlan](docs/RatePlan.md)
- [Zuora::RatePlanChargeData](docs/RatePlanChargeData.md)
- [Zuora::RatePlanChargeDataInRatePlanData](docs/RatePlanChargeDataInRatePlanData.md)
- [Zuora::RatePlanChargeDataInRatePlanDataRatePlanCharge](docs/RatePlanChargeDataInRatePlanDataRatePlanCharge.md)
- [Zuora::RatePlanChargeDataRatePlanCharge](docs/RatePlanChargeDataRatePlanCharge.md)
- [Zuora::RatePlanChargeTier](docs/RatePlanChargeTier.md)
- [Zuora::RatePlanData](docs/RatePlanData.md)
- [Zuora::RatePlanDataRatePlan](docs/RatePlanDataRatePlan.md)
- [Zuora::RatePlanDataSubscriptionProductFeatureList](docs/RatePlanDataSubscriptionProductFeatureList.md)
- [Zuora::RatePlanOverride](docs/RatePlanOverride.md)
- [Zuora::RatePlanUpdate](docs/RatePlanUpdate.md)
- [Zuora::RatedItem](docs/RatedItem.md)
- [Zuora::RefundCreditMemoItemType](docs/RefundCreditMemoItemType.md)
- [Zuora::RefundInvoicePayment](docs/RefundInvoicePayment.md)
- [Zuora::RefundPartResponseType](docs/RefundPartResponseType.md)
- [Zuora::RefundPartResponseTypewithSuccess](docs/RefundPartResponseTypewithSuccess.md)
- [Zuora::RemoveProduct](docs/RemoveProduct.md)
- [Zuora::RenewalTerm](docs/RenewalTerm.md)
- [Zuora::RevenueScheduleItemType](docs/RevenueScheduleItemType.md)
- [Zuora::SaveResult](docs/SaveResult.md)
- [Zuora::SubscribeRequest](docs/SubscribeRequest.md)
- [Zuora::SubscribeRequestAccount](docs/SubscribeRequestAccount.md)
- [Zuora::SubscribeRequestBillToContact](docs/SubscribeRequestBillToContact.md)
- [Zuora::SubscribeRequestPaymentMethod](docs/SubscribeRequestPaymentMethod.md)
- [Zuora::SubscribeRequestPaymentMethodGatewayOptionData](docs/SubscribeRequestPaymentMethodGatewayOptionData.md)
- [Zuora::SubscribeRequestPreviewOptions](docs/SubscribeRequestPreviewOptions.md)
- [Zuora::SubscribeRequestSoldToContact](docs/SubscribeRequestSoldToContact.md)
- [Zuora::SubscribeRequestSubscribeOptions](docs/SubscribeRequestSubscribeOptions.md)
- [Zuora::SubscribeRequestSubscribeOptionsElectronicPaymentOptions](docs/SubscribeRequestSubscribeOptionsElectronicPaymentOptions.md)
- [Zuora::SubscribeRequestSubscribeOptionsExternalPaymentOptions](docs/SubscribeRequestSubscribeOptionsExternalPaymentOptions.md)
- [Zuora::SubscribeRequestSubscribeOptionsSubscribeInvoiceProcessingOptions](docs/SubscribeRequestSubscribeOptionsSubscribeInvoiceProcessingOptions.md)
- [Zuora::SubscribeRequestSubscriptionData](docs/SubscribeRequestSubscriptionData.md)
- [Zuora::SubscribeRequestSubscriptionDataSubscription](docs/SubscribeRequestSubscriptionDataSubscription.md)
- [Zuora::SubscribeResult](docs/SubscribeResult.md)
- [Zuora::SubscribeResultChargeMetricsData](docs/SubscribeResultChargeMetricsData.md)
- [Zuora::SubscribeResultInvoiceResult](docs/SubscribeResultInvoiceResult.md)
- [Zuora::SubscriptionProductFeature](docs/SubscriptionProductFeature.md)
- [Zuora::SubscriptionProductFeatureList](docs/SubscriptionProductFeatureList.md)
- [Zuora::SubscriptionRatedResult](docs/SubscriptionRatedResult.md)
- [Zuora::TaxInfo](docs/TaxInfo.md)
- [Zuora::Terms](docs/Terms.md)
- [Zuora::TermsAndConditions](docs/TermsAndConditions.md)
- [Zuora::TimeSlicedMetrics](docs/TimeSlicedMetrics.md)
- [Zuora::TimeSlicedNetMetrics](docs/TimeSlicedNetMetrics.md)
- [Zuora::TimeSlicedTcbNetMetrics](docs/TimeSlicedTcbNetMetrics.md)
- [Zuora::TokenResponse](docs/TokenResponse.md)
- [Zuora::TransferPaymentType](docs/TransferPaymentType.md)
- [Zuora::TriggerDates](docs/TriggerDates.md)
- [Zuora::TriggerDatesInner](docs/TriggerDatesInner.md)
- [Zuora::TriggerParams](docs/TriggerParams.md)
- [Zuora::UnapplyCreditMemoType](docs/UnapplyCreditMemoType.md)
- [Zuora::UnapplyPaymentType](docs/UnapplyPaymentType.md)
- [Zuora::UpdateEntityResponseType](docs/UpdateEntityResponseType.md)
- [Zuora::UpdateEntityType](docs/UpdateEntityType.md)
- [Zuora::UpdatePaymentType](docs/UpdatePaymentType.md)
- [Zuora::ZObject](docs/ZObject.md)
- [Zuora::ZObjectUpdate](docs/ZObjectUpdate.md)
- [Zuora::GetCreditMemoAmountBreakdownByOrderResponse](docs/GetCreditMemoAmountBreakdownByOrderResponse.md)
- [Zuora::GetInvoiceAmountBreakdownByOrderResponse](docs/GetInvoiceAmountBreakdownByOrderResponse.md)
- [Zuora::GetOrderBillingInfoResponseType](docs/GetOrderBillingInfoResponseType.md)
- [Zuora::GetOrderRatedResultResponseType](docs/GetOrderRatedResultResponseType.md)
- [Zuora::GetOrderResponse](docs/GetOrderResponse.md)
- [Zuora::GetOrdersResponse](docs/GetOrdersResponse.md)
- [Zuora::PostOrderPreviewResponseType](docs/PostOrderPreviewResponseType.md)
- [Zuora::PostOrderResponseType](docs/PostOrderResponseType.md)
- [Zuora::RecurringFlatFeePricingOverride](docs/RecurringFlatFeePricingOverride.md)
- [Zuora::RecurringFlatFeePricingUpdate](docs/RecurringFlatFeePricingUpdate.md)
- [Zuora::RecurringPerUnitPricingOverride](docs/RecurringPerUnitPricingOverride.md)
- [Zuora::RecurringPerUnitPricingUpdate](docs/RecurringPerUnitPricingUpdate.md)
- [Zuora::RecurringTieredPricingOverride](docs/RecurringTieredPricingOverride.md)
- [Zuora::RecurringTieredPricingUpdate](docs/RecurringTieredPricingUpdate.md)
- [Zuora::RecurringVolumePricingOverride](docs/RecurringVolumePricingOverride.md)
- [Zuora::RecurringVolumePricingUpdate](docs/RecurringVolumePricingUpdate.md)
- [Zuora::UsageFlatFeePricingOverride](docs/UsageFlatFeePricingOverride.md)
- [Zuora::UsageFlatFeePricingUpdate](docs/UsageFlatFeePricingUpdate.md)
- [Zuora::UsageOveragePricingOverride](docs/UsageOveragePricingOverride.md)
- [Zuora::UsageOveragePricingUpdate](docs/UsageOveragePricingUpdate.md)
- [Zuora::UsagePerUnitPricingOverride](docs/UsagePerUnitPricingOverride.md)
- [Zuora::UsagePerUnitPricingUpdate](docs/UsagePerUnitPricingUpdate.md)
- [Zuora::UsageTieredPricingOverride](docs/UsageTieredPricingOverride.md)
- [Zuora::UsageTieredPricingUpdate](docs/UsageTieredPricingUpdate.md)
- [Zuora::UsageTieredWithOveragePricingOverride](docs/UsageTieredWithOveragePricingOverride.md)
- [Zuora::UsageTieredWithOveragePricingUpdate](docs/UsageTieredWithOveragePricingUpdate.md)
- [Zuora::UsageVolumePricingOverride](docs/UsageVolumePricingOverride.md)
- [Zuora::UsageVolumePricingUpdate](docs/UsageVolumePricingUpdate.md)


## Documentation for Authorization

All endpoints do not require authorization.

